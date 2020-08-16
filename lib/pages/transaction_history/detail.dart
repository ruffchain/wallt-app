import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ruff_wallet/common/utils.dart';
import '../../common/app_localizations.dart';

class TransactionDetailPage extends StatefulWidget {
  static const routeName = 'TransactionDetailPage';
  const TransactionDetailPage({Key key}) : super(key: key);

  _TransactionDetailPageState createState() => _TransactionDetailPageState();
}

class _TransactionDetailPageState extends State<TransactionDetailPage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Map tx = ModalRoute.of(context).settings.arguments;
    Map txContent = tx['content'];
    var method = txContent['method'];

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).txHistoryDetailTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: method == 'transferTo' ? _transferView(tx) : _rawJsonView(tx),
        ),
      ),
    );
  }

  Widget _transferView(Map tx) {
    Map txContent = tx['content'];
    var ms = tx['timestamp'] * 1000;
    var time = DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true);
    var timeStr = formatDate(
      time.toLocal(),
      [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss, z],
    );
    return Column(
      children: <Widget>[
        _transferViewRow(
            AppLocalizations.of(context).txHistoryDetailTime, timeStr),
        _transferViewRow(AppLocalizations.of(context).txHistoryDetailMethod,
            txContent['method']),
        _transferViewRow(AppLocalizations.of(context).txHistoryDetailAmount,
            txContent['value'] + ' RUFF'),
        _transferViewRow(AppLocalizations.of(context).txHistoryDetailCaller,
            addAddressPrefix(txContent['caller'])),
        _transferViewRow(AppLocalizations.of(context).txHistoryDetailReceiver,
            addAddressPrefix(txContent['input']['to'])),
        _transferViewRow(AppLocalizations.of(context).txHistoryDetailGasFee,
            txContent['fee'] + ' RUFF'),
        _transferViewRow(
          AppLocalizations.of(context).txHistoryDetailHash,
          tx['hash'],
          copy: true,
        ),
        _transferViewRow(AppLocalizations.of(context).txHistoryDetailBlock,
            tx['blocknumber'].toString()),
      ],
    );
  }

  Widget _transferViewRow(String name, String value, {bool copy = false}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0x20000000),
              width: 0,
            ),
          ),
          color: Colors.white),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(name),
                Text(value),
              ],
            ),
          ),
          if (copy)
            IconButton(
              padding: const EdgeInsets.all(0),
              iconSize: 16,
              color: Colors.black87,
              icon: Icon(Icons.content_copy),
              onPressed: () async {
                await Clipboard.setData(
                  ClipboardData(text: value),
                );
                _scaffoldKey.currentState.hideCurrentSnackBar();
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: Text(
                        AppLocalizations.of(context).txHistoryDetailCopyOK),
                    duration: Duration(milliseconds: 500),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _rawJsonView(Map tx) {
    var encoder = new JsonEncoder.withIndent("    ");
    String prettyprint = encoder.convert(tx);

    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Text(
        prettyprint,
        style: TextStyle(
          color: Colors.black87,
        ),
      ),
    );
  }
}
