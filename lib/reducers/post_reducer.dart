import 'package:redux/redux.dart';
import 'package:sample_flutter_redux_app/actions/post_actions.dart';
import 'package:sample_flutter_redux_app/models/post/post_state.dart';

final postReducer = TypedReducer<ListPostsState, SetListPost>(_setPostReducer);

ListPostsState _setPostReducer(ListPostsState state, SetListPost action) {
  print("===========================");
  print(action);
  print("===========================");
  return action.listPost;
}
