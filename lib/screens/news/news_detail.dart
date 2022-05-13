import 'dart:developer';
import 'dart:io';

import 'package:covid_app/common/style.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  bool isLoading = true;

  Widget newsWebView() {
    log("URL :: ${widget.url}");
    return WebView(
      initialUrl: widget.url,
      onPageFinished: (finish) {
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  Widget customAppBar(BuildContext context) {
    return Card(
      color: AppStyle.purple,
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16.0),
        ),
      ),
      margin: const EdgeInsets.all(0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppStyle.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              'Fight Covid',
              style: AppStyle.kHeading5.copyWith(color: AppStyle.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            newsWebView(),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox(),
            customAppBar(context),
          ],
        ),
      ),
    );
  }
}
