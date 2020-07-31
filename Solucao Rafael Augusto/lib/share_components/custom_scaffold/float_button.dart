import 'package:flutter/material.dart';

Widget floatActionButton(Object onClick) => FloatingActionButton(
      onPressed: onClick,
      child: Icon(Icons.search),
      backgroundColor: Colors.white,
    );
