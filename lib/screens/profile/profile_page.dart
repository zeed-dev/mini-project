import 'package:covid_app/common/const.dart';
import 'package:covid_app/common/style.dart';
import 'package:covid_app/screens/auth/sign_in_page.dart';
import 'package:covid_app/view_models/auth_view_model.dart';
import 'package:covid_app/view_models/page_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final PageViewModel _pageViewModel = PageViewModel();

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: AppStyle.purple,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    "${AppConstant.IMAGE_PATH}/person_placeholder.png",
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Consumer<AuthViewModel>(
                  builder: (context, state, _) {
                    return Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.user?.name ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: AppStyle.kSubtitle.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: AppStyle.white,
                            ),
                          ),
                          Text(
                            state.user?.email ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: AppStyle.kSubtitle.copyWith(
                              fontSize: 16,
                              color: AppStyle.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                InkWell(
                  onTap: () async {
                    await _pageViewModel.selectedPageChange(0);
                    await _auth.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const SignInPage())),
                      (route) => false,
                    );
                  },
                  child: Icon(
                    Icons.exit_to_app,
                    color: AppStyle.white,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem({String text = "", Function? onTap}) {
      return InkWell(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        child: Container(
          margin: const EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: AppStyle.kSubtitle,
              ),
              Icon(
                Icons.chevron_right,
                color: AppStyle.purple,
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: AppStyle.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "General",
                  style: AppStyle.kSubtitle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                menuItem(
                  text: "Help",
                  onTap: () {},
                ),
                menuItem(
                  text: "Privacy & Policy",
                  onTap: () {},
                ),
                menuItem(
                  text: "Term of Service",
                  onTap: () {},
                ),
                menuItem(
                  text: "Rate App",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
