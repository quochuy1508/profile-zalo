import 'package:redux/redux.dart';
import 'package:sample_flutter_redux_app/actions/post_actions.dart';
import 'package:sample_flutter_redux_app/models/post/post_state.dart';

final postReducer = TypedReducer<PostState, SetListPost>(_setPostReducer);

PostState _setPostReducer(PostState state, SetListPost action) {
  return action.listPost;
}
