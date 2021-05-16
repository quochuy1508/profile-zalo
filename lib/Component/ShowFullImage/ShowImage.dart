import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  // final String text;
  final String image;

  // receive data from the FirstScreen as a parameter
  SecondScreen({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Image.network(
        image,
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
