import 'package:flutter/material.dart';

class ChoiceBox extends StatelessWidget {
  final String mainText;
  final bool selected;

  const ChoiceBox({super.key, required this.mainText, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Theme.of(context).cardTheme.surfaceTintColor,
        border: Border.all(
          color: selected
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.primary,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color:
                Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 5),
          ),
        ],
      ),
      height: 52,
      width: 310,
      child: Center(
        child: Text(
          mainText,
          style: TextStyle(
            color: selected
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).cardTheme.color,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
