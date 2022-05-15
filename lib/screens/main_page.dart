import 'package:covid_app/components/bottom_navbar.dart';
import 'package:covid_app/screens/home/home_page.dart';
import 'package:covid_app/screens/profile/profile_page.dart';
import 'package:covid_app/screens/vaccine/vaccine_page.dart';
import 'package:covid_app/view_models/page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageViewModel _pageViewModel = Provider.of<PageViewModel>(context);
    final List<Widget> _screen = [
      const HomePage(),
      const VaccinePage(),
      const ProfilePage(),
    ];
    return Scaffold(
      body: SafeArea(child: _screen[_pageViewModel.selectedPage]),
      bottomNavigationBar: buildBottomNavigationBar(_pageViewModel),
    );
  }
}
