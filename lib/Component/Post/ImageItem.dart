import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  final dynamic images;

  const ImageItem({this.images});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // List<String> linksImage = images.map((images) => images.link).toList();
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
                child: Image.network(
                  images[0]['link'],
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                )),
            images.indexOf(1) >= 0
                ? Container(
                    margin: const EdgeInsets.only(right: 1),
                    child: Image.network(
                      images[1]['link'],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ))
                : Container(
                    margin: const EdgeInsets.only(right: 1),
                    width: 100,
                    height: 100,
                  ),
            images.indexOf(2) >= 0
                ? Container(
                    margin: const EdgeInsets.only(right: 1),
                    child: Image.network(
                      images[2]['link'],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ))
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
