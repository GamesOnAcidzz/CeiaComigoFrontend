import 'package:ceia_comigo/views/groups/groupLobby.dart';
import 'package:flutter/material.dart';

class GroupTextContainer extends StatelessWidget {
  String text = '';
  double fontSize = 16;

  GroupTextContainer({required this.text, this.fontSize = 16});

  @override
  Widget build(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}
