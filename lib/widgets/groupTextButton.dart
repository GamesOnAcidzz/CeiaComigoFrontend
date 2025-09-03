import 'package:flutter/material.dart';

class GroupTextButton extends StatelessWidget {
  String text;
  bool isFullWIdth = false;
  final void Function() onPressed;
  Widget? icon;

  GroupTextButton({
    required this.text,
    required this.onPressed,
    this.isFullWIdth = false,
    this.icon,
  });

  @override
  Widget build(context) {
    return Container(
      width: isFullWIdth ? double.infinity : null,
      child: Card(
        color: Theme.of(context).colorScheme.secondaryContainer,
        elevation: 0,
        child: TextButton.icon(
          icon: icon,
          onPressed: onPressed,
          label: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}
