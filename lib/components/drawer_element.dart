// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';

class DrawerElement extends StatefulWidget {
  final String elementTitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const DrawerElement({
    required this.elementTitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  _DrawerElementState createState() => _DrawerElementState();
}

class _DrawerElementState extends State<DrawerElement> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: widget.isSelected
                ? Theme.of(context).colorScheme.secondary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            border: widget.isSelected
                ? Border.all(
                    color: Theme.of(context).colorScheme.primary, width: 1)
                : null),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: widget.isSelected
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.tertiary,
              size: 30,
            ),
            SizedBox(width: 20),
            Text(
              widget.elementTitle,
              style: TextStyle(
                  color: widget.isSelected
                      ? Theme.of(context).colorScheme.inversePrimary
                      : Theme.of(context).colorScheme.tertiary,
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
