import 'package:flutter/material.dart';

Widget buttonBack(BuildContext context) => GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Icon(
        Icons.arrow_back_ios,
        size: 16,
      ),
    );
