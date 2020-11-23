class NewsModel {
  String title;
  String description;
  String urlToImage;
  DateTime publishedAt;
  String content;
  String newsUrl;

  NewsModel({
    this.title,
    this.description,
    this.content,
    this.publishedAt,
    this.urlToImage,
    this.newsUrl,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      publishedAt: DateTime.parse(json['publishedAt']),
      content: json["content"],
      newsUrl: json["url"],
    );
  }
}
