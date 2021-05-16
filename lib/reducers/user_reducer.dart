import 'package:redux/redux.dart';
import 'package:sample_flutter_redux_app/actions/user_actions.dart';
import 'package:sample_flutter_redux_app/models/user/user_state.dart';

final userReducer = TypedReducer<UserState, SetUser>(_setUserReducer);

UserState _setUserReducer(UserState state, SetUser action) {
  return action.user;
}
