import 'package:covid_app/common/extension.dart';
import 'package:covid_app/common/style.dart';
import 'package:flutter/material.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: paddingOnly(top: 100.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fight Covid-19",
                style: AppStyle.kHeading4.copyWith(
                  color: AppStyle.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                "Ayo lawan Covid-19 di Indonesia bersama",
                style: AppStyle.kBodyText.copyWith(
                  color: AppStyle.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
