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
    if (value.isEmpty) return '请输入';
    if (!_addressValid) return '收款地址无效，请重新输入';
    return null;
  }

  String _validateTokenCount(String value) {
    if (value.isEmpty) return '请输入';
    double count = double.tryParse(value);
    if (count == null) {
      return '请输入有效的数字';
    }
    if (count == 0) {
      return '请输入数量';
    }
    var s = value.split('.');
    if (s.length > 1 && s.elementAt(1).length > 9) {
      return 'Token精度输入最多9位';
    }
    return null;
  }

  String _validateFee(value) {
    if (value.isEmpty) return '请输入';
    double count = double.tryParse(value);
    if (count == null) {
      return '请输入有效的数字';
    }
    if (count < 0.1) {
      return '请输入≥0.1的Gasfee';
    }
    var s = value.split('.');
    if (s.length > 1 && s.elementAt(1).length > 9) {
      return 'Token精度输入最多9位';
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
              title: '交易已确认',
              content: '交易Hash值：' + res['hash'],
              showCancel: false,
              confirmText: '关闭',
              confirm: () {
                _formKey.currentState.reset();
              },
            );
          } else {
            showModal(
              context: context,
              title: '交易待确认',
              content: '交易发送成功，但是在短时间内还没获取到交易成功执行的信息，请自行确认交易是否被链执行。交易Hash值：' +
                  res['hash'],
              cancelText: '关闭',
              confirmText: '复制Hash',
              confirm: (bool confirmed) async {
                if (confirmed) {
                  await Clipboard.setData(
                    ClipboardData(text: res['hash']),
                  );
                  _scaffoldKey.currentState.hideCurrentSnackBar();
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text('复制成功'),
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
        res = '请在手机设置中开启应用的相机权限，才能正常使用扫码功能。';
      } else {
        res = '相机访问出错';
      }
    } on FormatException {
      // 'null (User returned using the "back"-button before scanning anything. )
    } catch (e) {
      res = '相机访问出错';
    }
    if (res.isNotEmpty) {
      showModal(
        context: context,
        title: '出错',
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
        title: const Text('RUFF 转账'),
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
                labelText: '收款地址',
                helperText: '请输入收款地址',
                validator: _validateAddress,
                suffixIcon: GestureDetector(
                  onTap: _scan,
                  child: Icon(Icons.crop_free),
                ),
              ),
              const SizedBox(height: 24.0),
              CustomTextField(
                controller: _tokenCountController,
                labelText: 'Token 数量',
                helperText: '请输入转账数量',
                validator: _validateTokenCount,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 24.0),
              CustomTextField(
                controller: _feeController,
                labelText: 'Gas Fee (RUFF)',
                helperText: '请输入 ≥ 0.1的矿工费用',
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
        '开始转账',
        onPressed: _submit,
      ),
    );
  }
}
