import 'package:ceia_comigo/models/group.dart';
import 'package:flutter/material.dart';

class GroupSearchCreateDetails extends StatefulWidget {
  Group currentGroup;
  void Function(Group group) onGroupUpdated;
  _GroupSearchCreateDetailsState createState() =>
      _GroupSearchCreateDetailsState();

  GroupSearchCreateDetails({
    required this.currentGroup,
    required this.onGroupUpdated,
  });
}

class _GroupSearchCreateDetailsState extends State<GroupSearchCreateDetails> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController groupNameController = TextEditingController();
  bool isPrivate = true;
  DateTime? currentDate;
  TimeOfDay? currentTime;

  @override
  Widget build(context) {
    return Container(
      color: Theme.of(context).colorScheme.onSecondaryContainer,
      padding: EdgeInsets.all(10),
      child: Card(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SegmentedDetailsButton(
              text: "Group privacy",
              trueValueText: "Private",
              falseValueText: "Public",
              onSelectedChange: (newSelected) {
                setState(() {
                  isPrivate = newSelected;
                });
              },
            ),

            TextDetail(
              text: "Name of the group",
              textController: groupNameController,
            ),
            RichTextDetail(
              text: "Description",
              textController: descriptionController,
            ),
            DateTimePickerDetail(
              newDate: currentDate,
              newTime: currentTime,
              onDateTimePicked: (newDate, newTime) {
                setState(() {
                  currentDate = newDate;
                  currentTime = newTime;
                });
              },
            ),
            if (!isPrivate) CounterDetails(text: "Number of people"),
          ],
        ),
      ),
    );
  }
}

class TextDetail extends StatefulWidget {
  String text;
  TextEditingController? textController = TextEditingController();

  TextDetail({required this.text, this.textController});

  _TextDetailState createState() => _TextDetailState();
}

class _TextDetailState extends State<TextDetail> {
  bool isChecked = false;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        _focusNode.requestFocus();
      },
      child: Container(
        width: double.infinity,
        color: isChecked
            ? Theme.of(context).colorScheme.secondaryContainer
            : Theme.of(context).colorScheme.onSecondaryContainer,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              spacing: 10,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    color: isChecked
                        ? Theme.of(context).colorScheme.onSecondaryContainer
                        : Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: widget.textController,
                    maxLength: 16,
                    decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                    ),
                    cursorColor: isChecked
                        ? Theme.of(context).colorScheme.onSecondaryContainer
                        : Theme.of(context).colorScheme.onSecondary,

                    focusNode: _focusNode,
                    onChanged: (newText) {
                      setState(() {
                        isChecked = newText.isNotEmpty;
                      });
                    },
                    maxLines: 1,
                    style: TextStyle(
                      color: isChecked
                          ? Theme.of(context).colorScheme.onSecondaryContainer
                          : Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
                Icon(
                  isChecked ? Icons.check : Icons.question_mark,
                  color: isChecked
                      ? Theme.of(context).colorScheme.onSecondaryContainer
                      : Theme.of(context).colorScheme.onSecondary,
                ),
              ],
            ),
            Divider(
              thickness: 4,
              height: 2,
              color: Theme.of(context).colorScheme.shadow,
            ),
          ],
        ),
      ),
    );
  }
}

class RichTextDetail extends StatefulWidget {
  String text;
  TextEditingController? textController = TextEditingController();

  RichTextDetail({required this.text, this.textController});

  _RichTextDetailState createState() => _RichTextDetailState();
}

class _RichTextDetailState extends State<RichTextDetail> {
  bool isChecked = false;
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        _focusNode.requestFocus();
      },
      child: Container(
        width: double.infinity,
        color: isChecked
            ? Theme.of(context).colorScheme.secondaryContainer
            : Theme.of(context).colorScheme.onSecondaryContainer,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              spacing: 10,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    color: isChecked
                        ? Theme.of(context).colorScheme.onSecondaryContainer
                        : Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    controller: widget.textController,
                    maxLength: 256,
                    decoration: InputDecoration(
                      counterText: (isChecked && _isFocused) ? null : "",
                      border: InputBorder.none,
                    ),
                    cursorColor: isChecked
                        ? Theme.of(context).colorScheme.onSecondaryContainer
                        : Theme.of(context).colorScheme.onSecondary,

                    focusNode: _focusNode,
                    onChanged: (newText) {
                      setState(() {
                        isChecked = newText.isNotEmpty;
                      });
                    },
                    maxLines: _isFocused ? null : 1,
                    style: TextStyle(
                      color: isChecked
                          ? Theme.of(context).colorScheme.onSecondaryContainer
                          : Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      isChecked ? Icons.check : Icons.question_mark,
                      color: isChecked
                          ? Theme.of(context).colorScheme.onSecondaryContainer
                          : Theme.of(context).colorScheme.onSecondary,
                    ),
                    if (isChecked && _isFocused)
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _focusNode.unfocus();
                          });
                        },
                        icon: Icon(Icons.maximize_outlined),
                        color: isChecked
                            ? Theme.of(context).colorScheme.onSecondaryContainer
                            : Theme.of(context).colorScheme.onSecondary,
                      ),
                    if (isChecked && _isFocused)
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.textController?.text = "";
                            isChecked = false;
                          });
                        },
                        icon: Icon(Icons.clear),
                        color: isChecked
                            ? Theme.of(context).colorScheme.onSecondaryContainer
                            : Theme.of(context).colorScheme.onSecondary,
                      ),
                  ],
                ),
              ],
            ),
            Divider(
              thickness: 4,
              height: 2,
              color: Theme.of(context).colorScheme.shadow,
            ),
          ],
        ),
      ),
    );
  }
}

class SegmentedDetailsButton extends StatefulWidget {
  String text;
  String trueValueText;
  String falseValueText;
  void Function(bool) onSelectedChange;
  _SegmentedDetailsButtonState createState() => _SegmentedDetailsButtonState();

  SegmentedDetailsButton({
    required this.text,
    required this.trueValueText,
    required this.falseValueText,
    required this.onSelectedChange,
  });
}

class _SegmentedDetailsButtonState extends State<SegmentedDetailsButton> {
  bool isSelected = true;
  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.onSelectedChange(isSelected);
        });
      },
      child: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.secondaryContainer,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              spacing: 10,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
                Expanded(
                  child: SegmentedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color?>((
                        states,
                      ) {
                        if (states.contains(MaterialState.selected)) {
                          return Theme.of(context)
                              .colorScheme
                              .secondaryContainer; // Selected segment background
                        }
                        return Theme.of(context)
                            .colorScheme
                            .onSecondaryContainer; // Unselected segment background
                      }),
                      foregroundColor:
                          MaterialStateProperty.resolveWith<Color?>((states) {
                            return states.contains(MaterialState.selected)
                                ? Colors.white
                                : Colors.black;
                          }),
                    ),
                    segments: [
                      ButtonSegment<bool>(
                        value: true,
                        label: Text(
                          widget.trueValueText,
                          style: TextStyle(
                            color: isSelected
                                ? Theme.of(
                                    context,
                                  ).colorScheme.onSecondaryContainer
                                : Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ),
                      ButtonSegment<bool>(
                        value: false,
                        label: Text(
                          widget.falseValueText,
                          style: TextStyle(
                            color: !isSelected
                                ? Theme.of(
                                    context,
                                  ).colorScheme.onSecondaryContainer
                                : Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ),
                    ],
                    selected: {isSelected},
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 4,
              height: 2,
              color: Theme.of(context).colorScheme.shadow,
            ),
          ],
        ),
      ),
    );
  }
}

class DateTimePickerDetail extends StatefulWidget {
  DateTime? newDate;
  TimeOfDay? newTime;
  void Function(DateTime newDate, TimeOfDay newTime) onDateTimePicked;

  _DateTimePickerDetailState createState() => _DateTimePickerDetailState();
  DateTimePickerDetail({
    this.newDate,
    this.newTime,
    required this.onDateTimePicked,
  });
}

class _DateTimePickerDetailState extends State<DateTimePickerDetail> {
  bool isChecked = false;
  final FocusNode _focusNode = FocusNode();
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
    if (picked != null &&
        picked.isAfter(
          TimeOfDay(
            hour: (TimeOfDay.now().hour + 2) % 24,
            minute: TimeOfDay.now().minute,
          ),
        )) {
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
        isChecked = true;
      });
    }
  }

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        _focusNode.requestFocus();
        _selectDate(context);
      },
      child: Container(
        width: double.infinity,
        height: 48,
        color: isChecked
            ? Theme.of(context).colorScheme.secondaryContainer
            : Theme.of(context).colorScheme.onSecondaryContainer,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              spacing: 10,
              children: [
                Text(
                  "Date and time",
                  style: TextStyle(
                    color: isChecked
                        ? Theme.of(context).colorScheme.onSecondaryContainer
                        : Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isChecked
                          ? Theme.of(context).colorScheme.onSecondaryContainer
                          : Theme.of(context).colorScheme.onSecondary,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      hasPickedTime
                          ? "${selectedDate.day}/${selectedDate.month}/${selectedDate.year} : ${selectedTime.format(context)} "
                          : "Pick a date and time",
                      style: TextStyle(
                        color: !isChecked
                            ? Theme.of(context).colorScheme.onSecondaryContainer
                            : Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ),
                Icon(
                  isChecked ? Icons.check : Icons.question_mark,
                  color: isChecked
                      ? Theme.of(context).colorScheme.onSecondaryContainer
                      : Theme.of(context).colorScheme.onSecondary,
                ),
              ],
            ),
            Divider(
              thickness: 4,
              height: 2,
              color: Theme.of(context).colorScheme.shadow,
            ),
          ],
        ),
      ),
    );
  }
}

class CounterDetails extends StatefulWidget {
  String text;
  int currentValue = 2;
  int minValue = 2;
  int maxValue = 50;

  CounterDetails({
    required this.text,
    this.currentValue = 2,
    this.minValue = 2,
    this.maxValue = 50,
  });

  _CounterDetailsState createState() => _CounterDetailsState();
}

class _CounterDetailsState extends State<CounterDetails> {
  bool isChecked = false;
  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.secondaryContainer,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            spacing: 10,
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      onPressed: () {
                        setState(() {
                          if (widget.currentValue > widget.minValue)
                            widget.currentValue--;
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                    SizedBox(
                      width: 20,
                      child: Text(
                        textAlign: TextAlign.center,
                        widget.currentValue.toString(),
                      ),
                    ),
                    IconButton(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      onPressed: () {
                        setState(() {
                          if (widget.currentValue < widget.maxValue)
                            widget.currentValue++;
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            thickness: 4,
            height: 2,
            color: Theme.of(context).colorScheme.shadow,
          ),
        ],
      ),
    );
  }
}
