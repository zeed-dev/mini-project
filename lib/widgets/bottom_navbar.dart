import 'package:covid_app/common/style.dart';
import 'package:covid_app/view_models/page_view_model.dart';
import 'package:flutter/material.dart';

class BootomNavbarWidget extends StatelessWidget {
  const BootomNavbarWidget({
    Key? key,
    required this.pageViewModel,
  }) : super(key: key);

  final PageViewModel pageViewModel;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: AppStyle.purple,
      unselectedItemColor: AppStyle.grey,
      currentIndex: pageViewModel.selectedPage,
      onTap: (idx) {
        pageViewModel.selectedPageChange(idx);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.health_and_safety_rounded),
          label: "Vaccine",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
