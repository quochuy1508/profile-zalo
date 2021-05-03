import 'package:sample_flutter_redux_app/models/post/post.dart';

class PostState {
  ListPostsState list;

  PostState({
    this.list,
  });

  factory PostState.initial() => PostState(
        list: ListPostsState.initial(),
      );
}

class ListPostsState {
  dynamic error;
  bool loading;
  List<Post> data;

  ListPostsState({
    this.error,
    this.loading,
    this.data,
  });

  factory ListPostsState.initial() => ListPostsState(
        error: null,
        loading: false,
        data: [],
      );
}
