import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_flutter_redux_app/Component/Modal/constants.dart';

class Modal extends StatefulWidget {
  final String title, view, takeScreen, takeDevices;
  final Image img;

  const Modal({
    Key key,
    this.title,
    this.view,
    this.takeScreen,
    this.takeDevices,
    this.img,
  }) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<Modal> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          // padding: EdgeInsets.only(
          //     left: Constants.padding,
          //     top: Constants.avatarRadius + Constants.padding,
          //     right: Constants.padding,
          //     bottom: Constants.padding),
          // alignment: Align,
          // margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration:
              BoxDecoration(shape: BoxShape.rectangle, color: Colors.white,
                  // borderRadius: BorderRadius.circular(Constants.padding),
                  boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              widget.title == 'Ảnh bìa'
                  ? Image.asset("assets/modalCover.jpg")
                  : Image.asset("assets/modalAvatar.jpg"),
              SizedBox(
                height: 2,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: Column(children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.visibility, color: Colors.blue[200]),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          widget.view,
                          style: TextStyle(fontSize: 14),
                          // textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.photo_camera, color: Colors.blue[200]),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          widget.takeScreen,
                          style: TextStyle(fontSize: 14),
                          // textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.image, color: Colors.blue[200]),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          widget.takeDevices,
                          style: TextStyle(fontSize: 14),
                          // textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ]))
            ],
          ),
        ),
      ],
    );
  }
}
