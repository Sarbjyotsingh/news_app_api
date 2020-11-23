import 'dart:io';

import 'package:news_app_api/models/categories_model.dart';
import 'package:news_app_api/models/news_model.dart';

List<NewsModel> newsList = [];

bool isIOS = Platform.isIOS;

List<CategoriesModel> categories = [];

int pageNumber = 1;
