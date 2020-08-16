import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:ruff_wallet/common/app_localizations.dart';
import 'package:ruff_wallet/common/constant.dart';
import 'package:ruff_wallet/common/utils.dart';
import 'package:ruff_wallet/pages/mine/mine.dart';
import 'package:ruff_wallet/pages/wallet.dart';
import 'package:http/http.dart' as http;
import 'package:ruff_wallet/common/config.dart' as Config;

enum LayoutType {
  wallet,
  mine,
}

class AppMainContainer extends StatefulWidget {
  static const String routeName = 'AppMainContainer';
  const AppMainContainer({Key key}) : super(key: key);

  @override
  _AppMainContainerState createState() => _AppMainContainerState();
}

class _AppMainContainerState extends State<AppMainContainer> {
  var _layoutSelection = LayoutType.wallet;
  bool _mustUpdate = false;

  @override
  void initState() {
    super.initState();
    _checkAppVersionIsUsable();
  }

  void _checkAppVersionIsUsable() async {
    try {
      var res = await http.get(
        Config.VersionInfoUrl,
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.toString(),
          HttpHeaders.acceptHeader: ContentType.json.toString(),
        },
      );
      var packageInfo = await PackageInfo.fromPlatform();
      Map data = jsonDecode(res.body);
      var minUsable = data['min_usable'];
      if (Version.parse(packageInfo.version) < Version.parse(minUsable)) {
        setState(() {
          _mustUpdate = true;
        });
      }
    } catch (e) {}
  }

  int last = 0;
  Future<bool> _onWillPop() async {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - last < 500) {
      return true;
    } else {
      last = DateTime.now().millisecondsSinceEpoch;
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(children: [
          Offstage(
            offstage: _layoutSelection != LayoutType.wallet,
            child: WalletPage(),
          ),
          Offstage(
            offstage: _layoutSelection != LayoutType.mine,
            child: MinePage(),
          ),
          Offstage(
            offstage: !_mustUpdate,
            child: _outdateDialog(),
          ),
        ]),
        bottomNavigationBar: _buildButtonNavBar(),
      ),
    );
  }

  Widget _buildButtonNavBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          title:
              Text(AppLocalizations.of(context).appMainContainerNavBarWallet),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          title:
              Text(AppLocalizations.of(context).appMainContainerNavBarAccount),
        )
      ],
      currentIndex: _layoutSelection.index,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _layoutSelection = LayoutType.values[index];
        });
      },
    );
  }

  Widget _outdateDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Text(
                AppLocalizations.of(context).appMainContainerOutdateText,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: () {
                launchUrl(Config.AppDownloadPageUrl);
              },
              child: Text(
                AppLocalizations.of(context).appMainContainerOutdateBtn,
                style: TextStyle(
                  color: AppPrimaryColor,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
