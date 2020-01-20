import 'package:flutter/material.dart';
import 'package:state_architecture_in_flutter/home_datamodel.dart';

class HomeView {
  final model = HomeModel();

  Widget getLoadingCircle() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getItem(index, listData) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.5),
      decoration: BoxDecoration(
          color: Colors.orange[400],
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Center(
        child: Text(
          listData[index],
          style: TextStyle(color: Colors.grey[700]),
        ),
      ),
    );
  }

  Widget getListItem(home_model) {
    return ListView.builder(
      itemCount: home_model.listData.length,
      itemBuilder: (BuildContext context, index) => getItem(index, home_model.listData),
    );
  }

  Widget getSystemMessage(String message) {
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style:
            TextStyle(color: Colors.orange[600], fontWeight: FontWeight.bold),
      ),
    );
  }

}