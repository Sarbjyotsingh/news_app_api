import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/services/news.dart';
import 'package:news_app_api/utilities/categories_data.dart';
import 'package:news_app_api/utilities/colors.dart';
import 'package:news_app_api/utilities/constant.dart';
import 'package:news_app_api/utilities/snack_bar.dart';
import 'package:news_app_api/utilities/values.dart';
import 'package:news_app_api/widgets/category_card.dart';
import 'package:news_app_api/widgets/news_tile.dart';
import 'package:news_app_api/widgets/rectangular_icon_button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    getCategories();
    getNews();
    super.initState();
  }

  void getNews() async {
    await News().getNews(pageNumber);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'News',
          style: kHeadingTextStyle.copyWith(color: primaryColor, fontSize: 22),
        ),
        actions: [
          RectangularButtonWithIcon(
            icon: Icons.sort_rounded,
            onPressed: () {
              setState(() {
                _loading = true;

                /// Sorting News
                ///
                newsList.sort((a, b) {
                  return a.title.compareTo(b.title);
                });
                _loading = false;
              });

              ///showing Snack Bar
              _scaffoldKey.currentState.showSnackBar(
                showSnackBar('News Sorted'),
              );
            },
          ),
        ],
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: !_loading
              ? Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 70,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryCard(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: newsList.length,
                        itemBuilder: (context, index) {
                          return NewsTile(news: newsList[index]);
                        },
                      ),
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
