import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_app/common/enum_state.dart';
import 'package:covid_app/common/extension.dart';
import 'package:covid_app/common/style.dart';
import 'package:covid_app/view_models/booking_view_model.dart';
import 'package:covid_app/widgets/item_card.dart';
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
                            margin:
                                paddingOnly(left: 16.0, right: 16.0, top: 16.0),
                            width: double.infinity,
                            child: Card(
                              elevation: 1,
                              child: Padding(
                                padding: paddingAll(16.0),
                                child: Column(
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
                                        "Silahkan konfirmasi vaksin",
                                        style: AppStyle.kBodyText.copyWith(
                                          fontWeight: FontWeight.w100,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    ItemCardWidget(
                                      keys: "Nama",
                                      value: booking.nama,
                                    ),
                                    ItemCardWidget(
                                      keys: "Alamat",
                                      value: booking.alamat,
                                    ),
                                    ItemCardWidget(
                                      keys: "Tanggal vaksin",
                                      value: booking.dateVisit,
                                    ),
                                    ItemCardWidget(
                                      keys: "Vaksin ke",
                                      value: booking.vaksinKe,
                                    ),
                                    ItemCardWidget(
                                      keys: "Status",
                                      value: booking.status,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        BookingViewModel _bookingViewModel =
                                            Provider.of<BookingViewModel>(
                                                context,
                                                listen: false);
                                        _bookingViewModel
                                            .updateBooking(
                                          booking.copyWith(
                                            status: "APPROVED",
                                            updatedAt: Timestamp.fromDate(
                                                DateTime.now()),
                                          ),
                                        )
                                            .then((value) {
                                          _bookingViewModel
                                              .getBookingByStatus("BOOKED");
                                        });
                                      },
                                      child: const Text("Aprove"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList()
                      : [
                          const SizedBox(),
                        ],
                ),
              );
            } else {
              return Center(
                child: Text(state.errMsg),
              );
            }
          },
        ),
      ),
    );
  }
}
