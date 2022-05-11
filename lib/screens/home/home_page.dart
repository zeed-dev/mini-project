import 'package:covid_app/common/const.dart';
import 'package:covid_app/common/enum_state.dart';
import 'package:covid_app/common/extension.dart';
import 'package:covid_app/common/style.dart';
import 'package:covid_app/view_models/covid_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildWidgetHeader() {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            "${AppConstant.IMAGE_PATH}/bg.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: 135.0,
          ),
          Padding(
            padding: paddingOnly(
              top: 20.0,
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fight Covid-19",
                  style: AppStyle.kSubtitle.copyWith(
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
                    fontSize: 10.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: paddingAll(10.0),
                  decoration: BoxDecoration(
                    color: AppStyle.white,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: AppStyle.purple,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Indonesia",
                        style: AppStyle.kBodyText.copyWith(
                          color: AppStyle.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWidgetCovid() {
    return Consumer<CovidViewModel>(
      builder: (context, state, _) {
        if (state.requestState == RequestState.LOADING) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.requestState == RequestState.LOADED) {
          return Padding(
            padding: paddingOnly(
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Update Terkini",
                  style: AppStyle.kBodyText.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 107.0,
                      width: 102.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: const Color(0xffC8C8C8),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "${AppConstant.IMAGE_PATH}/ic_1.png",
                            width: 26,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            state.covid.positif.toString(),
                            style: AppStyle.kSubtitle.copyWith(
                              fontSize: 18,
                              color: AppStyle.purple,
                            ),
                          ),
                          Text(
                            "Positif",
                            style: AppStyle.kBodyText.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 107.0,
                      width: 102.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: const Color(0xffC8C8C8),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "${AppConstant.IMAGE_PATH}/ic_2.png",
                            width: 26,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            state.covid.positif.toString(),
                            style: AppStyle.kSubtitle.copyWith(
                              fontSize: 18,
                              color: AppStyle.green,
                            ),
                          ),
                          Text(
                            "Sembuh",
                            style: AppStyle.kBodyText.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 107.0,
                      width: 102.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: const Color(0xffC8C8C8),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "${AppConstant.IMAGE_PATH}/ic_3.png",
                            width: 26,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            state.covid.positif.toString(),
                            style: AppStyle.kSubtitle.copyWith(
                              fontSize: 18,
                              color: AppStyle.red,
                            ),
                          ),
                          Text(
                            "Meninggal",
                            style: AppStyle.kBodyText.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else if (state.requestState == RequestState.ERROR) {
          return Center(
            child: Text(
              state.errMsg,
              style: AppStyle.kSubtitle.copyWith(
                color: AppStyle.red,
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset(
          "${AppConstant.IMAGE_PATH}/banner.png",
          height: 87,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildService() {
    return Padding(
      padding: paddingLeft(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Layanan Fight Covid-19",
            style: AppStyle.kBodyText.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 88,
            width: 73,
            decoration: BoxDecoration(
              color: AppStyle.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "${AppConstant.IMAGE_PATH}/ic_rs.png",
                  width: 36,
                ),
                const SizedBox(height: 12),
                Text(
                  "Rumah Sakit\nRujukan",
                  textAlign: TextAlign.center,
                  style: AppStyle.kBodyText.copyWith(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAbout() {
    return Padding(
      padding: paddingOnly(left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            "Tentang Kami",
            style: AppStyle.kBodyText.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: AppStyle.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                "Sumber Informasi",
                style: AppStyle.kSubtitle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Kami menampilkan data dari sumber terpercaya",
                style: AppStyle.kSubtitle.copyWith(
                  fontSize: 10,
                ),
              ),
              dense: true,
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppStyle.grey,
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    Future.microtask(() =>
        Provider.of<CovidViewModel>(context, listen: false).getDataCovid());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWidgetHeader(),
              _buildWidgetCovid(),
              _buildBanner(),
              _buildService(),
              _buildAbout(),
            ],
          ),
        ),
      ),
    );
  }
}
