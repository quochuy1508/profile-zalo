import 'package:flutter/material.dart';
import 'package:sample_flutter_redux_app/color_box.dart';
import 'package:sample_flutter_redux_app/color_controller.dart';
import 'package:sample_flutter_redux_app/randomizer.dart';
import 'package:sample_flutter_redux_app/result_box.dart';
import 'package:sample_flutter_redux_app/shape_box.dart';
import 'package:sample_flutter_redux_app/shape_controller.dart';
import 'package:sample_flutter_redux_app/size_box.dart';
import 'package:sample_flutter_redux_app/size_controller.dart';

class BodyData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Color Controller'),
              Randomizer(),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: ColorController(),
              )),
              ColorBox(),
            ],
          ),
        ],
      ),
    );
  }
}
