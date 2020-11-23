import 'package:flutter/material.dart';
import 'package:news_app_api/view/article_view.dart';
import 'package:news_app_api/view/category_news.dart';
import 'package:news_app_api/view/home.dart';
import 'package:news_app_api/view/web_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/articleView':
        return MaterialPageRoute(
          builder: (_) => ArticleView(
            news: args,
          ),
        );
      case '/categoryView':
        return MaterialPageRoute(
          builder: (_) => CategoryNews(
            newsCategory: args,
          ),
        );
      case '/webView':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => WebsiteView(
              url: args,
            ),
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
