import 'package:flutter/material.dart';
import 'package:sample_flutter_redux_app/Component/Post/ImageItem.dart';

class PostItem extends StatefulWidget {
  final String dateCreatePost, title;
  final int like;
  final dynamic images;
  final bool isLiked;

  PostItem({
    Key key,
    this.dateCreatePost,
    this.title,
    this.like,
    this.images,
    this.isLiked,
  }) : super(key: key);

  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool _active = false;
  int countLike = 0;

  @override
  void initState() {
    super.initState();
    _active = widget.isLiked;
    countLike = widget.like;
  }

  void _handleSetIsLiked() {
    setState(() {
      if (_active) {
        _active = false;
        countLike -= 1;
      } else {
        _active = true;
        countLike += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   _active = widget.isLiked;
    // });
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
                        widget.dateCreatePost,
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
                              widget.title,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.pink[300],
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            )),
                        // ImageItem(images: widget.images),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  padding: EdgeInsets.all(0),
                                  alignment: Alignment.center,
                                  icon: Icon(Icons.favorite_border),
                                  color:
                                      (_active ? Colors.red : Colors.black45),
                                  onPressed: _handleSetIsLiked,
                                ),
                                Text('$countLike'),
                                Padding(
                                    padding: const EdgeInsets.only(right: 20)),
                                Icon(
                                  Icons.textsms,
                                  color: Colors.black87,
                                  size: 24.0,
                                  semanticLabel:
                                      'Text to announce in accessibility modes',
                                ),
                                Text('0'),
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
}
