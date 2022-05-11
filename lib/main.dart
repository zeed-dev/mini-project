import 'package:covid_app/common/style.dart';
import 'package:covid_app/screens/main_page.dart';
import 'package:covid_app/view_models/covid_view_model.dart';
import 'package:covid_app/view_models/page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
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
        statusBarColor: AppStyle.purple, // status bar color
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageViewModel()),
        ChangeNotifierProvider(create: (_) => CovidViewModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
