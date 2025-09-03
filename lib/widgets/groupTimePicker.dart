import 'package:ceia_comigo/widgets/groupTextButton.dart';
import 'package:ceia_comigo/widgets/groupTextContainer.dart';
import 'package:flutter/material.dart';

class GroupTimePicker extends StatefulWidget {
  //TODO display message to prevent picking an out of time hour
  DateTime? newDate;
  TimeOfDay? newTime;
  void Function(DateTime, TimeOfDay) onTimePicked;
  String title = "Schedule this reservation";

  GroupTimePicker({
    required this.onTimePicked,
    this.newDate,
    this.newTime,
    this.title = "Schedule this reservation",
  });

  _GroupTimePickerState createState() => _GroupTimePickerState();
}

class _GroupTimePickerState extends State<GroupTimePicker> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  bool hasPickedTime = false;
  Future<TimeOfDay> _selectTime(
    BuildContext context,
    DateTime? newDate,
    TimeOfDay? newTime,
  ) async {
    if (newDate != null) selectedDate = newDate;
    if (newTime != null) selectedTime = newTime;
    if (newTime == null && !hasPickedTime)
      selectedTime = TimeOfDay(
        hour: (TimeOfDay.now().hour + 2) % 24,
        minute: TimeOfDay.now().minute,
      );
    TimeOfDay pickedTime = selectedTime;
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked.isAfter(selectedTime)) {
      pickedTime = picked;
    }
    return pickedTime;
  }

  Future<void> _selectDate(BuildContext context) async {
    TimeOfDay timePicked;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      timePicked = await _selectTime(context, widget.newDate, widget.newTime);
      setState(() {
        selectedDate = picked;
        selectedTime = timePicked;
        hasPickedTime = true;
      });
    }
  }

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          GroupTextButton(
            text: widget.title,
            onPressed: () {
              _selectDate(context);
            },
            icon: Icon(Icons.calendar_month),
          ),
          if (hasPickedTime)
            Column(
              children: [
                GroupTextContainer(
                  text:
                      "${selectedTime.format(context)} : ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                ),
                SizedBox(height: 10),
              ],
            ),
        ],
      ),
    );
  }
}
