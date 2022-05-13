import 'package:covid_app/common/enum_state.dart';
import 'package:covid_app/common/extension.dart';
import 'package:covid_app/common/style.dart';
import 'package:covid_app/screens/news/news_detail.dart';
import 'package:covid_app/view_models/news_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    Future.microtask(
      () => Provider.of<NewsViewModel>(context, listen: false).getNews(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: Consumer<NewsViewModel>(
        builder: (context, state, _) {
          if (state.requestState == RequestState.LOADING) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.requestState == RequestState.LOADED) {
            return ListView.builder(
              itemCount: state.articles?.length,
              itemBuilder: (context, index) {
                final article = state.articles?[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsDetailPage(
                                  url: article?.url ?? "",
                                )));
                  },
                  child: ListTile(
                    contentPadding: paddingOnly(
                      top: 16.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    leading: Image.network(
                      article?.urlToImage ?? "",
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      article?.title ?? "",
                      style: AppStyle.kSubtitle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Text(
                      article?.description ?? "",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.kBodyText.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                state.errMsg,
                style: AppStyle.kSubtitle,
              ),
            );
          }
        },
      ),
    );
  }
}
