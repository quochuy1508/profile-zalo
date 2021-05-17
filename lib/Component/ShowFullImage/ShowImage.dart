import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  // final String text;
  final String image;

  // receive data from the FirstScreen as a parameter
  SecondScreen({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("image: " + image);
    return new Scaffold(
      body: new Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace stackTrace) {
          return Text('Your error widget...');
        },
      ),
    );
  }
}
