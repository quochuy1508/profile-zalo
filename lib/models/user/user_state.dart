import 'package:sample_flutter_redux_app/models/user/user.dart';

class UserState {
  dynamic error;
  bool loading;
  User data;

  UserState({
    this.error,
    this.loading,
    this.data,
  });

  factory UserState.initial() => UserState(
        error: null,
        loading: false,
        data: null,
      );
}
