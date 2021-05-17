/**
 * Author: Leonard Ho
 * profile: https://github.com/quochuy1508
  */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:sample_flutter_redux_app/actions/user_actions.dart';
import 'package:sample_flutter_redux_app/models/app_state.dart';
import 'package:sample_flutter_redux_app/models/user/user.dart';
import 'package:sample_flutter_redux_app/models/user/user_state.dart';
import 'package:sample_flutter_redux_app/utils/assets.dart';
import 'package:sample_flutter_redux_app/Component/Body/BodyProfile.dart';
import 'package:sample_flutter_redux_app/Component/Header/ProfileHeader.dart';
import 'package:sample_flutter_redux_app/Component/Slider/HorizontalListAsset.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePage> {
  User user;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        onInit: (store) {
          Completer completer = new Completer();
          store.dispatch(getUser(completer));
        },
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel vm) {
          return Scaffold(
              backgroundColor: Colors.grey[200],
              extendBodyBehindAppBar: true,
              extendBody: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                actions: <Widget>[
                  GestureDetector(
                      onTap: () {
                        print("Container clicked");
                        Navigator.pushNamed(context, '/moreInfo');
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                            size: 24.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ))),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ProfileHeader(
                      avatar: (vm.userState != null &&
                              vm.userState.data.avatar != null)
                          ? NetworkImage(vm.userState.data.avatar)
                          // NetworkImage(images[1])
                          : NetworkImage(images[2]),
                      coverImage: (vm.userState != null &&
                              vm.userState.data.coverImage != null)
                          ? NetworkImage(vm.userState.data.coverImage)
                          // ? NetworkImage(images[2])
                          : NetworkImage(images[1]),
                      title: (vm.userState != null &&
                              vm.userState.data.name != null)
                          ? vm.userState.data.name
                          : "NULL",
                      subtitle: (vm.userState != null &&
                              vm.userState.data.description != null)
                          ? vm.userState.data.description
                          : "Thêm giới thiệu bản thân",
                      // actions: <Widget>[
                      //   MaterialButton(
                      //     color: Colors.white,
                      //     shape: CircleBorder(),
                      //     elevation: 0,
                      //     child: Icon(Icons.edit),
                      //     onPressed: () {},
                      //   )
                      // ],
                    ),
                    const SizedBox(height: 10.0),
                    HorizontalListAsset(),
                    BodyProfile()
                  ],
                ),
              ));
        });
  }
}

class _ViewModel {
  final Function(Function()) getUserInfo;
  final UserState userState;
  _ViewModel({@required this.getUserInfo, @required this.userState});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        getUserInfo: (Function() onError) async {
          Completer completer = new Completer();
          store.dispatch(getUser(completer));
          try {
            await completer.future;
          } on Exception catch (e) {
            // onError(e);
          }
        },
        userState: store.state.user);
  }
}
