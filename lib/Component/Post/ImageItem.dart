import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  final dynamic images;

  const ImageItem({this.images});

  dynamic checkUrl(String url) {
    try {
      return Image.network(
        url,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace stackTrace) {
          return Text('Your error widget...');
        },
      );
    } catch (e) {
      return Icon(Icons.image);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (images.length > 3) {
      return Container(
          margin: EdgeInsets.all(5),
          child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[Text("Xử lý lớn hơn 3 ảnh")]));
    } else if (images.length > 0) {
      return Container(
          // margin: EdgeInsets.all(5),
          child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Container(
                margin: const EdgeInsets.only(right: 1),
                child: checkUrl(
                  images[0]['link'],
                )),
            images.indexOf(1) >= 0
                ? Container(
                    margin: const EdgeInsets.only(right: 1),
                    child: checkUrl(
                      images[1]['link'],
                    ))
                : Container(
                    margin: const EdgeInsets.only(right: 1),
                    width: 100,
                    height: 100,
                  ),
            images.indexOf(2) >= 0
                ? Container(
                    margin: const EdgeInsets.only(right: 1),
                    child: checkUrl(images[2]['link']))
                : Container(
                    margin: const EdgeInsets.only(right: 1),
                    width: 100,
                    height: 100,
                  ),
          ]));
    } else {
      return Container(
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[]));
    }
  }
}
