import 'package:covid_app/models/news.dart';
import 'package:covid_app/services/new_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../dumy_data/dummy_data.dart';
import 'news_services_test.mocks.dart';

@GenerateMocks(
  [NewsService],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {
  late NewsService newsService;

  setUp(() {
    newsService = MockNewsService();
  });

  group('News Test', () {
    test('Should get list of News from the services', () async {
      when(newsService.getArticle()).thenAnswer((_) async => tNewsTest);

      List<Article> news = await newsService.getArticle();
      expect(news, tNewsTest);
    });
  });
}
