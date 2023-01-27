

import 'package:flutter/material.dart';
import 'package:categories_app/pages/screen_A.dart';
import 'package:categories_app/pages/screen_B.dart';
import 'package:categories_app/pages/screen_C.dart';
void main() {
  runApp(MaterialApp(
    // initialRoute: '/screen_A',
    // routes: {
    //     '/': (context) => screen_A(),
    //   '/screen_B' : (context) => screen_B(),
    //   '/screen_C': (context) => screen_C(),
    // },
    home: screen_A(),
  ));
}

