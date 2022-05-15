import 'package:covid_app/models/covid.dart';
import 'package:covid_app/models/news.dart';

final tCovidTest = CovidModel(
  positif: 11111,
  dirawat: 11111,
  sembuh: 1111,
  meninggal: 11111,
  lastUpdate: DateTime.now(),
);

final tNewsTest = <Article>[
  Article(
    author: "author",
    title: "title",
    description: "description",
    url: "url",
    urlToImage: "urlToImage",
    publishedAt: DateTime.now(),
    content: "content",
  ),
];
