import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/models/news_model.dart';
import 'package:news_app_api/services/news.dart';
import 'package:news_app_api/utilities/colors.dart';
import 'package:news_app_api/utilities/constant.dart';
import 'package:news_app_api/utilities/values.dart';
import 'package:news_app_api/widgets/news_tile.dart';

class CategoryNews extends StatefulWidget {
  final String newsCategory;
  CategoryNews({
    @required this.newsCategory,
  });

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  bool _loading = true;
  List<NewsModel> list;

  void getNews() async {
    list =
        await News().getNewsByCategories(1, widget.newsCategory.toLowerCase());
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
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
        title: Text(
          widget.newsCategory + ' News',
          style: kHeadingTextStyle.copyWith(color: primaryColor, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: list.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewsTile(
                              news: list[index],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
