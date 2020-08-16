import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ruff_wallet/common/constant.dart';
import 'package:ruff_wallet/common/utils.dart';
import 'package:ruff_wallet/common/wallet_account.dart';
import 'package:ruff_wallet/components/button.dart';
import 'package:ruff_wallet/components/input_password_dialog.dart';
import 'package:ruff_wallet/pages/import_wallet.dart';
import 'package:ruff_wallet/pages/init_wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'backup_account.dart';
import '../common/app_localizations.dart';

class AccountManagerPage extends StatefulWidget {
  static const routeName = '/AccountManagerPage';

  const AccountManagerPage({Key key}) : super(key: key);

  @override
  _AccountManagerPageState createState() => _AccountManagerPageState();
}

class _AccountManagerPageState extends State<AccountManagerPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  WalletAccount _accountInfo;
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future _init() async {
    await Future.delayed(Duration.zero);
    var address = ModalRoute.of(context).settings.arguments;
    var prefs = await SharedPreferences.getInstance();
    var addressInfo = prefs.getString(address);
    var accountInfo = WalletAccount.fromJson(jsonDecode(addressInfo));
    setState(() {
      _accountInfo = accountInfo;
    });
  }

  _deleteAddress() async {
    String password = await InputPassswordDialog.show(context, _accountInfo);
    if (password.isEmpty) return;

    var address = _accountInfo.address;
    var prefs = await SharedPreferences.getInstance();
    var addressList = prefs.getStringList(PreferencesKeys.addressList);
    var activeAddress = prefs.getString(PreferencesKeys.activeWalletAddress);
    addressList.remove(address);

    if (addressList.isEmpty) {
      await prefs.setString(PreferencesKeys.activeWalletAddress, null);
    } else {
      if (activeAddress == address) {
        await prefs.setString(
            PreferencesKeys.activeWalletAddress, addressList.first);
      }
    }
    await prefs.setStringList(PreferencesKeys.addressList, addressList);
    await prefs.setString(address, null);
    if (addressList.isNotEmpty) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(InitWalletPage.routeName, (_) => false);
    }
  }

  _backup(ImportType type) {
    return () async {
      String password = await InputPassswordDialog.show(context, _accountInfo);
      if (password.isNotEmpty) {
        Navigator.of(context).pushNamed(
          BackupAccountPage.routeName,
          arguments: BackupAccountPageArguement(
            password: password,
            account: _accountInfo,
            type: type,
          ),
        );
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).accountManagerTitle),
        centerTitle: true,
      ),
      body: _accountInfo != null ? mainView() : Container(),
    );
  }

  Widget mainView() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  addressBox(),
                  SizedBox(height: 5),
                  if (_accountInfo.mnemonicKeystore.isNotEmpty)
                    actionLine(
                      AppLocalizations.of(context).accountManagerActionLine1,
                      onTap: _backup(ImportType.mnemonic),
                    ),
                  actionLine(
                    AppLocalizations.of(context).accountManagerActionLine2,
                    onTap: _backup(ImportType.keystore),
                  ),
                  actionLine(
                    AppLocalizations.of(context).accountManagerActionLine3,
                    onTap: _backup(ImportType.privateKey),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: SizedBox(
              width: double.infinity,
              child: mySecondaryButton(
                AppLocalizations.of(context).accountManagerDelete,
                onPressed: _deleteAddress,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addressBox() {
    var address = addAddressPrefix(_accountInfo.address);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context).accountManagerAddress,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(address),
              ],
            ),
          ),
          IconButton(
            padding: const EdgeInsets.all(0),
            iconSize: 16,
            color: Colors.black87,
            onPressed: () async {
              await Clipboard.setData(
                ClipboardData(text: address),
              );
              _scaffoldKey.currentState.hideCurrentSnackBar();
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content:
                      Text(AppLocalizations.of(context).accountManagerSnackBar),
                  duration: Duration(milliseconds: 500),
                ),
              );
            },
            icon: Icon(Icons.content_copy),
          ),
        ],
      ),
    );
  }

  Widget actionLine(String text, {onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 5,
        ),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(text),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.black45,
            )
          ],
        ),
      ),
    );
  }
}
