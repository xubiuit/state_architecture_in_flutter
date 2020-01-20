# State Architecture in Flutter (state_architecture_in_flutter)

## Getting Started

This project is a starting point for a Flutter application with STATE ARCHITECTURE

- `home_datamodel.dart`: business logic to get Data by async
- `home_enum_state.dart`: save the HomeViewState with all the state of data for Home Page
- `home_views.dart`: all the views without logic code
- `home_view_state_model.dart`: the view with Controller, Model, View combine together

## Quick Overview
Please take a look at: StreamBuilder (Flutter Widget of the Week): https://www.youtube.com/watch?v=MkKEWHfy99Y
## Details
### When
- You want to build a dynamic screen which reload by listening event from widgets async communication with multiple states.
- For example: display status of message in Messenger (waiting, sent, seen)
- So you application should have: State, Async, Displaying Item by Builder.
### How 

Configure the state:
`enum HomeViewState { Busy, DataRetrieved, NoData }`

Set the stream: 
 - Hey, the stream controller, do you send me something?
 - Okay, let me track everything for you
```
final StreamController streamController = StreamController();
FutureBuilder(
    stream: streamController.stream,
    ...
);
```

Get the data from async function

```
List listData;
Future getData() async {
	// first of all, I am busy right now
    streamController.add(HomeViewState.Busy);
    // okay, I will load the data in 2 seconds
    await Future.delayed(Duration(seconds: 2));
    // so I will let StreamBuilder knows that I am busy
    streamController.add(HomeViewState.Busy);
	// let’s wait for 2 more seconds
    await Future.delayed(Duration(seconds: 2));
    // now I got the data by generating the list of 20 items
    listData = List<String>.generate(20, (index) => 'Item ${index}');
	// Okay I received!
    streamController.add(HomeViewState.DataRetrieved);
  }
```

Then config the builder: thanks! let me check the data and build that by myself.
```
StreamBuilder(
    ...
    builder: (BuildContext context, AsyncSnapshot<String> snapshot) => {
    if (!snapshot.hasData || snapshot.data == HomeViewState.Busy) {
        return Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasError) {
        return Center(child: Text(‘Error!’));
    }
    if (snapshot.data == HomeViewState.NoData) {
        return Center(child: Text(‘No Data!’));
    }
    return myWidget(snapshot.data);
    },
);
```

In case we do not want to use HomeViewState, we can check the snapshot state then
```
StreamBuilder(
    ...
    builder: (BuildContext context, AsyncSnapshot<String> snapshot) => {
    switch (snapshot.connectionState):
        case connectionState.waiting:
            return Center(child: CircularProgressIndicator());
        case connectionState.none:
            return Center(child: CircularProgressIndicator());
        case connectionState.active:
    return myWidget1(snapshot.data);
        case connectionState.done:
    return myWidget2(snapshot.data);
    },
);
```