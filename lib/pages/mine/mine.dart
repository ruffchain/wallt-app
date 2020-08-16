import 'package:flutter/material.dart';
import 'package:ruff_wallet/common/utils.dart';
import 'package:ruff_wallet/components/action_row.dart';
import 'package:ruff_wallet/pages/mine/about_us.dart';
import 'package:ruff_wallet/pages/mine/community_list.dart';
import '../../common/app_localizations.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _topView(),
            _listView(),
          ],
        ),
      ),
    );
  }

  Widget _listView() {
    return Container(
      child: Column(
        children: <Widget>[
          actionRow(
            AppLocalizations.of(context).mineHelpCenter,
            onTap: () async {
              const url =
                  'https://github.com/ruffchain/Guide/wiki/RuffChain%E9%92%B1%E5%8C%85APP%E5%B8%AE%E5%8A%A9%E4%B8%AD%E5%BF%83';
              launchUrl(url);
            },
          ),
          actionRow(
            AppLocalizations.of(context).mineJoin,
            onTap: () async {
              Navigator.of(context).pushNamed(CommunityListPage.routeName);
            },
          ),
          actionRow(
            AppLocalizations.of(context).mineAboutUs,
            onTap: () async {
              Navigator.of(context).pushNamed(AboutUsPage.routeName);
            },
          ),
        ],
      ),
    );
  }

  Widget _topView() {
    return Container(
      height: 260,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xff77C4A1),
            Color(0xff72CBEB),
          ],
        ),
      ),
      child: Container(
        alignment: Alignment(0, 0.5),
        child: SizedBox(
          height: 220,
          child: Image.asset('assets/images/splash_logo.png'),
        ),
      ),
    );
  }
}
