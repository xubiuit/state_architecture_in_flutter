/*
  Step 1: import required lib

  Step 2: run app by main method -> required

  Step 3: Create StatelessWidget then return the method build of MaterialApp,
  HOME attribute is a Statefull widget

  Step 4: By default a StatefulWidget must return a State -> override method createState()
  by creating a new class which extends State

  Step 5: A State widget must return a Scaffold in build method

  Step 6: Future with async, add await, return Future.error

*/

import 'package:flutter/material.dart';
import 'package:state_architecture_in_flutter/home_view_state_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePageApp(),
    );
  }
}
