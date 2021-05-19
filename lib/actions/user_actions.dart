import 'dart:async';
import 'dart:io';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sample_flutter_redux_app/models/api_client.dart';
import 'package:sample_flutter_redux_app/models/models.dart';
import 'package:sample_flutter_redux_app/models/user/user.dart';
import 'package:sample_flutter_redux_app/models/user/user_state.dart';
import 'dart:convert';

ThunkAction<AppState> getUser(Completer completer) {
  return (Store<AppState> store) async {
    try {
      User user = await ApiClient.getUser();
      // print("==============================");
      // print(user.avatar);
      // print(user.name);
      // print(user.id);
      // print("==============================");
      store.dispatch(
          SetUser(new UserState(data: user, loading: false, error: null)));
      completer.complete();
    } on ColorException catch (e) {
      completer.completeError(e);
    }
  };
}

ThunkAction<AppState> changeInfoUser(
    Completer completer, File avatar, String phonenumber) {
  return (Store<AppState> store) async {
    try {
      ApiClient.changeUser(avatar, phonenumber)
          .transform(utf8.decoder)
          .listen((value) {
        print("==============================");
        print(value);
        var data = jsonDecode(value);
        // print(user.coverImage);
        print(data['data']);
        // print(user.description);
        // print(user.phonenumber);
        print("==============================");
        // store.dispatch(
        //     SetUser(new UserState(data: user, loading: false, error: null)));
        // completer.complete();
      });
    } on ColorException catch (e) {
      completer.completeError(e);
    }
  };
}

class SetUser {
  final UserState user;

  SetUser(this.user);
}
