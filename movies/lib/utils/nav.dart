import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

pushReplacement(BuildContext context, Widget page) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    return page;
  }));
}

push(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return page;
  }));
}
