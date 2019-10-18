import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:ruff_wallet/common/utils.dart';
import 'package:ruff_wallet/components/action_row.dart';
import 'package:ruff_wallet/components/confirm_dialog.dart';
import 'package:ruff_wallet/components/loading.dart';
import 'package:ruff_wallet/pages/mine/version_log.dart';
import 'package:http/http.dart' as http;
import 'package:ruff_wallet/common/config.dart' as Config;

class AboutUsPage extends StatefulWidget {
  static const String routeName = 'AboutUsPage';
  const AboutUsPage({Key key}) : super(key: key);

  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  String _version = '';

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        _version = packageInfo.version;
      });
    });
  }

  _checkUpdate() async {
    Loading.show(context);
    var res;
    try {
      res = await http.get(
        Config.VersionInfoUrl,
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.toString(),
          HttpHeaders.acceptHeader: ContentType.json.toString(),
        },
      );
    } catch (e) {} finally {
      Loading.hide(context);
    }
    if (res.statusCode < 200 || res.statusCode > 300) {
      throw 'err';
    }
    Map data = jsonDecode(res.body);
    String latestVersion = data['latest'];
    if (_version != latestVersion) {
      showModal(
        context: context,
        title: '检测到新版本',
        content: '当前版本 $_version ,最新版本 $latestVersion ,去更新？',
        confirm: (bool confirmed) {
          if (confirmed) {
            launchUrl(Config.AppDownloadPageUrl);
          }
        },
      );
    } else {
      showModal(
        context: context,
        showCancel: false,
        title: '当前已经是最新版本',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于我们'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    actionRow('版本日志', onTap: () {
                      Navigator.of(context).pushNamed(VersionLogPage.routeName);
                    }),
                    if (Platform.isAndroid)
                      actionRow(
                        '版本更新',
                        onTap: _checkUpdate,
                      ),
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              child: Center(
                child: Text(
                  '当前版本：' + _version,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
