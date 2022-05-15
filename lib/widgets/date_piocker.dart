// ignore_for_file: must_be_immutable

import 'package:covid_app/helper/date_helper.dart';
import 'package:flutter/material.dart';

class DateFieldWidget extends StatelessWidget {
  DateFieldWidget({
    Key? key,
    required this.label,
    required this.onChanged,
    required this.dateController,
    this.firstDate,
    this.isEnabled = true,
    this.isOptional = false,
  }) : super(key: key);

  String? label;
  TextEditingController dateController;
  BuildContext? context;
  Function(String) onChanged;
  bool? isEnabled;
  bool? isOptional;
  String? firstDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        enabled: isEnabled,
        onTap: () async {
          var dataTime = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: firstDate != null
                  ? DateHelper.convertStringToDateTime(firstDate)!
                  : DateTime(1945),
              lastDate: DateTime(2050));
          dateController.text =
              DateHelper.changeFormatIdToDateTimeFormat(date: dataTime) ?? "";
          onChanged(dateController.text);
        },
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "$label tidak boleh kosong";
          } else {
            return null;
          }
        },
        onChanged: (value) {},
        controller: dateController,
        readOnly: true,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }
}
