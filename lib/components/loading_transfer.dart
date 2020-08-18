import 'package:flutter/material.dart';
import 'package:ruff_wallet/common/constant.dart';
import '../common/app_localizations.dart';

class LoadingTransfer {
  static show(
    BuildContext context, {
    barrierDismissible = false,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => Center(
                // child: CircularProgressIndicator(
                //     valueColor: AlwaysStoppedAnimation<Color>(AppPrimaryColor)))

                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF07C8CA))),
                Text(AppLocalizations.of(context).loadingTransferText,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).accentTextTheme.bodyText1),
              ],
            )));
  }

  static hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}
