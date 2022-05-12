import 'package:covid_app/common/style.dart';
import 'package:covid_app/screens/auth/sign_in_page.dart';
import 'package:covid_app/screens/main_page.dart';
import 'package:covid_app/view_models/auth_view_model.dart';
import 'package:covid_app/view_models/booking_view_model.dart';
import 'package:covid_app/view_models/covid_view_model.dart';
import 'package:covid_app/view_models/page_view_model.dart';
import 'package:covid_app/view_models/vaccine_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppStyle.purple,
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageViewModel()),
        ChangeNotifierProvider(create: (_) => CovidViewModel()),
        ChangeNotifierProvider(create: (_) => VaccineViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => BookingViewModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(colorScheme: AppStyle.kColorScheme),
        debugShowCheckedModeBanner: false,
        home: Consumer<AuthViewModel>(
          builder: (context, state, _) {
            return state.user != null ? const MainPage() : const SignInPage();
          },
        ),
      ),
    );
  }
}
