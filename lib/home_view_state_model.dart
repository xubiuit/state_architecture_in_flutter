import 'package:flutter/material.dart';
import 'package:state_architecture_in_flutter/home_enum_state.dart';
import 'package:state_architecture_in_flutter/home_datamodel.dart';
import 'package:state_architecture_in_flutter/home_views.dart';

class MyHomePageApp extends StatefulWidget {
  @override
  _MyHomePageAppState createState() => _MyHomePageAppState();
}

class _MyHomePageAppState extends State<MyHomePageApp> {
  final home_model = HomeModel();
  final home_view = HomeView();

  Widget _getFutureUi() {
    return StreamBuilder(
      stream: home_model.homeStreamState,
      builder: (BuildContext context, snapshot) {
        if (!snapshot.hasData || snapshot.data == HomeViewState.Busy) {
          return home_view.getLoadingCircle();
        }
        if (snapshot.hasError) {
          return home_view.getSystemMessage(snapshot.error);
        }
        if (snapshot.data == HomeViewState.NoData) {
          return home_view.getSystemMessage(
              'No data found. Add something and check back.');
        }
        return home_view.getListItem(home_model);
      },
    );
  }

  @override
  void initState() {
    home_model.getData();
    super.initState();
  }

  void _actionPressActionButton() {
    home_model.getData();
    home_model.isReload = home_model.isReload ? false : true;
  }

  Widget _getFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _actionPressActionButton,
      child: Icon(Icons.add),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: _getFutureUi(),
      floatingActionButton: _getFloatingActionButton(),
    );
  }
}
