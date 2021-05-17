import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sample_flutter_redux_app/models/models.dart';
import 'package:sample_flutter_redux_app/models/post/post.dart';
import 'package:sample_flutter_redux_app/models/user/user.dart';
import 'package:sample_flutter_redux_app/selectors/selectors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ColorException extends FormatException {
  final Color badColor;

  ColorException(String message, this.badColor) : super(message);
}

class ApiClient {
  static const String TOKEN =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9iay16YWxvLmhlcm9rdWFwcC5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2MTk2MTk4NTcsIm5iZiI6MTYxOTYxOTg1NywianRpIjoiMzI3NWVaZXRGdnBlZ21OQSIsInN1YiI6MTA4LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.jAzQE4JTUs9FIIu0Sfa6tvKxnNt9IgxyaL_H1WollZo';

  static Future<MyBoxColor> getBoxColor() async {
    Random rng = new Random();

    // The data is JSON encoded only for demonstration
    var json = jsonEncode({
      'red': (rng.nextDouble() * 101).floorToDouble() / 10,
      'green': (rng.nextDouble() * 101).floorToDouble() / 10,
      'blue': (rng.nextDouble() * 101).floorToDouble() / 10,
    });
    // Simulating async call
    await Future.delayed(Duration(milliseconds: 500));

    var color = jsonDecode(json);

    // Throw a ColorException on not desired colors
    if (color['red'] < 1.0 || color['green'] < 1.0 || color['blue'] < 1.0) {
      throw new ColorException(
        'This might not be a good color $color',
        colorSelector(MyBoxColor.fromJson(color)),
      );
    }

    // Creating an instance from decoded JSON
    return MyBoxColor.fromJson(color);
  }

  static Future<List<Post>> getPosts() async {
    var url = Uri.parse('https://bk-zalo.herokuapp.com/api/get_list_posts');
    var response = await http.post(url,
        body: {'token': TOKEN, 'index': "0", 'count': "20", 'user_id': "37"});
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var arrayPost = data['data']['posts'];
      List<Post> postList =
          (arrayPost as List).map((data) => Post.fromJSON(data)).toList();

      print(postList);
      return postList;
    }
  }

  static Future<User> getUser() async {
    var url = Uri.parse('https://bk-zalo.herokuapp.com/api/user/get_user_info');
    var response = await http.post(url, body: {'token': TOKEN});
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return User.fromJSON(data);
    }
  }

  static Future<User> changeUser() async {
    var url = Uri.parse('https://bk-zalo.herokuapp.com/api/user/get_user_info');
    var response = await http.post(url, body: {'token': TOKEN});
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return User.fromJSON(data);
    }
  }
}
