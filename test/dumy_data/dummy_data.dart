import 'package:covid_app/models/covid.dart';
import 'package:covid_app/models/news.dart';
import 'package:covid_app/models/user.dart';

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

UserModel tUsersModelTest = UserModel(
  id: "1231233",
  email: "email@test.com",
  name: "Ziad Alfian",
  address: "Jl. Bla bla",
  phone: "083129431925",
  isAdmin: false,
);
