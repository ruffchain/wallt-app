import 'package:flutter/material.dart';
import 'package:ruff_wallet/common/constant.dart';

const _defaultInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black12),
);

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String helperText;
  final TextEditingController controller;
  final bool obscureText;
  final FormFieldValidator<String> validator;
  final Widget suffixIcon;
  final TextInputType keyboardType;
  final int minLines;
  final int maxLines;

  CustomTextField({
    this.labelText,
    this.helperText,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.minLines,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        helperText: helperText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        focusColor: AppPrimaryColor,
        hoverColor: Colors.black12,
        errorBorder: _defaultInputBorder,
        focusedErrorBorder: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        border: _defaultInputBorder,
      ),
    );
  }
}
