import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:sample_flutter_redux_app/models/models.dart';
import 'package:sample_flutter_redux_app/models/post/post_state.dart';
import 'package:sample_flutter_redux_app/models/user/user_state.dart';

@immutable
class AppState {
  final MyBoxColor boxColor;
  final MyBoxSize boxSize;
  final MyBoxShape boxShape;
  final PostState post;
  final UserState user;

  const AppState({
    @required this.boxColor,
    @required this.boxSize,
    @required this.boxShape,
    @required this.post,
    @required this.user,
  });

  dynamic toJson() => {
        'boxColor': boxColor,
        'boxSize': boxSize,
        'boxShape': boxShape,
        'post': post,
        'user': user,
      };

  @override
  String toString() {
    return 'AppState: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}
