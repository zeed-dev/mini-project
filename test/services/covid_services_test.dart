import 'package:covid_app/models/covid.dart';
import 'package:covid_app/models/news.dart';
import 'package:covid_app/services/covid_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../dumy_data/dummy_data.dart';
import 'covid_services_test.mocks.dart';

@GenerateMocks(
  [CovidService],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {
  late CovidService covidService;

  setUp(() {
    covidService = MockCovidService();
  });

  group('Covid Test', () {
    test('Should get data cobid-19 from the services', () async {
      when(covidService.getDataCovid()).thenAnswer((_) async => tCovidTest);

      CovidModel covid = await covidService.getDataCovid();
      expect(covid, tCovidTest);
    });
  });
}
