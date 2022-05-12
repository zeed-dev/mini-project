import 'package:covid_app/common/style.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

Widget dropDownSearchWidget({
  String? label,
  required TextEditingController controller,
  required List<dynamic> items,
  Function? getData,
  required Function(dynamic) onChanged,
  Function(dynamic)? onSaved,
  bool isEnabled = true,
  bool isOptional = false,
  EdgeInsets? margin,
  EdgeInsets? contentPadding,
  TextStyle? labelStyle,
}) {
  return DropdownSearch<dynamic>(
    onSaved: onSaved,
    enabled: isEnabled,
    items: items,
    selectedItem: controller.text == "" ? null : controller.text,
    popupTitle: Container(
      margin: margin ?? const EdgeInsets.all(15),
      child: Center(
        child: Text(
          label ?? "",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    ),
    compareFn: (a, b) => a == b,
    maxHeight: 300,
    onFind: getData == null ? null : (dynamic filter) => getData(filter),
    validator: isEnabled
        ? (value) {
            if (!isOptional) {
              if (value == null || value == '') {
                return "$label tidak boleh kosong";
              } else {
                return null;
              }
            }
          }
        : null,
    onChanged: onChanged,
    showSearchBox: getData == null ? false : true,
    dropdownSearchDecoration: InputDecoration(
      labelText: label,
      labelStyle: labelStyle,
      contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(10, 10, 0, 0),
      border: const OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppStyle.purple,
          width: 2,
        ),
      ),
      isDense: true,
    ),
  );
}
