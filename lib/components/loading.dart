import 'package:flutter/material.dart';
import 'package:ruff_wallet/common/constant.dart';

class Loading {
  static show(
    BuildContext context, {
    barrierDismissible = false,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppPrimaryColor),
      )),
    );
  }

  static hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}
