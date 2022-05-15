import 'package:covid_app/common/enum_state.dart';
import 'package:covid_app/common/extension.dart';
import 'package:covid_app/common/style.dart';
import 'package:covid_app/helper/date_helper.dart';
import 'package:covid_app/view_models/auth_view_model.dart';
import 'package:covid_app/view_models/booking_view_model.dart';
import 'package:covid_app/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryVaccine extends StatefulWidget {
  const HistoryVaccine({Key? key}) : super(key: key);

  @override
  State<HistoryVaccine> createState() => _HistoryVaccineState();
}

class _HistoryVaccineState extends State<HistoryVaccine> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    Future.microtask(
      () {
        final userId =
            Provider.of<AuthViewModel>(context, listen: false).user?.id ?? "";

        Provider.of<BookingViewModel>(context, listen: false)
            .getBookingByUserId(userId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthViewModel _authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('History Vaccine'),
      ),
      body: SafeArea(
        child: Consumer<BookingViewModel>(
          builder: (context, state, _) {
            if (state.requestState == RequestState.LOADING) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.requestState == RequestState.ERROR) {
              return Center(
                child: Text(state.errMsg),
              );
            } else if (state.requestState == RequestState.LOADED) {
              return SingleChildScrollView(
                child: Column(
                  children: state.bookingList != null
                      ? state.bookingList!.map((booking) {
                          return Container(
                            margin: paddingOnly(
                              left: 16.0,
                              right: 16.0,
                              top: 16.0,
                            ),
                            width: double.infinity,
                            child: Card(
                              elevation: 1,
                              child: Padding(
                                padding: paddingAll(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        "Vaksin Covid-19",
                                        style: AppStyle.kHeading6.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "Riwayat vaksin yang sudah diterima",
                                        style: AppStyle.kBodyText.copyWith(
                                          fontWeight: FontWeight.w100,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    itemCardWidget(
                                      key: "Nama",
                                      value: _authViewModel.user?.name,
                                    ),
                                    itemCardWidget(
                                      key: "Alamat",
                                      value: _authViewModel.user?.address,
                                    ),
                                    itemCardWidget(
                                      key: "Vakisn ke",
                                      value: booking.vaksinKe,
                                    ),
                                    itemCardWidget(
                                      key: "Tanggal Vaksin",
                                      value: booking.dateVisit,
                                    ),
                                    itemCardWidget(
                                      key: "Status",
                                      value: booking.status,
                                    ),
                                    const Divider(),
                                    itemCardWidget(
                                      key: "Dibuat Tanggal",
                                      value: DateHelper
                                          .changeFormatIdToDateTimeFormat(
                                        date: booking.createdAt?.toDate(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList()
                      : [
                          const Center(
                            child: Text("Tidak ada data"),
                          )
                        ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
