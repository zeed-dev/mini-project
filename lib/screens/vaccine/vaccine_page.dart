import 'package:covid_app/common/extension.dart';
import 'package:covid_app/common/slide_route_builder.dart';
import 'package:covid_app/common/style.dart';
import 'package:covid_app/widgets/dropdown_search.dart';
import 'package:covid_app/models/distric.dart';
import 'package:covid_app/models/province.dart';
import 'package:covid_app/models/vaccine.dart';
import 'package:covid_app/screens/vaccine/booking_page.dart';
import 'package:covid_app/view_models/vaccine_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VaccinePage extends StatefulWidget {
  const VaccinePage({Key? key}) : super(key: key);

  @override
  State<VaccinePage> createState() => _VaccinePageState();
}

class _VaccinePageState extends State<VaccinePage> {
  TextEditingController? _provinceController;
  TextEditingController? _districController;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    _provinceController = TextEditingController();
    _districController = TextEditingController();
    Future.microtask(
      () {
        Provider.of<VaccineViewModel>(context, listen: false).getProvince();
      },
    );
  }

  _getDistreict(String provinceKey) {
    Provider.of<VaccineViewModel>(context, listen: false)
        .getDistric(provinceKey);
  }

  _getVaccine(String provinceKey, String districKey) {
    if (provinceKey != "" && districKey != "") {
      Provider.of<VaccineViewModel>(context, listen: false)
          .getVaccine(provinceKey, districKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    VaccineViewModel _vaccineViewModel = Provider.of<VaccineViewModel>(context);

    return Scaffold(
      body: Padding(
        padding: paddingOnly(
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Text(
              "Daftar Vaksin",
              style: AppStyle.kBodyText.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30.0),
            DropdownSearchWidget(
              label: "Provinsi",
              controller: _provinceController ?? TextEditingController(),
              items: _vaccineViewModel.province as List<ProvinceModel>,
              onChanged: (value) {
                _provinceController?.text = value.toString();
                _getDistreict(value.key.toString());
              },
            ),
            const SizedBox(height: 12.0),
            Visibility(
              visible: _provinceController!.text.isNotEmpty,
              child: DropdownSearchWidget(
                label: "Kota",
                controller: _districController ?? TextEditingController(),
                items: _vaccineViewModel.distric as List<DistricModel>,
                onChanged: (value) {
                  _districController?.text = value.key.toString();
                  _getVaccine(
                    _provinceController?.text ?? "",
                    value.key.toString(),
                  );
                },
              ),
            ),
            const SizedBox(height: 12.0),
            Visibility(
              visible: _provinceController!.text.isNotEmpty &&
                  _districController!.text.isNotEmpty,
              child: Expanded(
                child: ListView.builder(
                  itemCount: _vaccineViewModel.vaccine!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: AppStyle.purple,
                      onTap: () {
                        Navigator.push(
                          context,
                          SlidePageRoute(
                            page: BookingPage(
                              vaccineModel: _vaccineViewModel.vaccine?[index] ??
                                  VaccineModel(),
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 0,
                        child: Padding(
                          padding: paddingAll(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Status",
                                    style: AppStyle.kBodyText.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    _vaccineViewModel.vaccine?[index].status ??
                                        "",
                                    style: AppStyle.kBodyText.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: AppStyle.green,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                _vaccineViewModel.vaccine?[index].nama ?? "",
                                overflow: TextOverflow.clip,
                                style: AppStyle.kBodyText.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                _vaccineViewModel.vaccine?[index].provinsi ??
                                    "",
                                style: AppStyle.kBodyText.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 12,
                                      ),
                                      Text(
                                        _vaccineViewModel
                                                .vaccine?[index].jenisFaskes ??
                                            "",
                                        style: AppStyle.kBodyText.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.phone,
                                        size: 12,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        _vaccineViewModel
                                                .vaccine?[index].telp ??
                                            "",
                                        style: AppStyle.kBodyText.copyWith(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                _vaccineViewModel.vaccine?[index].alamat ?? "",
                                style: AppStyle.kBodyText.copyWith(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
