import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ruff_wallet/common/chain_utils.dart';
import 'package:ruff_wallet/common/constant.dart';
import 'package:ruff_wallet/common/wallet_account.dart';
import 'package:ruff_wallet/components/button.dart';
import 'package:ruff_wallet/pages/import_wallet.dart';

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
        _title = "keystore";
        _backupString = data.account.keystore;
      }
      if (data.type == ImportType.mnemonic) {
        _title = "助记词";
        _backupString = await JsChainLib.mnemonicFromKeystore(
          data.account.mnemonicKeystore,
          data.password,
        );
      }
      if (data.type == ImportType.privateKey) {
        _title = "私钥";
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
        content: Text('复制成功'),
        duration: Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("备份" + _title),
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
      desc = '获得私钥等于拥有钱包资产所有权，请复制并妥善保存在安全的地方，以下是钱包的私钥。';
    }
    if (data.type == ImportType.mnemonic) {
      desc =
          '助记词即是私钥，由12~24个单词组成,你可以通过助记词恢复你的资产,为了你的资产安全，请务必将在抄写并存放至安全位置,助记词一旦丢失，不可找回。';
    }
    if (data.type == ImportType.keystore) {
      desc = 'Keystore文件是加密后的私钥，请复制并妥善保存在安全的地方，一旦丢失，无法找回。以下是钱包的Keystore文件。';
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
          '复制' + _title,
          onPressed: _copyString,
        ),
      ),
    );
  }
}
