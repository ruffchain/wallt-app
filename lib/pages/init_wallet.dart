import 'package:flutter/material.dart';
import 'package:ruff_wallet/components/button.dart';
import 'package:ruff_wallet/pages/create_wallet.dart';
import 'package:ruff_wallet/pages/import_wallet.dart';

class InitWalletPage extends StatefulWidget {
  static const String routeName = 'InitWalletPage';

  const InitWalletPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InitWalletPageState createState() => _InitWalletPageState();
}

class _InitWalletPageState extends State<InitWalletPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff0A3244),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment(0, 1),
              width: double.infinity,
              child: Image.asset(
                'assets/images/init_wallet_top.png',
                width: double.infinity,
              ),
            )),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myPrimaryButton(
                    '创建钱包',
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(CreateWalletPage.routeName);
                    },
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                  ),
                  Container(height: 40),
                  mySecondaryButton(
                    '导入钱包',
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(ImportWalletPage.routeName);
                    },
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
