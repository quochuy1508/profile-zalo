import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:sample_flutter_redux_app/models/models.dart';
import 'package:sample_flutter_redux_app/models/post/post_state.dart';

@immutable
class AppState {
  final MyBoxColor boxColor;
  final MyBoxSize boxSize;
  final MyBoxShape boxShape;
  final PostState post;

  const AppState({
    @required this.boxColor,
    @required this.boxSize,
    @required this.boxShape,
    @required this.post,
  });

  dynamic toJson() => {
        'boxColor': boxColor,
        'boxSize': boxSize,
        'boxShape': boxShape,
        'post': post,
      };

  @override
  String toString() {
    return 'AppState: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}
