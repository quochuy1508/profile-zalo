import 'package:flutter/material.dart';
import 'package:sample_flutter_redux_app/Component/Post/ImageItem.dart';

class PostItem extends StatelessWidget {
  final String dateCreatePost, title;
  final String like;
  final dynamic images;

  const PostItem({
    Key key,
    this.dateCreatePost,
    this.title,
    this.like,
    this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<String> linksImage = images.map((images) => images.link).toList();
    return Container(
        // width: 220,
        // margin: EdgeInsets.all(5),
        padding: EdgeInsets.only(top: 10, bottom: 10),
        // decoration: BoxDecoration(
        //   color: Colors.white54,
        //   borderRadius: BorderRadius.circular(5),
        //   // border: Border.all(color: Colors.white),
        // ),
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  width: 100,
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(3),
                    // border: Border.all(color: Colors.white),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        dateCreatePost,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ))),
              Container(
                  width: 500,
                  // height: 100,
                  // margin: EdgeInsets.all(5),
                  // padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(5),
                    // border: Border.all(color: Colors.white),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 5, left: 10),
                            child: Text(
                              title,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.pink[300],
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            )),
                        ImageItem(images: images),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.black87,
                                  size: 24.0,
                                  semanticLabel:
                                      'Text to announce in accessibility modes',
                                ),
                                Text(like),
                                Padding(
                                    padding: const EdgeInsets.only(right: 20)),
                                Icon(
                                  Icons.textsms,
                                  color: Colors.black87,
                                  size: 24.0,
                                  semanticLabel:
                                      'Text to announce in accessibility modes',
                                ),
                                Text(like),
                                Padding(
                                    padding: const EdgeInsets.only(right: 50)),
                                Icon(
                                  Icons.more_horiz,
                                  color: Colors.black87,
                                  size: 24.0,
                                  semanticLabel:
                                      'Text to announce in accessibility modes',
                                ),
                              ],
                            )),
                      ]))
            ]));
  }

  void renderImage() {}
}
