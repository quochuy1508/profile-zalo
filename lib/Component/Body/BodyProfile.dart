import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sample_flutter_redux_app/Component/Body/BodyData.dart';
import 'package:sample_flutter_redux_app/Component/Body/FormInputCreatePost.dart';
import 'package:sample_flutter_redux_app/actions/post_actions.dart';
import 'package:sample_flutter_redux_app/models/models.dart';
import 'package:timelines/timelines.dart';
import 'package:redux/redux.dart';

class BodyProfile extends StatelessWidget {
  final data = [FormInputCreatePost(), BodyData()];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        // onInit: (store) {
        // store.dispatch(LoadCategoriesAction());},
        onInit: (store) {
          Completer completer = new Completer();
          store.dispatch(getPosts(completer));
          // store.dispatch(LoadCategoriesAction());
        },
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel vm) {
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
                      padding: EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [data[index]],
                      ),
                    );
                  },
                  indicatorBuilder: (_, index) {
                    return OutlinedDotIndicator(borderWidth: 1.5, size: 12);
                  },
                  connectorBuilder: (_, index, ___) => SolidLineConnector(
                    color: Color.fromARGB(255, 194, 194, 194),
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

  _ViewModel({@required this.getListPosts});

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
    );
  }
}
