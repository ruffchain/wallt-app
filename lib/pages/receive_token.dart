import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ruff_wallet/common/utils.dart';
import '../common/app_localizations.dart';

class ReceiveTokenPage extends StatefulWidget {
  static String routeName = 'ReceiveTokenPage';

  const ReceiveTokenPage({Key key}) : super(key: key);

  _ReceiveTokenPageState createState() => _ReceiveTokenPageState();
}

class _ReceiveTokenPageState extends State<ReceiveTokenPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    String address = ModalRoute.of(context).settings.arguments;
    address = addAddressPrefix(address);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).receiveTokenTitle),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).receiveTokenQRCode,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 260,
              height: 260,
              child: QrImage(
                data: address,
                gapless: false,
                foregroundColor: const Color(0xFF111111),
                onError: (dynamic ex) {
                  print('[QR] ERROR - $ex');
                },
              ),
            ),
            SizedBox(height: 10),
            Text(address),
            SizedBox(height: 5),
            GestureDetector(
              onTap: () async {
                await Clipboard.setData(
                  ClipboardData(text: address),
                );
                _scaffoldKey.currentState.hideCurrentSnackBar();
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content:
                        Text(AppLocalizations.of(context).receiveTokenSnackBar),
                    duration: Duration(milliseconds: 1000),
                  ),
                );
              },
              child: Icon(Icons.content_copy),
            ),
          ],
        ),
      ),
    );
  }
}
