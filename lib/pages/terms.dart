import 'package:flutter/material.dart';
import 'package:ruff_wallet/common/config.dart' as Config;
import 'package:ruff_wallet/common/constant.dart';
import 'package:ruff_wallet/components/button.dart';
import 'package:ruff_wallet/pages/app_main_container.dart';
import 'package:ruff_wallet/pages/init_wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import '../common/app_localizations.dart';

class TermsPage extends StatefulWidget {
  static const String routeName = 'TermsPage';
  const TermsPage({Key key}) : super(key: key);

  @override
  _TermsPageState createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  bool _loading = true;
  bool _agree = false;
  bool _loadFailed = false;

  @override
  void initState() {
    super.initState();
  }

  _toggleAgree(bool) {
    this.setState(() {
      _agree = bool;
    });
  }

  _agreeTerms() async {
    String routerName;
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool(PreferencesKeys.agreedTerms, true);
    var activeWalletAddress =
        prefs.getString(PreferencesKeys.activeWalletAddress) ?? '';
    if (activeWalletAddress.isEmpty) {
      routerName = InitWalletPage.routeName;
    } else {
      routerName = AppMainContainer.routeName;
    }
    Navigator.of(context).pushReplacementNamed(routerName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _termsContent(),
            _bottomToolbar(),
          ],
        ),
      ),
    );
  }

  Widget _termsContent() {
    return Expanded(
      child: Stack(
        children: <Widget>[
          if (_loadFailed)
            Container(
              padding: EdgeInsets.all(15),
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: myPrimaryButton(
                    AppLocalizations.of(context).termsPrimary,
                    onPressed: () {
                      setState(() {
                        _loadFailed = false;
                        _loading = true;
                      });
                    },
                  ),
                ),
              ),
            )
          else
            InAppWebView(
              // initialUrl: Config.TermsUrl,
              initialUrl: AppLocalizations.of(context).configTermsUrl,
              onLoadError: (InAppWebViewController controller, String url,
                  int code, String message) {
                setState(() {
                  _loadFailed = true;
                  _loading = false;
                });
              },
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                if (progress == 100) {
                  setState(() {
                    _loading = false;
                  });
                }
              },
            ),
          if (_loading)
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: Colors.black26,
                ),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppPrimaryColor),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _bottomToolbar() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Checkbox(
                value: _agree,
                onChanged: _loadFailed || _loading ? null : _toggleAgree,
              ),
              Expanded(
                child: Text(
                  AppLocalizations.of(context).termsAgreeConfirm,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: myPrimaryButton(
              AppLocalizations.of(context).termsAgree,
              onPressed: _agree ? _agreeTerms : null,
            ),
          ),
        ],
      ),
    );
  }
}
