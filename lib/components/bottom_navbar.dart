import 'package:covid_app/common/style.dart';
import 'package:covid_app/view_models/page_view_model.dart';
import 'package:flutter/material.dart';

Widget buildBottomNavigationBar(PageViewModel _pageViewModel) {
  return BottomNavigationBar(
    selectedItemColor: AppStyle.purple,
    unselectedItemColor: AppStyle.grey,
    currentIndex: _pageViewModel.selectedPage,
    onTap: (idx) {
      _pageViewModel.selectedPageChange(idx);
    },
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: "Profile",
      ),
    ],
  );
}
