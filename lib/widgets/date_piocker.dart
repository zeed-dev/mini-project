import 'package:covid_app/helper/date_helper.dart';
import 'package:flutter/material.dart';

Widget dateFieldWidget({
  required String label,
  required TextEditingController dateController,
  required BuildContext context,
  required Function(String) onChanged,
  bool isEnabled = true,
  bool isOptional = false,
  String? firstDate,
}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: TextField(
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
