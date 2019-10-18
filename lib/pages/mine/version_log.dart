import 'package:flutter/material.dart';

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
        title: Text('版本日志'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildLogRow(
              '1.0.0 版本（2019.10.18）',
              [
                '支持创建钱包和导入钱包',
                '支持备份钱包',
                '支持RUFF转账',
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
