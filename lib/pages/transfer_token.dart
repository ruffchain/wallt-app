import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ruff_wallet/common/chain_utils.dart';
import 'package:ruff_wallet/common/constant.dart';
import 'package:ruff_wallet/common/utils.dart';
import 'package:ruff_wallet/common/wallet_account.dart';
import 'package:ruff_wallet/components/button.dart';
import 'package:ruff_wallet/components/confirm_dialog.dart';
import 'package:ruff_wallet/components/input_password_dialog.dart';
import 'package:ruff_wallet/components/loading.dart';
import 'package:ruff_wallet/components/text_form_field.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/app_localizations.dart';

class TransferTokenPage extends StatefulWidget {
  static String routeName = 'TransferTokenPage';
  const TransferTokenPage({Key key}) : super(key: key);

  _TransferTokenPageState createState() => _TransferTokenPageState();
}

class _TransferTokenPageState extends State<TransferTokenPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _tokenCountController = TextEditingController();
  final _feeController = TextEditingController();
  bool _addressValid = false;

  String _validateAddress(value) {
    if (value.isEmpty) return AppLocalizations.of(context).transferTokenEnter;
    if (!_addressValid)
      return AppLocalizations.of(context).transferTokenInvalidAddr;
    return null;
  }

  String _validateTokenCount(String value) {
    if (value.isEmpty) return AppLocalizations.of(context).transferTokenEnter;
    double count = double.tryParse(value);
    if (count == null) {
      return AppLocalizations.of(context).transferTokenEnterValid;
    }
    if (count == 0) {
      return AppLocalizations.of(context).transferTokenEnterAmount;
    }
    var s = value.split('.');
    if (s.length > 1 && s.elementAt(1).length > 9) {
      return AppLocalizations.of(context).transferTokenErrPrecision;
    }
    return null;
  }

  String _validateFee(value) {
    if (value.isEmpty) return AppLocalizations.of(context).transferTokenEnter;
    double count = double.tryParse(value);
    if (count == null) {
      return AppLocalizations.of(context).transferTokenEnterValid;
    }
    if (count < 0.1) {
      return AppLocalizations.of(context).transferTokenErrGasfee;
    }
    var s = value.split('.');
    if (s.length > 1 && s.elementAt(1).length > 9) {
      return AppLocalizations.of(context).transferTokenErrPrecision;
    }
    return null;
  }

  Future<bool> _asyncValidate() async {
    Loading.show(context);
    var address = _addressController.text;
    _addressValid = await isValidAddress(address);
    Loading.hide(context);
    return _formKey.currentState.validate();
  }

  _submit() async {
    var formValid = await _asyncValidate();
    if (formValid) {
      var prefs = await SharedPreferences.getInstance();
      var address = prefs.getString(PreferencesKeys.activeWalletAddress);
      var addressInfo = prefs.getString(address);
      var accountInfo = WalletAccount.fromJson(jsonDecode(addressInfo));
      var password = await InputPassswordDialog.show(context, accountInfo);
      // var password = '111111111';
      if (password.isNotEmpty) {
        Loading.show(context);
        var privateKey = await JsChainLib.privateKeyFromKeyStore(
            accountInfo.keystore, password);
        try {
          var res = await transferToken(
            from: address,
            to: rmAddressPrefix(_addressController.text),
            count: _tokenCountController.text,
            fee: _feeController.text,
            privateKey: privateKey,
          );
          print(res);
          Loading.hide(context);
          if (res['confirmed']) {
            showModal(
              context: context,
              title:
                  AppLocalizations.of(context).transferTokenConfirmModalTitle,
              content: AppLocalizations.of(context)
                      .transferTokenConfirmModalContent +
                  res['hash'],
              showCancel: false,
              confirmText:
                  AppLocalizations.of(context).transferTokenConfirmModalClose,
              confirm: () {
                _formKey.currentState.reset();
              },
            );
          } else {
            showModal(
              context: context,
              title:
                  AppLocalizations.of(context).transferTokenConfirmModalTitle,
              content: AppLocalizations.of(context)
                      .transferTokenUnconfirmModalContent +
                  res['hash'],
              cancelText:
                  AppLocalizations.of(context).transferTokenUnconfirmModalClose,
              confirmText:
                  AppLocalizations.of(context).transferTokenUnconfirmModalCopy,
              confirm: (bool confirmed) async {
                if (confirmed) {
                  await Clipboard.setData(
                    ClipboardData(text: res['hash']),
                  );
                  _scaffoldKey.currentState.hideCurrentSnackBar();
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text(AppLocalizations.of(context)
                          .transferTokenUnconfirmModalCopyOK),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                }
              },
            );
          }
        } catch (e) {
          Loading.hide(context);
          print(e);
        }
      }
    }
  }

  Future _scan() async {
    var res = '';
    try {
      await Future.delayed(Duration.zero);
      FocusScope.of(context).requestFocus(new FocusNode());
      String barcode = await BarcodeScanner.scan();
      _addressController.text = barcode;
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        res = AppLocalizations.of(context).transferTokenScanDenied;
      } else {
        res = AppLocalizations.of(context).transferTokenScanAccessErr;
      }
    } on FormatException {
      // 'null (User returned using the "back"-button before scanning anything. )
    } catch (e) {
      res = AppLocalizations.of(context).transferTokenScanAccessErr;
    }
    if (res.isNotEmpty) {
      showModal(
        context: context,
        title: AppLocalizations.of(context).transferTokenScanErr,
        content: res,
        showCancel: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).transferTokenTransfer),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              _form(),
              _bottomButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _form() {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 10),
              CustomTextField(
                controller: _addressController,
                labelText:
                    AppLocalizations.of(context).transferTokenFormAddressLabel,
                helperText:
                    AppLocalizations.of(context).transferTokenFormAddressHelper,
                validator: _validateAddress,
                suffixIcon: GestureDetector(
                  onTap: _scan,
                  child: Icon(Icons.crop_free),
                ),
              ),
              const SizedBox(height: 24.0),
              CustomTextField(
                controller: _tokenCountController,
                labelText:
                    AppLocalizations.of(context).transferTokenFormTokenLabel,
                helperText:
                    AppLocalizations.of(context).transferTokenFormTokenHelper,
                validator: _validateTokenCount,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 24.0),
              CustomTextField(
                controller: _feeController,
                labelText: 'Gas Fee (RUFF)',
                helperText:
                    AppLocalizations.of(context).transferTokenFormGasHelper,
                validator: _validateFee,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomButton() {
    return SizedBox(
      width: double.infinity,
      child: myPrimaryButton(
        AppLocalizations.of(context).transferTokenStart,
        onPressed: _submit,
      ),
    );
  }
}
