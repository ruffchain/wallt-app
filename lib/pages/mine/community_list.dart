import 'package:flutter/material.dart';
import 'package:ruff_wallet/common/utils.dart';
import 'package:ruff_wallet/components/action_row.dart';
import '../../common/app_localizations.dart';

class CommunityListPage extends StatefulWidget {
  static const String routeName = 'CommunityListPage';
  const CommunityListPage({Key key}) : super(key: key);

  _CommunityListPageState createState() => _CommunityListPageState();
}

class _CommunityListPageState extends State<CommunityListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).mineCommunityListTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _sectionNameRow('Website'),
              _linkRow('https://ruffchain.com'),
              _linkRow('https://ruff.io'),
              _sectionNameRow('Twitter'),
              _linkRow('https://twitter.com/Ruff_Chain'),
              _sectionNameRow('Facebook'),
              _linkRow('https://www.facebook.com/RuffChainProject'),
              _sectionNameRow('Telegram'),
              _linkRow('https://t.me/ruffchain'),
              _linkRow('https://t.me/ruffchainchinese'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionNameRow(String name) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 30,
        left: 15,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0x20000000),
            width: 0,
          ),
        ),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black45,
        ),
      ),
    );
  }

  Widget _linkRow(String url) {
    return actionRow(
      url,
      onTap: () {
        launchUrl(url);
      },
    );
  }
}
