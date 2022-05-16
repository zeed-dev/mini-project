import 'package:covid_app/models/user.dart';
import 'package:covid_app/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../dumy_data/dummy_data.dart';
import 'auth_services_test.mocks.dart';

@GenerateMocks([AuthService])
void main() {
  late AuthService authService;

  setUp(() {
    authService = MockAuthService();
  });

  group('Auth Test', () {
    test('Should get user data when sign in from the services', () async {
      when(authService.signIn("email@test.com", "123123123"))
          .thenAnswer((_) async => tUsersModelTest);

      UserModel userModel = await authService.signIn(
        "email@test.com",
        "123123123",
      );
      expect(userModel, tUsersModelTest);
    });

    test('Should get user data when sign up from the services', () async {
      when(authService.signUp(tUsersModelTest, "123123123"))
          .thenAnswer((_) async => tUsersModelTest);

      UserModel userModel = await authService.signUp(
        tUsersModelTest,
        "123123123",
      );
      expect(userModel, tUsersModelTest);
    });

    test('Should get user data by id from the services', () async {
      when(authService.getUserById("123123123"))
          .thenAnswer((_) async => tUsersModelTest);

      UserModel userModel = await authService.getUserById("123123123");
      expect(userModel, tUsersModelTest);
    });

    test('Should set user from the services', () async {
      when(authService.setUser(tUsersModelTest))
          .thenAnswer((_) async => tUsersModelTest);

      authService.setUser(tUsersModelTest);
    });
  });
}
