import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sample_flutter_redux_app/Component/Body/FormInputCreatePost.dart';
import 'package:sample_flutter_redux_app/Component/Post/PostItem.dart';
import 'package:sample_flutter_redux_app/actions/post_actions.dart';
import 'package:sample_flutter_redux_app/models/models.dart';
import 'package:sample_flutter_redux_app/models/post/post_state.dart';
import 'package:sample_flutter_redux_app/utils/assets.dart';
import 'package:timelines/timelines.dart';
import 'package:redux/redux.dart';

class BodyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        onInit: (store) {
          Completer completer = new Completer();
          store.dispatch(getPosts(completer));
        },
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel vm) {
          final data = [];
          if (vm.postState != null) {
            if (vm.postState.list.loading == true) {
              return CircularProgressIndicator();
            } else {
              var dataPost = vm.postState.list.data;
              data.add(FormInputCreatePost());
              for (var i = 0; i < dataPost.length; i++) {
                // Cards(unit: names[i])
                print('+++++++++++++++++++++++++++++++');
                // print();
                print('+++++++++++++++++++++++++++++++');
                List<String> dateTime = dataPost[i].createdAt.split("-");
                String dateCreatePost = dateTime.elementAt(2).substring(0, 2) +
                    " tháng " +
                    dateTime.elementAt(1);
                data.add(PostItem(
                    // key: dataPost[i].id,
                    dateCreatePost: dateCreatePost,
                    title: dataPost[i].described,
                    like: dataPost[i].like.toString(),
                    images: dataPost[i].images));
              }
            }
          }

          return DefaultTextStyle(
            style: TextStyle(
              color: Color(0xff9b9b9b),
              fontSize: 20,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FixedTimeline.tileBuilder(
                theme: TimelineThemeData(
                  nodePosition: 0,
                  color: Color(0xff989898),
                  indicatorTheme: IndicatorThemeData(
                    position: 0,
                    size: 10.0,
                  ),
                  connectorTheme: ConnectorThemeData(
                    thickness: 1.5,
                  ),
                ),
                builder: TimelineTileBuilder.connected(
                  connectionDirection: ConnectionDirection.after,
                  itemCount: data.length,
                  contentsBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 5.0, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [data[index]],
                      ),
                    );
                  },
                  indicatorBuilder: (_, index) {
                    return OutlinedDotIndicator(
                      borderWidth: 1.5,
                      size: 12,
                      color: Colors.grey[300],
                    );
                  },
                  connectorBuilder: (_, index, ___) => SolidLineConnector(
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class _ViewModel {
  final Function(Function()) getListPosts;
  final PostState postState;
  _ViewModel({@required this.getListPosts, @required this.postState});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        getListPosts: (Function() onError) async {
          Completer completer = new Completer();
          store.dispatch(getPosts(completer));
          try {
            await completer.future;
          } on Exception catch (e) {
            // onError(e);
          }
        },
        postState: store.state.post);
  }
}
