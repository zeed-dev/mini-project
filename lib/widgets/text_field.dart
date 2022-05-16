import 'package:covid_app/common/style.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.onChange,
    required this.label,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final Function onChange;
  final String label;
  final bool obscureText;

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.label,
          label: Text(widget.label),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppStyle.purple,
              width: 2,
            ),
          ),
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "${widget.label} tidak boleh kosong";
          } else {
            return null;
          }
        },
        obscureText: widget.obscureText,
        textInputAction: TextInputAction.search,
      ),
    );
  }
}
