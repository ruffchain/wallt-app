import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ruff_wallet/common/constant.dart';
import 'package:ruff_wallet/pages/app_main_container.dart';
import 'package:ruff_wallet/pages/init_wallet.dart';
import 'package:ruff_wallet/pages/terms.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = 'SplashPage';

  const SplashPage({Key key}) : super(key: key);
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<SplashPage> {
  Timer _t;

  @override
  void initState() {
    super.initState();
    _t = new Timer(const Duration(milliseconds: 2500), () async {
      try {
        String routerName;
        var prefs = await SharedPreferences.getInstance();
        var activeWalletAddress =
            prefs.getString(PreferencesKeys.activeWalletAddress) ?? '';
        if (activeWalletAddress.isEmpty) {
          var agreedTerms = prefs.getBool(PreferencesKeys.agreedTerms) ?? false;
          if (agreedTerms) {
            routerName = InitWalletPage.routeName;
          } else {
            routerName = TermsPage.routeName;
          }
        } else {
          routerName = AppMainContainer.routeName;
        }
        Navigator.of(context).pushReplacementNamed(routerName);
      } catch (e) {}
    });
  }

  @override
  void dispose() {
    _t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: new Color.fromARGB(255, 0, 215, 198),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff78C4A1), Color(0xff81CFEC)],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment(0, 1),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(
                    'assets/images/splash_logo.png',
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment(0, 1),
                child: Image.asset(
                  'assets/images/splash_bottom.png',
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
