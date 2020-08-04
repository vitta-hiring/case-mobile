import 'package:flutter/material.dart';

class OutlineIconButton extends StatelessWidget {
  final Function callback;
  final IconData icon;
  final Color iconColor;
  final Color color;
  final Color borderColor;
  final double size;

  OutlineIconButton({
    @required this.icon,
    @required this.iconColor,
    @required this.color,
    @required this.borderColor,
    @required this.size,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      shadowColor: Colors.transparent,
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          color: borderColor,
          shape: BoxShape.circle,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(1000.0),
          onTap: callback,
          child: Container(
            margin: EdgeInsets.all(4.0),
            padding: EdgeInsets.all(6.0),
            // color: color,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: size,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
