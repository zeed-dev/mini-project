import 'package:covid_app/common/enum_state.dart';
import 'package:covid_app/common/extension.dart';
import 'package:covid_app/common/style.dart';
import 'package:covid_app/view_models/booking_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApproveVaccine extends StatefulWidget {
  const ApproveVaccine({Key? key}) : super(key: key);

  @override
  State<ApproveVaccine> createState() => _ApproveVaccineState();
}

class _ApproveVaccineState extends State<ApproveVaccine> {
  @override
  void initState() {
    Future.microtask(
      () {
        return Provider.of<BookingViewModel>(context, listen: false)
            .getBookingByStatus("BOOKED");
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Approve Vaccine'),
      ),
      body: SafeArea(
        child: Consumer<BookingViewModel>(
          builder: (context, state, _) {
            return SingleChildScrollView(
              child: Column(
                children: state.bookingList != null
                    ? state.bookingList!.map((booking) {
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
                            margin:
                                paddingOnly(left: 16.0, right: 16.0, top: 16.0),
                            width: double.infinity,
                            height: 230,
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
                                      "Silahkan konfirmasi vaksin",
                                      style: AppStyle.kBodyText,
                                    ),
                                    const SizedBox(height: 16.0),
                                    Text(
                                      booking.nama ?? "",
                                      style: AppStyle.kSubtitle,
                                    ),
                                    Text(
                                      booking.alamat ?? "",
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            BookingViewModel _bookingViewModel =
                                                Provider.of<BookingViewModel>(
                                                    context,
                                                    listen: false);
                                            _bookingViewModel
                                                .updateBooking(
                                              booking.copyWith(
                                                status: "APPROVED",
                                              ),
                                            )
                                                .then((value) {
                                              _bookingViewModel
                                                  .getBookingByStatus("BOOKED");
                                            });
                                          },
                                          icon: const Icon(Icons.check),
                                          color: Colors.green,
                                        ),
                                        Text(
                                          "Approve",
                                          style: AppStyle.kBodyText.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      }).toList()
                    : [
                        const SizedBox(),
                      ],
              ),
            );
          },
        ),
      ),
    );
  }
}
