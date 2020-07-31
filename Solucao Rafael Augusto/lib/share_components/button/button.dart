import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Object onClick;
  final String title;

  const CustomButton({Key key, this.onClick, this.title}) : super(key: key);

  _decorationButton(BuildContext context) => BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20.0),
      );

  @override
  Widget build(BuildContext context) => FlatButton(
        onPressed: onClick,
        child: Container(
          width: double.infinity,
          height: 45,
          decoration: _decorationButton(context),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
}
