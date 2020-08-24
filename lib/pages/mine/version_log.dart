import 'package:flutter/material.dart';
import '../../common/app_localizations.dart';

class VersionLogPage extends StatefulWidget {
  static const String routeName = 'VersionLogPage';
  const VersionLogPage({Key key}) : super(key: key);

  _VersionLogPageState createState() => _VersionLogPageState();
}

class _VersionLogPageState extends State<VersionLogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).mineVersionLogTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildLogRow(
              '1.2.3 ' +
                  AppLocalizations.of(context).mineVersionVer +
                  '（2020.08.23）',
              [
                AppLocalizations.of(context).mineVersion123,
              ],
            ),
            _buildLogRow(
              '1.2.2 ' +
                  AppLocalizations.of(context).mineVersionVer +
                  '（2020.08.20）',
              [
                AppLocalizations.of(context).mineVersion122,
              ],
            ),
            _buildLogRow(
              '1.2.1 ' +
                  AppLocalizations.of(context).mineVersionVer +
                  '（2020.07.28）',
              [
                AppLocalizations.of(context).mineVersion121,
              ],
            ),
            _buildLogRow(
              '1.2.0 ' +
                  AppLocalizations.of(context).mineVersionVer +
                  '（2020.02.18）',
              [
                AppLocalizations.of(context).mineVersion120,
              ],
            ),
            _buildLogRow(
              '1.1.0 ' +
                  AppLocalizations.of(context).mineVersionVer +
                  '（2020.02.13）',
              [
                AppLocalizations.of(context).mineVersion110,
              ],
            ),
            _buildLogRow(
              '1.0.0 ' +
                  AppLocalizations.of(context).mineVersionVer +
                  '（2019.10.18）',
              [
                AppLocalizations.of(context).mineVersion1001,
                AppLocalizations.of(context).mineVersion1002,
                AppLocalizations.of(context).mineVersion1003,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogRow(String title, List<String> logs) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0x20000000),
            width: 0,
          ),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          for (var i = 0; i < logs.length; i++)
            Text('${i + 1}. ${logs.elementAt(i)}'),
        ],
      ),
    );
  }
}
