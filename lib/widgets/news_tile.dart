import 'package:flutter/cupertino.dart';
import 'package:news_app_api/models/news_model.dart';
import 'package:news_app_api/utilities/constant.dart';

class NewsTile extends StatelessWidget {
  final NewsModel news;
  NewsTile({
    @required this.news,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/articleView', arguments: news);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  news.urlToImage,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 12,
            ),
            Text(
              news.title,
              maxLines: 2,
              style: kHeadingTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
