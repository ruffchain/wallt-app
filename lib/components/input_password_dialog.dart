import 'package:flutter/material.dart';
import 'package:ruff_wallet/common/chain_utils.dart';
import 'package:ruff_wallet/common/constant.dart';
import 'package:ruff_wallet/common/wallet_account.dart';
import '../common/app_localizations.dart';

class InputPassswordDialog extends StatefulWidget {
  final WalletAccount accountInfo;

  static Future<String> show(
      BuildContext context, WalletAccount accountInfo) async {
    var password = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => InputPassswordDialog(accountInfo),
    );
    return password;
  }

  const InputPassswordDialog(this.accountInfo, {Key key}) : super(key: key);
  @override
  _InputPassswordDialogState createState() => _InputPassswordDialogState();
}

class _InputPassswordDialogState extends State<InputPassswordDialog> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = new TextEditingController();
  bool _passwordError;
  bool _loading = false;

  _cancle() {
    Navigator.of(context).pop('');
  }

  _confirmPassword() async {
    _passwordError = false;

    try {
      var password = _passwordController.text;
      if (password.isNotEmpty) {
        setState(() {
          _loading = true;
        });
        var privatekey = await JsChainLib.privateKeyFromKeyStore(
            widget.accountInfo.keystore, password);
        var address = await JsChainLib.addressFromPrivateKey(privatekey);
        if (address == widget.accountInfo.address) {
          return Navigator.of(context).pop(password);
        } else {
          throw 'password err';
        }
      }
    } catch (e) {
      _passwordError = true;
    }
    setState(() {
      _loading = false;
    });
    _formKey.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    var _inputView = Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 20,
            bottom: 25,
          ),
          child: Text(
            AppLocalizations.of(context).inputPasswordDlgText,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Form(
              key: _formKey,
              child: SizedBox(
                height: 70,
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    hintStyle: TextStyle(
                      color: Color(0x01ffffff),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty)
                      return AppLocalizations.of(context).inputPasswordDlgEmpty;
                    if (_passwordError)
                      return AppLocalizations.of(context).inputPasswordDlgWrong;
                    return null;
                  },
                ),
              ),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: _cancle,
                child: Text(
                  AppLocalizations.of(context).inputPasswordDlgCancel,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            Container(
              width: 1,
              height: 22,
              color: Colors.black12,
            ),
            Expanded(
              child: FlatButton(
                onPressed: _confirmPassword,
                child: Text(
                  AppLocalizations.of(context).inputPasswordDlgConfirm,
                  style: TextStyle(
                    color: AppPrimaryColor,
                    fontSize: 18.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 190.0,
        child: Stack(
          children: [
            Offstage(
              offstage: _loading,
              child: _inputView,
            ),
            Offstage(
              offstage: !_loading,
              child: Container(
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppPrimaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
