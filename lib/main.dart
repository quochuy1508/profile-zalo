import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sample_flutter_redux_app/Component/MoreInfo/MoreInfo.dart';
import 'package:sample_flutter_redux_app/Component/ShowFullImage/ShowImage.dart';
import 'package:sample_flutter_redux_app/Component/User/ChangeImageView.dart';
import 'package:sample_flutter_redux_app/models/models.dart';
import 'package:sample_flutter_redux_app/page/Profile.dart';
import 'package:sample_flutter_redux_app/reducers/app_reducer.dart';

void main() {
  final initialState = AppState(
    boxColor: MyBoxColor(
      red: 5.0,
      green: 5.0,
      blue: 5.0,
    ),
    boxSize: MyBoxSize(
      width: 5.0,
      height: 5.0,
    ),
    boxShape: MyBoxShape(
      borderRadius: 5.0,
    ),
  );

  final store = Store<AppState>(
    appReducer,
    initialState: initialState,
    middleware: [thunkMiddleware],
  );

  runApp(StoreProvider(store: store, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Redux Demo',
        home: ProfilePage(),
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          ProfilePage.routeName: (context) => ProfilePage(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/moreInfo': (context) => MoreInfo(),
          ChangeImageView.routeName: (context) => ChangeImageView(),
        });
  }
}
