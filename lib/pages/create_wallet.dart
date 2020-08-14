import 'package:flutter/material.dart';
import 'package:ruff_wallet/components/button.dart';
import 'package:ruff_wallet/components/text_form_field.dart';
import 'package:ruff_wallet/pages/backup_mnemonic.dart';
import '../common/app_localizations.dart';

class CreateWalletPage extends StatefulWidget {
  static const String routeName = 'CreateWalletPage';
  const CreateWalletPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CreateWalletPageState createState() => _CreateWalletPageState();
}

class _CreateWalletPageState extends State<CreateWalletPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final _passwordController = new TextEditingController();
  final _passwordConfirmController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget infoLine(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Text(text),
    );
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget form = Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: _passwordController,
            labelText: AppLocalizations.of(context).createWalletLabelText,
            helperText: AppLocalizations.of(context).createWalletHelperText,
            obscureText: false,
            maxLines: 1,
            validator: (value) {
              if (value.isEmpty)
                return AppLocalizations.of(context)
                    .createWalletInValidatorEmpty;
              if (value.length < 8)
                return AppLocalizations.of(context)
                    .createWalletInValidatorLength;
              return null;
            },
          ),
          const SizedBox(height: 24.0),
          CustomTextField(
            controller: _passwordConfirmController,
            labelText:
                AppLocalizations.of(context).createWalletConfirmLabelText,
            helperText:
                AppLocalizations.of(context).createWalletConfirmHelperText,
            obscureText: true,
            validator: (value) {
              if (_passwordConfirmController.text != _passwordController.text)
                return AppLocalizations.of(context)
                    .createWalletConfirmValidator;
              return null;
            },
          ),
        ],
      ),
    );

    Widget submitButton = SizedBox(
      width: double.infinity,
      child: myPrimaryButton(
        AppLocalizations.of(context).createWalletSubmit,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Navigator.of(context).pushNamed(BackupMnemonicPage.routeName,
                arguments: _passwordController.text);
          }
        },
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.account_balance_wallet),
            Container(width: 5),
            Text(AppLocalizations.of(context).createWalletTitle)
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          infoLine(AppLocalizations.of(context)
                              .createWalletInfoLine1),
                          infoLine(AppLocalizations.of(context)
                              .createWalletInfoLine2),
                          Container(height: 30),
                          form,
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: submitButton,
            ),
          ],
        ),
      ),
    );
  }
}
