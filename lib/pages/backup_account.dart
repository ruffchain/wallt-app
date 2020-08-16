import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ruff_wallet/common/chain_utils.dart';
import 'package:ruff_wallet/common/constant.dart';
import 'package:ruff_wallet/common/wallet_account.dart';
import 'package:ruff_wallet/components/button.dart';
import 'package:ruff_wallet/pages/import_wallet.dart';
import '../common/app_localizations.dart';

class BackupAccountPageArguement {
  String password;
  WalletAccount account;
  ImportType type;

  BackupAccountPageArguement({
    @required this.password,
    @required this.account,
    @required this.type,
  });
}

class BackupAccountPage extends StatefulWidget {
  static final String routeName = "/BackupAccountPage";

  const BackupAccountPage({Key key}) : super(key: key);

  _BackupAccountPageState createState() => _BackupAccountPageState();
}

class _BackupAccountPageState extends State<BackupAccountPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Future _initFuture;

  String _backupString;
  String _title = "";

  @override
  void initState() {
    super.initState();
    _initFuture = _init();
  }

  Future _init() async {
    await Future.delayed(Duration.zero);
    try {
      BackupAccountPageArguement data =
          ModalRoute.of(context).settings.arguments;
      if (data.type == ImportType.keystore) {
        _title = AppLocalizations.of(context).backupAccountTitleKeystore;
        _backupString = data.account.keystore;
      }
      if (data.type == ImportType.mnemonic) {
        _title = AppLocalizations.of(context).backupAccountTitleMnemonic;
        _backupString = await JsChainLib.mnemonicFromKeystore(
          data.account.mnemonicKeystore,
          data.password,
        );
      }
      if (data.type == ImportType.privateKey) {
        _title = AppLocalizations.of(context).backupAccountTitlePrivatekey;
        _backupString = await JsChainLib.privateKeyFromKeyStore(
          data.account.keystore,
          data.password,
        );
      }
    } catch (e) {
      print(e);
    }
    setState(() {});
  }

  _copyString() async {
    await Clipboard.setData(
      ClipboardData(text: _backupString),
    );
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context).backupAccountSnackbar),
        duration: Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).backupAccountTitle + _title),
      ),
      body: FutureBuilder(
        future: _initFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppPrimaryColor),
              ));
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('error');
              }
              return _mainView();
          }
          return null; // unreachable
        },
      ),
    );
  }

  Widget _mainView() {
    BackupAccountPageArguement data = ModalRoute.of(context).settings.arguments;
    String desc;
    if (data.type == ImportType.privateKey) {
      desc = AppLocalizations.of(context).backupAccountDescPrivatekey;
    }
    if (data.type == ImportType.mnemonic) {
      desc = AppLocalizations.of(context).backupAccountDescMnemonic;
    }
    if (data.type == ImportType.keystore) {
      desc = AppLocalizations.of(context).backupAccountDescKeystore;
    }

    var textContent = SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Text(desc),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            padding: EdgeInsets.all(15),
            color: Colors.white,
            child: Text(_backupString),
          )
        ],
      ),
    );

    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: textContent,
          ),
          _bottomButton(),
        ],
      ),
    );
  }

  Widget _bottomButton() {
    return Container(
      padding: EdgeInsets.all(15),
      child: SizedBox(
        width: double.infinity,
        child: myPrimaryButton(
          AppLocalizations.of(context).backupAccountCopy + _title,
          onPressed: _copyString,
        ),
      ),
    );
  }
}
