import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:covid_app/common/style.dart';

class DropdownSearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final List<dynamic> items;
  final Function(dynamic) onChanged;
  final String? label;
  final Function(dynamic)? onSaved;
  final bool isEnabled;
  final bool isOptional;
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;
  final TextStyle? labelStyle;

  const DropdownSearchWidget({
    Key? key,
    required this.controller,
    required this.items,
    required this.onChanged,
    this.label,
    this.onSaved,
    this.isEnabled = true,
    this.isOptional = false,
    this.margin,
    this.contentPadding,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      validator: isEnabled
          ? (value) {
              if (!isOptional) {
                if (value == null || value == '') {
                  return "$label tidak boleh kosong";
                } else {
                  return null;
                }
              }
              return null;
            }
          : null,
      onChanged: onChanged,
      dropdownSearchDecoration: InputDecoration(
        labelText: label,
        labelStyle: labelStyle,
        contentPadding:
            contentPadding ?? const EdgeInsets.fromLTRB(10, 10, 0, 0),
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
}
