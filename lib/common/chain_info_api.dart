import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ruff_wallet/common/config.dart' as Config;
import 'package:ruff_wallet/pages/transaction_history/index.dart';

class ChainInfoApi {
  static Future callRpc(String funName, args) async {
    var res = await http.post(
      Config.ChainInfoRpcUrl,
      body: jsonEncode(
        {
          "funName": funName,
          "args": args,
        },
      ),
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

  static Future getTokensByAddress(String address) {
    return callRpc('getTokensByAddress', address);
  }

  static Future<Map> getTxsByAddress({
    TransactionType type,
    String address,
    int page,
    int pageSize,
  }) async {
    String funName;
    if (type == TransactionType.all) {
      funName = 'getTxsByAddress';
    } else if (type == TransactionType.receiveToken) {
      funName = 'getTxsTransferTo';
    } else if (type == TransactionType.transfer) {
      funName = 'getTxsTransferFrom';
    }
    var res = await callRpc(
      funName,
      {
        "address": address,
        "page": page,
        "pageSize": pageSize,
      },
    );
    return jsonDecode(res);
  }
}
