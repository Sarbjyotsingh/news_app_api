import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/models/news_model.dart';
import 'package:news_app_api/utilities/colors.dart';
import 'package:news_app_api/utilities/constant.dart';
import 'package:news_app_api/utilities/date_time.dart';
import 'package:news_app_api/utilities/values.dart';

class ArticleView extends StatelessWidget {
  final NewsModel news;
  ArticleView({
    @required this.news,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            isIOS ? Icons.keyboard_arrow_left : Icons.keyboard_backspace,
            size: 40,
            color: primaryColor,
          ),
        ),
        backgroundColor: whiteColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      news.urlToImage,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(
                        '${news.title}',
                        style: kHeadingTextStyle,
                      ),
                    ),
                  ),
                  news.publishedAt != null
                      ? Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            ConvertDateTime.durationFromEvent(news.publishedAt),
                            style: kTimeTextStyle,
                          ),
                        )
                      : Container(),
                  news.content != null
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              '${news.content}',
                              style: kDescriptionTextStyle,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            FlatButton(
              child: Text(
                'Click to read more',
                style: kReadMoreTextStyle,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/webView',
                    arguments: news.newsUrl);
              },
            ),
          ],
        ),
      ),
    );
  }
}
