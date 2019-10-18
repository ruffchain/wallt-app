import 'package:flutter/material.dart';
import 'package:ruff_wallet/components/button.dart';
import 'package:ruff_wallet/components/text_form_field.dart';
import 'package:ruff_wallet/pages/backup_mnemonic.dart';

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
            labelText: '密码',
            helperText: '不少于8位字符，建议混合大小写字母，数字，符号',
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) return '密码不能为空';
              if (value.length < 8) return '不少于8位字符，建议混合大小写字母，数字，符号';
              return null;
            },
          ),
          const SizedBox(height: 24.0),
          CustomTextField(
            controller: _passwordConfirmController,
            labelText: '确认密码',
            helperText: '再次输入密码以确认',
            obscureText: true,
            validator: (value) {
              if (_passwordConfirmController.text != _passwordController.text)
                return '密码不一致';
              return null;
            },
          ),
        ],
      ),
    );

    Widget submitButton = SizedBox(
      width: double.infinity,
      child: myPrimaryButton(
        '创建',
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
            Text('创建钱包')
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
                          infoLine('• 密码用于加密保护私钥、转账等，请设置高强度密码。'),
                          infoLine('• RUFF不存储密码，也无法帮您找回密码，请务必牢记。'),
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
