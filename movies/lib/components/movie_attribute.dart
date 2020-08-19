import 'package:flutter/material.dart';

class MovieAttribute extends StatelessWidget {
  final String title;
  final IconData iconName;

  const MovieAttribute({Key key, this.title, this.iconName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      child: Card(
        
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Icon(iconName, size: 45, color: Theme.of(context).primaryColor),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
