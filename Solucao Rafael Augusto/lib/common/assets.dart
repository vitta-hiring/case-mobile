import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final String dirAssetImg = 'assets/images/';
final String dirAssset = 'assets/';

image(String img) => AssetImage("$dirAssetImg$img");
asset(String file) async => await rootBundle.loadString("$dirAssset$file");
