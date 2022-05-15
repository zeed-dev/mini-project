import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_app/common/enum_state.dart';
import 'package:covid_app/common/style.dart';
import 'package:covid_app/models/booking.dart';
import 'package:covid_app/models/vaccine.dart';
import 'package:covid_app/view_models/auth_view_model.dart';
import 'package:covid_app/view_models/booking_view_model.dart';
import 'package:covid_app/widgets/date_piocker.dart';
import 'package:covid_app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key, required this.vaccineModel}) : super(key: key);
  final VaccineModel vaccineModel;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  TextEditingController? _tglVaksinController;
  TextEditingController? _vaksinKeController;
  TextEditingController? _noTlpController;
  TextEditingController? _alamatController;
  TextEditingController? _faskesController;
  TextEditingController? _namaController;

  _init() {
    _tglVaksinController = TextEditingController();
    _vaksinKeController = TextEditingController();
    _noTlpController = TextEditingController();
    _alamatController = TextEditingController();
    _faskesController = TextEditingController();
    _namaController = TextEditingController();

    _faskesController?.text = widget.vaccineModel.jenisFaskes ?? "";
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthViewModel _authViewModel = Provider.of<AuthViewModel>(context);
    BookingViewModel _bookingViewModel = Provider.of<BookingViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/ilustrasi_booking.png',
                height: 150,
              ),
              const SizedBox(height: 16.0),
              Consumer<AuthViewModel>(
                builder: (context, state, _) {
                  _namaController?.text = state.user?.name ?? "";
                  return TextFieldWidget(
                    controller: _namaController ?? TextEditingController(),
                    onChange: (value) {},
                    label: "Nama Lengkap",
                  );
                },
              ),
              TextFieldWidget(
                controller: _faskesController ?? TextEditingController(),
                onChange: (value) {},
                label: "Faskes",
              ),
              Consumer<AuthViewModel>(
                builder: (context, state, _) {
                  _noTlpController?.text = state.user?.phone ?? "";
                  return TextFieldWidget(
                    controller: _noTlpController ?? TextEditingController(),
                    onChange: (value) {},
                    label: "No Telepon",
                  );
                },
              ),
              Consumer<AuthViewModel>(
                builder: (context, state, _) {
                  _alamatController?.text = state.user?.address ?? "";
                  return TextFieldWidget(
                    controller: _alamatController ?? TextEditingController(),
                    onChange: (value) {},
                    label: "Alamat",
                  );
                },
              ),
              dateFieldWidget(
                label: "Pilih Tanggal Vaksin",
                dateController: _tglVaksinController ?? TextEditingController(),
                context: context,
                onChanged: (value) {},
              ),
              TextFieldWidget(
                controller: _vaksinKeController ?? TextEditingController(),
                onChange: (value) {},
                label: "Vaklsin Ke",
              ),
              _bookingViewModel.requestState == RequestState.LOADING
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : OutlinedButton(
                      onPressed: () async {
                        if (_tglVaksinController?.text != "" &&
                            _vaksinKeController?.text != "" &&
                            _noTlpController?.text != "" &&
                            _alamatController?.text != "" &&
                            _faskesController?.text != "" &&
                            _namaController?.text != "") {
                          BookingModel bookingModel = BookingModel(
                            dateVisit: _tglVaksinController?.text,
                            vaksinKe: _vaksinKeController?.text,
                            noTelp: _noTlpController?.text,
                            alamat: _alamatController?.text,
                            faskes: _faskesController?.text,
                            userId: _authViewModel.user?.id,
                            nama: _namaController?.text,
                            createdAt: Timestamp.fromDate(DateTime.now()),
                            updatedAt: Timestamp.fromDate(DateTime.now()),
                          );

                          await _bookingViewModel
                              .createBooking(bookingModel)
                              .then((value) {
                            if (_bookingViewModel.requestState ==
                                RequestState.LOADED) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  "Berhasil Booking Vaksin!",
                                  style: AppStyle.kBodyText.copyWith(
                                    color: AppStyle.white,
                                  ),
                                ),
                                duration: const Duration(seconds: 1),
                              ));
                            } else if (_bookingViewModel.requestState ==
                                RequestState.ERROR) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  "Oppss...Gagal Booking Vaksin!",
                                  style: AppStyle.kBodyText.copyWith(
                                    color: AppStyle.white,
                                  ),
                                ),
                                duration: const Duration(seconds: 1),
                              ));
                            }
                          });
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 60,
                        ),
                        primary: AppStyle.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide(
                          color: AppStyle.purple,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        "Daftar Vaksin",
                        style: AppStyle.kHeading6,
                      ),
                    ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
