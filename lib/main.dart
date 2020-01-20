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


/*
class MyHomePageAppStatefull extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePageAppStatefull> {
  List<String> _stateData;
  bool get isLoading => _stateData == null;
  bool hasError = false;
  bool hasNoData = false;

  Future<List<String>> _getListData() async {
    await Future.delayed(Duration(seconds: 2));
    if (hasError) {
      return Future.error('Some thing bad');
    }
    return List.generate(hasNoData ? 0 : 20,
        (index) => 'Item from _getListData() with ${index}');
  }

  Widget _getItem(index) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.5),
      decoration: BoxDecoration(
          color: Colors.orange[400],
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Center(
        child: Text(
          _stateData[index],
          style: TextStyle(color: Colors.grey[700]),
        ),
      ),
    );
  }

  Widget _getListItem() {
    return isLoading
        ? _getLoadingCircle()
        : ListView.builder(
            itemCount: _stateData.length,
            itemBuilder: (BuildContext context, index) => _getItem(index),
          );
  }

  Widget _getLoadingCircle() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  void initState() {
    _getListData()
        .then((data) => setState(() {
              if (data.length == 0) {
                data.add('No data found. Add something and check back.');
              }
              _stateData = data;
            }))
        .catchError((error) => setState(() => _stateData = [error]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _getListItem(),
      ),
    );
  }
}
*/