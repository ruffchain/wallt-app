import 'package:bip39/bip39.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ruff_wallet/common/app_localizations.dart';
import 'package:ruff_wallet/common/chain_utils.dart';
import 'package:ruff_wallet/common/wallet_account.dart';
import 'package:ruff_wallet/components/button.dart';
import 'package:ruff_wallet/components/loading.dart';
import 'package:ruff_wallet/components/text_form_field.dart';
import 'package:ruff_wallet/pages/app_main_container.dart';

enum ImportType {
  mnemonic,
  keystore,
  privateKey,
}

class ImportWalletPage extends StatefulWidget {
  static const String routeName = 'ImportWalletPage';
  const ImportWalletPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ImportWalletPageState createState() => _ImportWalletPageState();
}

class _ImportWalletPageState extends State<ImportWalletPage>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  final _importStringController = new TextEditingController();
  String _importStringAsyncValidMsg = '';
  final _passwordController = new TextEditingController();
  String _passwordAsyncValidMsg = '';
  final _passwordConfirmController = new TextEditingController();

  ImportType _importType = ImportType.mnemonic;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      vsync: this,
      length: 3,
      initialIndex: _importType.index,
    );
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  void _changeImportType(index) {
    setState(() {
      _importType = ImportType.values[index];
    });

    _importStringController.clear();
    _passwordController.clear();
    _passwordConfirmController.clear();
    _formKey.currentState.reset();
  }

  String _validImportString(value) {
    if (_importType == ImportType.mnemonic) {
      if (value.isEmpty)
        return AppLocalizations.of(context).importWalletMnemonic;
    }
    if (_importType == ImportType.keystore) {
      if (value.isEmpty)
        return AppLocalizations.of(context).importWalletKeystore;
    }
    if (_importType == ImportType.privateKey) {
      if (value.isEmpty)
        return AppLocalizations.of(context).importWalletPrivatekey;
    }
    if (_importStringAsyncValidMsg.isNotEmpty) {
      return _importStringAsyncValidMsg;
    }
    return null;
  }

  String _validPassword(value) {
    if (value.isEmpty) return AppLocalizations.of(context).importWalletValidPwd;
    if (value.length < 8)
      return AppLocalizations.of(context).importWalletValidPwdLength;
    if (_passwordAsyncValidMsg.isNotEmpty) {
      return _passwordAsyncValidMsg;
    }
    return null;
  }

  String _validPasswordConfirm(value) {
    if (value.isEmpty) return AppLocalizations.of(context).importWalletValidPwd;
    if (_passwordConfirmController.text != _passwordController.text)
      return AppLocalizations.of(context).importWalletValidPwdEqual;
    return null;
  }

  void _startImportWallet() async {
    _importStringAsyncValidMsg = _passwordAsyncValidMsg = '';

    var importString = _importStringController.text.trim();
    var password = _passwordController.text;

    Loading.show(context);

    if (_importType == ImportType.mnemonic) {
      if (!validateMnemonic(importString)) {
        _importStringAsyncValidMsg =
            AppLocalizations.of(context).importWalletImportMnemonic;
      }
    } else if (_importType == ImportType.keystore) {
      try {
        await JsChainLib.privateKeyFromKeyStore(importString, password);
      } catch (e) {
        _importStringAsyncValidMsg =
            AppLocalizations.of(context).importWalletImportKeystore;
        _passwordAsyncValidMsg =
            AppLocalizations.of(context).importWalletImportKeystore;
      }
    } else if (_importType == ImportType.privateKey) {
      try {
        await JsChainLib.addressFromPrivateKey(importString);
      } catch (e) {
        _importStringAsyncValidMsg =
            AppLocalizations.of(context).importWalletImportPrivatekey;
      }
    }

    if (_formKey.currentState.validate()) {
      try {
        WalletAccount account;
        if (_importType == ImportType.mnemonic) {
          account = await WalletAccount.fromMnemonic(importString, password);
        } else if (_importType == ImportType.keystore) {
          account = await WalletAccount.fromKeystore(importString, password);
        } else if (_importType == ImportType.privateKey) {
          account = await WalletAccount.fromPrivateKey(importString, password);
        }
        var success = await account.saveAndActive();
        if (success) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppMainContainer.routeName, (_) => false);
        } else {
          showInSnackBar(AppLocalizations.of(context).importWalletValidate);
          Loading.hide(context);
        }
      } catch (e) {
        showInSnackBar(
            AppLocalizations.of(context).importWalletValidateErr + '$e');
        Loading.hide(context);
      }
    } else {
      Loading.hide(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).importWalletTitle),
        centerTitle: true,
        bottom: TabBar(
          onTap: _changeImportType,
          indicatorColor: Colors.white54,
          tabs: [
            Tab(text: AppLocalizations.of(context).importWalletTabMnemonic),
            Tab(text: AppLocalizations.of(context).importWalletTabKeystore),
            Tab(text: AppLocalizations.of(context).importWalletTabPrivatekey),
          ],
          controller: _tabController,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                    child: _buildForm(),
                  ),
                ),
              ),
              SafeArea(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: SizedBox(
                    width: double.infinity,
                    child: myPrimaryButton(
                      AppLocalizations.of(context).importWalletButton,
                      onPressed: _startImportWallet,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildForm() {
    var _importStringLabelText =
        AppLocalizations.of(context).importWalletFormLabel;
    var _importStringHelperText =
        AppLocalizations.of(context).importWalletFormHelper;
    var _passwordLabelText =
        AppLocalizations.of(context).importWalletFormPasswordLabel;
    var _passwordHelpText =
        AppLocalizations.of(context).importWalletFormPasswordHelper;

    if (_importType == ImportType.keystore) {
      _importStringLabelText =
          AppLocalizations.of(context).importWalletFormKeystoreLabel;
      _importStringHelperText =
          AppLocalizations.of(context).importWalletFormKeystoreHelper;

      _passwordLabelText =
          AppLocalizations.of(context).importWalletFormKeystorePasswordLabel;
      _passwordHelpText =
          AppLocalizations.of(context).importWalletFormKeystorePasswordHelper;
    }

    if (_importType == ImportType.privateKey) {
      _importStringLabelText =
          AppLocalizations.of(context).importWalletFormPrivatekeyLabel;
      _importStringHelperText =
          AppLocalizations.of(context).importWalletFormPrivatekeyHelper;
    }
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: _importStringController,
            labelText: _importStringLabelText,
            helperText: _importStringHelperText,
            validator: _validImportString,
            minLines: 2,
            maxLines: 2,
          ),
          const SizedBox(height: 24.0),
          CustomTextField(
            controller: _passwordController,
            labelText: _passwordLabelText,
            helperText: _passwordHelpText,
            validator: _validPassword,
            obscureText: true,
          ),
          const SizedBox(height: 24.0),
          if (_importType != ImportType.keystore)
            CustomTextField(
              controller: _passwordConfirmController,
              labelText: AppLocalizations.of(context).importWalletConfirmText,
              helperText:
                  AppLocalizations.of(context).importWalletConfirmHelper,
              validator: _validPasswordConfirm,
              obscureText: true,
            ),
          const SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
