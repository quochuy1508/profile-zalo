import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_flutter_redux_app/Component/Modal/constants.dart';
import 'package:sample_flutter_redux_app/Component/ShowFullImage/ShowImage.dart';
import 'package:redux/redux.dart';
import 'package:sample_flutter_redux_app/Component/User/ChangeImageView.dart';
import 'package:sample_flutter_redux_app/Component/User/ImageViewModel.dart';
import 'package:sample_flutter_redux_app/models/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sample_flutter_redux_app/models/user/user_state.dart';
import 'package:image_picker/image_picker.dart';

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
  /// Variables
  File imageFile;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel vm) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Constants.padding),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: contentBox(context, vm.userState),
          );
        });
  }

// get the text in the TextField and start the Second Screen
  void _sendDataToSecondScreen(BuildContext context, linkImage) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(image: linkImage),
        ));
  }

  contentBox(context, userState) {
    return Stack(
      children: <Widget>[
        Container(
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
                        GestureDetector(
                            child: Text(
                              widget.view,
                              style: TextStyle(fontSize: 14),
                              // textAlign: TextAlign.center,
                            ),
                            onTap: () {
                              if (userState != null &&
                                  userState.data != null &&
                                  userState.data.avatar != null) {
                                if (widget.title == 'Ảnh bìa') {
                                  _sendDataToSecondScreen(
                                      context, userState.data.coverImage);
                                } else {
                                  _sendDataToSecondScreen(
                                      context, userState.data.avatar);
                                }
                              }
                            }),
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
                        GestureDetector(
                            child: Text(
                              widget.takeScreen,
                              style: TextStyle(fontSize: 14),
                              // textAlign: TextAlign.center,
                            ),
                            onTap: () {
                              _getFromCamera();
                            }),
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
                        GestureDetector(
                            child: Text(
                              widget.takeDevices,
                              style: TextStyle(fontSize: 14),
                              // textAlign: TextAlign.center,
                            ),
                            onTap: () {
                              _getFromGallery();
                            }),
                      ],
                    ),
                  ]))
            ],
          ),
        ),
      ],
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      Navigator.pushNamed(
        context,
        ChangeImageView.routeName,
        arguments: ImageViewModel(imageFile),
      );
    }
  }
}

class _ViewModel {
  final UserState userState;
  _ViewModel({@required this.userState});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(userState: store.state.user);
  }
}
