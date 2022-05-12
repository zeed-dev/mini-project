import 'package:covid_app/common/enum_state.dart';
import 'package:covid_app/common/extension.dart';
import 'package:covid_app/common/style.dart';
import 'package:covid_app/view_models/auth_view_model.dart';
import 'package:covid_app/view_models/booking_view_model.dart';
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
    Future.microtask(
      () {
        final userId =
            Provider.of<AuthViewModel>(context, listen: false).user?.id ?? "";

        return Provider.of<BookingViewModel>(context, listen: false)
            .getBookingByUserId(userId);
      },
    );

    super.initState();
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
            return SingleChildScrollView(
              child: Column(
                children: state.bookingList!.map((booking) {
                  if (state.requestState == RequestState.LOADING) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.requestState == RequestState.ERROR) {
                    return Center(
                      child: Text(state.errMsg),
                    );
                  } else if (state.requestState == RequestState.LOADED) {
                    return Container(
                      margin: paddingOnly(left: 16.0, right: 16.0, top: 16.0),
                      width: double.infinity,
                      height: 200,
                      child: Card(
                        elevation: 1,
                        child: Padding(
                          padding: paddingAll(16.0),
                          child: Column(
                            children: [
                              Text(
                                "Vaksin Covid-19",
                                style: AppStyle.kHeading6,
                              ),
                              Text(
                                "Riwayat vaksin yang sudah diterima",
                                style: AppStyle.kBodyText,
                              ),
                              const SizedBox(height: 16.0),
                              Text(
                                _authViewModel.user?.name ?? "",
                                style: AppStyle.kSubtitle,
                              ),
                              Text(
                                _authViewModel.user?.address ?? "",
                                style: AppStyle.kSubtitle,
                              ),
                              Text(
                                "Vaksin ke - ${booking.vaksinKe}",
                                style: AppStyle.kSubtitle,
                              ),
                              Text(
                                "Status - ${booking.status}",
                                style: AppStyle.kSubtitle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
