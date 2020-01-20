import 'dart:async';
import 'package:state_architecture_in_flutter/home_enum_state.dart';

class HomeModel {

  // declare the controller for stream
  final StreamController<HomeViewState> streamController = StreamController<HomeViewState>();

  List<String> listData;
  bool isReload = false;

  Stream<HomeViewState> get homeStreamState => streamController.stream;

  Future<List<String>> getData({bool hasData = true, hasError = false}) async {
    streamController.add(HomeViewState.Busy);

    await Future.delayed(Duration(seconds: 2));

    if (hasError) {
      streamController.addError('An error orccured while loading data!');
    }

    if (!hasData) {
      streamController.add(HomeViewState.NoData);
    }

    listData = List<String>.generate(isReload ? 5 : 20, (index) => 'Item ${index}');
    streamController.add(HomeViewState.DataRetrieved);
  }
}
