import 'package:covid_app/common/style.dart';
import 'package:flutter/material.dart';

Widget itemCardWidget({
  String? value,
  String? key,
  Color? color,
  EdgeInsets? padding,
}) {
  return Padding(
    padding: padding ??
        const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 2,
        ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(key ?? ""),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: ': ',
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                      text: value,
                      style: AppStyle.kSubtitle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: color ??
                            (value == "BOOKED"
                                ? Colors.orange
                                : value == "APPROVED"
                                    ? Colors.green
                                    : Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
