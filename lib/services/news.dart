import 'package:news_app_api/models/news_model.dart';
import 'package:news_app_api/services/networking.dart';
import 'package:news_app_api/utilities/values.dart';

class News {
  String _apiKey = '39bf4471bccb478f8eb00e743403f5b0';
  String _url = 'http://newsapi.org/v2/top-headlines?country=in';

  Future<void> getNews(int pageNumber) async {
    NetworkHelper networkHelper = NetworkHelper(
      url: '$_url&apiKey=$_apiKey&page=${pageNumber ?? 1}',
    );
    try {
      var response = await networkHelper.getResponseData();
      if (response['status'] == 'ok') {
        response['articles'].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            newsList.add(NewsModel.fromJson(element));
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future getNewsByCategories(int pageNumber, String category) async {
    List<NewsModel> list = [];
    NetworkHelper networkHelper = NetworkHelper(
      url: '$_url&category=$category&apiKey=$_apiKey&page=${pageNumber ?? 1}',
    );
    try {
      var response = await networkHelper.getResponseData();
      if (response['status'] == 'ok') {
        response['articles'].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            list.add(NewsModel.fromJson(element));
          }
        });
        return list;
      }
    } catch (e) {
      print(e);
    }
  }
}
