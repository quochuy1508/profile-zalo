import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:sample_flutter_redux_app/models/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sample_flutter_redux_app/models/user/user_state.dart';
// import 'package:photo_manager/photo_manager.dart';

class FormPost extends StatelessWidget {
  static const routeName = '/formPost';
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
                      "Tạo bài viết",
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              body: Column(
                children: <Widget>[
                  Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: TextField(
                          maxLines: 10,
                          decoration: InputDecoration.collapsed(
                              hintStyle: TextStyle(
                                  color: Colors.pink[100],
                                  fontWeight: FontWeight.bold),
                              hintText: "Bạn đang nghĩ gì?"),
                          style: TextStyle(
                              color: Colors.pink[100],
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  _tabSection(context),
                ],
              ));
        });
  }
}

Widget _tabSection(BuildContext context) {
  return DefaultTabController(
    length: 5,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: TabBar(indicatorColor: Colors.transparent, tabs: [
            Container(
              width: 70.0,
              margin: EdgeInsets.only(right: 100),
              child: Tab(
                icon: IconButton(
                  icon: new Icon(Icons.emoji_emotions),
                  highlightColor: Colors.grey[400],
                  color: Colors.grey[400],
                  onPressed: () async {
                    // ### Add the next 2 lines ###
                    // final permitted = await PhotoManager.requestPermission();
                    // if (!permitted) return;
                    // // ######
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (_) => Gallery()),
                    // );
                  },
                ),
              ),
            ),
            Container(
              width: 0.0,
              // padding: EdgeInsets.only(right: 100),
              child: Tab(
                  icon: Icon(
                Icons.image,
                color: Colors.grey[400],
                // size: 5,
              )),
            ),
            Container(
              width: 0.0,
              child: Tab(
                  icon: Icon(
                Icons.slideshow,
                color: Colors.grey[400],
                // size: 5,
              )),
            ),
            Container(
              width: 0.0,
              child: Tab(
                  icon: Icon(
                Icons.link,
                color: Colors.grey[400],
                // size: 5,
              )),
            ),
            Container(
              width: 0.0,
              child: Tab(
                  icon: Icon(
                Icons.location_on,
                color: Colors.grey[400],
                // size: 5,
              )),
            ),
          ]),
        ),
        Container(
          //Add this to give height
          height: MediaQuery.of(context).size.height / 17 * 5,
          child: TabBarView(children: [
            Container(
              child: Text("Home Body"),
            ),
            Container(
              child: Text("Articles Body"),
            ),
            Container(
              child: Text("User Body"),
            ),
            Container(
              child: Text("User Body"),
            ),
            Container(
              child: Text("User Body"),
            ),
          ]),
        ),
      ],
    ),
  );
}

class _ViewModel {
  final UserState userState;
  _ViewModel({@required this.userState});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(userState: store.state.user);
  }
}
