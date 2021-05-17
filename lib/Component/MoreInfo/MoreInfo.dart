import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:sample_flutter_redux_app/models/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sample_flutter_redux_app/models/user/user_state.dart';

class MoreInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel vm) {
          return Scaffold(
            appBar: AppBar(
              title: Container(
                  margin: EdgeInsets.only(left: 0),
                  padding: EdgeInsets.only(left: 0),
                  child: Text(
                    vm.userState.data.name,
                    style: TextStyle(fontSize: 16),
                  )),
            ),
            body: ListView(
              children: ListTile.divideTiles(context: context, tiles: [
                ListTile(
                  title: Text('Thông tin'),
                ),
                ListTile(
                  title: Text('Đổi ảnh đại diện'),
                ),
                ListTile(
                  title: Text('Đổi ảnh bìa'),
                ),
                ListTile(
                  title: Text('Cập nhật giới thiệu bản thân'),
                ),
                ListTile(title: Text('Ví của tôi')),
                ListTile(
                  title: Text(
                    'Cài đặt',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue[400],
                        fontWeight: FontWeight.w700),
                  ),
                  dense: true,
                ),
                ListTile(
                  title: Text('Mã QR của tôi'),
                ),
                ListTile(
                  title: Text('Thiết lập riêng tư'),
                ),
                ListTile(
                  title: Text('Quản lý tài khoản'),
                ),
                ListTile(
                  title: Text('Cài đặt chung'),
                ),
              ]).toList(),
            ),
          );
        });
  }
}

class _ViewModel {
  final UserState userState;
  _ViewModel({@required this.userState});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(userState: store.state.user);
  }
}
