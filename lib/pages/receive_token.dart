import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

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

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('收款'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '扫描二维码向我转账',
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
                    content: Text('复制地址成功'),
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
