import 'dart:async';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sample_flutter_redux_app/models/api_client.dart';
import 'package:sample_flutter_redux_app/models/models.dart';
import 'package:sample_flutter_redux_app/models/post/post.dart';
import 'package:sample_flutter_redux_app/models/post/post_state.dart';

ThunkAction<AppState> getPosts(Completer completer) {
  return (Store<AppState> store) async {
    try {
      // List<Post> posts = await ApiClient.getPosts();
      // print("==============================");
      // print(posts);
      // print("==============================");

      // posts.forEach((k, v) => {});
      // store.dispatch(SetListPost(posts));
      completer.complete();
    } on ColorException catch (e) {
      completer.completeError(e);
    }
  };
}

class SetListPost {
  final ListPostsState listPost;

  SetListPost(this.listPost);
}
