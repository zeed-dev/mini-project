class NewsResponse {
  NewsResponse({
    required this.articles,
  });

  final List<Article> articles;

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        articles: List<Article>.from(
          (json["articles"] as List).map((x) => Article.fromJson(x)).where(
                (article) =>
                    article.author != null &&
                    article.urlToImage != null &&
                    article.publishedAt != null &&
                    article.content != null,
              ),
        ),
      );
}

class Article {
  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );
}
