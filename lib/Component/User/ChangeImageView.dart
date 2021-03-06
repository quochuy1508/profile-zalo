import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:sample_flutter_redux_app/Component/User/ImageViewModel.dart';
import 'package:sample_flutter_redux_app/actions/user_actions.dart';
import 'package:sample_flutter_redux_app/models/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sample_flutter_redux_app/models/user/user_state.dart';
import 'package:sample_flutter_redux_app/page/Profile.dart';

class ChangeImageView extends StatelessWidget {
  static const routeName = '/uploadImage';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as ImageViewModel;
    // print("===================");
    // print(args);
    // print("===================");
    return StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel vm) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black87,
                title: Container(
                    child: Text(
                  "Cập nhật ảnh đại diện",
                  style: TextStyle(fontSize: 16),
                )),
              ),
              body: Column(children: <Widget>[
                Container(
                    color: Colors.black54,
                    height: 30,
                    alignment: Alignment.center,
                    child: Text(
                      "Bạn có thể di chuyển hoặc zoom ảnh",
                      style: TextStyle(fontSize: 14, color: Colors.white54),
                    )),
                Container(
                    color: Colors.black,
                    height: 480,
                    alignment: Alignment.center,
                    child: Image.file(
                      args.image,
                      fit: BoxFit.fitWidth,
                    )),
                Container(
                  color: Colors.black,
                  height: 50,
                  padding: EdgeInsets.only(right: 10),
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      print(args.image.runtimeType);
                      print(args.phonenumber.runtimeType);
                      vm.changeUser(() => {}, args.image, args.phonenumber);
                      Navigator.pushNamed(
                        context,
                        ProfilePage.routeName,
                      );
                    },
                    child: Text('Xong'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                  ),
                )
              ]));
        });
  }
}

class _ViewModel {
  final UserState userState;
  final Function(Function(), File, String) changeUser;
  _ViewModel({
    @required this.userState,
    @required this.changeUser,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        changeUser:
            (Function() onError, File avatar, String phonenumber) async {
          print(avatar);
          print(avatar.runtimeType);
          Completer completer = new Completer();
          store.dispatch(changeInfoUser(completer, avatar, phonenumber));
          try {
            await completer.future;
          } on Exception catch (e) {
            // onError(e);
          }
        },
        userState: store.state.user);
  }
}
