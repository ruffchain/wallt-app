import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ruff_wallet/common/config.dart' as Config;

class ChainApi {
  static Future callRpc(String funName, args) async {
    var body = jsonEncode({"funName": funName, "args": args});
    var res = await http.post(
      Config.ChainRpcUrl,
      body: body,
      headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.toString(),
        HttpHeaders.acceptHeader: ContentType.json.toString(),
      },
    );
    if (res.statusCode < 200 || res.statusCode > 300) {
      throw 'err';
    }
    return res.body;
  }

  static Future<int> getNonce(String address) async {
    var res = await callRpc('getNonce', {'address': address});
    return jsonDecode(res)['nonce'];
  }

  static Future sendTransaction(Map<String, dynamic> signedTx) async {
    return callRpc('sendTransaction', {'tx': signedTx});
  }

  static Future<Map<String, dynamic>> getTransaction(String hash) async {
    String res = await callRpc('getTransactionReceipt', {'tx': hash});
    return jsonDecode(res);
  }

  static Future<bool> checkReceipt(String hash) async {
    await Future.delayed(Duration(seconds: 1));
    for (var i = 0; i < 10; i++) {
      print(i);
      try {
        var res = await getTransaction(hash);
        if (res['receipt']['returnCode'] == 0) {
          return true;
        }
      } catch (e) {
        print(e);
      }
      await Future.delayed(Duration(seconds: 3));
    }
    return false;
  }
}
