import 'package:flutter/material.dart';

class ImageLoader {
  static Image fromAsset(String name) {
    return Image.asset('assets/images/$name.png');
  }
}
