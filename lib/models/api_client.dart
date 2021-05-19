import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sample_flutter_redux_app/models/models.dart';
import 'package:sample_flutter_redux_app/models/post/post.dart';
import 'package:sample_flutter_redux_app/models/user/user.dart';
import 'package:sample_flutter_redux_app/selectors/selectors.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';

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

  static dynamic changeUser(File avatar, String phonenumber) async {
//     FormData formData = new FormData.from({
//    "name": "wendux",
//    "file1": new UploadFileInfo(new File("./upload.jpg"), "upload1.jpg")
// });
//     var response = await http
//         .post(url, body: {'token': TOKEN, 'phonenumber': phonenumber});
//     print('Response status: ${response.statusCode}');

    // var request = http.MultipartRequest('POST', url);
    // // print('avatar.path: ' + avatar.path);
    // request.files.add(await http.MultipartFile.fromPath('avatar', avatar.path));
    // r
    // var response = await request.send();
    // // print(response.headers);
    // // print(response.statusCode);
    // // print(response.reasonPhrase);
    // // print(response.stream);
    // // print(response);
    // // listen for response

    // // print(response.stream.first);
    // // print(response.stream.last);
    // if (response.statusCode == 200) {
    //   response.stream.transform(utf8.decoder).listen((value) {
    //     var data = jsonDecode(value);
    //     print(value);
    //     print(data['data']);
    //     return User.fromJSON(data['data']);
    //   });
    //   //
    // }
    // open a bytestream
    var stream = new http.ByteStream(DelegatingStream.typed(avatar.openRead()));
    // get file length
    var length = await avatar.length();

    // string to uri
    var uri = Uri.parse('https://bk-zalo.herokuapp.com/api/change_user_info');

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('avatar', stream, length,
        filename: basename(avatar.path));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields['token'] = TOKEN;
    request.fields['phonenumber'] = phonenumber;
    // send
    var response = await request.send();
    print(response.statusCode);
    return response.stream;
    // listen for response
    // response.stream.transform(utf8.decoder);
    // return res.reasonPhrase;
  }
}
