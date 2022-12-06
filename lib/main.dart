//Nama  : Luthfiyyah Nurhasanah
//NIM   : 124200016

import 'package:flutter/material.dart';
import 'menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piala Dunia 2022',
      home: Scaffold(
        body: Menu(),
      ),
    );
  }
}

