import 'package:agrimigo/models/newsModel.dart';
import 'package:agrimigo/util/newsUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

/// Creates custom shadow box
/// Must have an ancestor [child] widget.
class NewsCard extends StatefulWidget {


  final String text;
  NewsCard({required this.text});

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  List<MyNews> subNews = Util.getMockedMyNews();
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

  @override
  Widget build(BuildContext context) {
    bool _hearted = false;

    return Container(
      width: MediaQuery.of(context).size.width - 60,
      // height: 60,
      // padding: EdgeInsets.all(0.2),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            child: Image.asset(
              'assets/images/news1.png',
              fit: BoxFit.cover,
            ),
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.text),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _hearted = true;
                    });
                  },
                  child: Icon(
                      _hearted
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Color(0xffD50404)),
                ),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: share,
                    child: Icon(
                      Icons.share,
                      color: Colors.green,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
