import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;

  final Function(String)? onChange;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'Field is Required';
          }
          return null;
        },
        onChanged: onChange,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
