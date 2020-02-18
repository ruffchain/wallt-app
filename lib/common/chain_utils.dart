import 'dart:async';
import 'dart:io';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/services.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart';
import 'package:hex/hex.dart';
import 'dart:convert';

import 'package:ruff_wallet/common/chain_api.dart';

class JsResponse {
  final dynamic error;
  final dynamic data;

  JsResponse(this.error, this.data);

  factory JsResponse.fromJson(Map<String, dynamic> json) {
    dynamic error = json['error'];
    dynamic data = json['data'];
    if (!(error is String)) {
      error = jsonEncode(error);
    }
    if (!(data is String)) {
      data = jsonEncode(data);
    }
    return JsResponse(error, data);
  }
}

class JsChainLib {
  static final _webView = FlutterWebviewPlugin();

  static final String _jsPrefix = 'window.ruffChain';

  static Future _initedFuture;

  static Future init() async {
    if (_initedFuture == null) {
      _initedFuture = _init();
    }
    await _initedFuture;
  }

  static Future _init() async {
    try {
      var evalJavascript = new Completer();
      _webView.onStateChanged.listen((viewState) async {
        if (viewState.type == WebViewState.finishLoad) {
          final jsLibCode =
              await rootBundle.loadString('assets/js-lib/ruff-chain.min.js');
          await _webView.evalJavascript(jsLibCode);
          evalJavascript.complete();
        }
      });

      await _webView.launch('about:blank', withJavascript: true, hidden: true);
      await evalJavascript.future;
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<dynamic> _runJs(String jsCode) async {
    await init();
    String code = '''
      (function() {
        var res = {
          error: "",
          data: null
        };
        try {
          res.data =$jsCode;
        } catch (e) {
          res.error = e ? e.toString() : "error";
        }
        return JSON.stringify(res);
      })();
    ''';
    var ret = await _webView.evalJavascript(code);
    if (Platform.isAndroid) ret = jsonDecode(ret);
    final jsResponse = new JsResponse.fromJson(jsonDecode(ret));
    var error = jsResponse.error;
    if (error.isNotEmpty) {
      throw error;
    } else {
      return jsResponse.data;
    }
  }

  static Future<String> privateKeyToKeyStore(
      String privateKey, String address, String password) async {
    String code =
        "$_jsPrefix.toV3Keystore('$privateKey','$address','$password')";
    final res = await _runJs(code);
    return res;
  }

  static Future<String> privateKeyFromKeyStore(
      String keyStore, String password) async {
    String code = "$_jsPrefix.fromV3Keystore('$keyStore','$password')";
    final res = await _runJs(code);
    return res;
  }

  static Future<String> addressFromPrivateKey(String privateKey) async {
    String code = "$_jsPrefix.addressFromSecretKey('$privateKey')";
    String address = await _runJs(code);
    if (address.isEmpty || address.length != 34) {
      throw ('not valid privateKey');
    }
    return address;
  }

  static Future<Map<String, dynamic>> signTransferTx(
      String txData, String privateKey) async {
    String code = "$_jsPrefix.signTransferTx('$txData','$privateKey')";
    final res = await _runJs(code);
    return jsonDecode(res);
  }

  static Future<String> mnemonicToKeystore(String mnemonic, String password) {
    var hexStr = ascii
        .encode(mnemonic)
        .fold('', (prev, codeUnit) => prev + codeUnit.toRadixString(16));
    return privateKeyToKeyStore(hexStr, 'mnemonic', password);
  }

  static Future<bool> isValidAddress(String address) async {
    bool valid = false;
    try {
      String code = "$_jsPrefix.isValidAddress('$address')";
      final res = await _runJs(code);
      valid = res == 'true';
    } catch (e) {
      valid = false;
    }
    return valid;
  }

  static Future<String> mnemonicFromKeystore(
      String mnemonicKeyStore, String password) async {
    String hexStr = await privateKeyFromKeyStore(mnemonicKeyStore, password);

    var codeUnits = List<int>();
    var b = hexStr.split('');
    var temp = '';
    for (var item in b) {
      temp += item;
      if (temp.length == 2) {
        codeUnits.add(int.tryParse('0x' + temp));
        temp = '';
      }
    }

    var mnemonic = ascii.decode(codeUnits);
    return mnemonic;
  }

  static void testLib() async {
    final testCode = await rootBundle.loadString('assets/js-lib/test-code.js');
    final ret = await _runJs(testCode);
    print(ret);

    const testPrivateKey =
        '5fc7e2d2dd5f9e414a71558b7ef9c1901d99b3340652723b60bf119c5e1df1b3';
    const testAddress = '1BZRVgz7zpcm1rJZh5H3uCtggQbfyo8jwr';

    print(testPrivateKey);
    print(testAddress);

    final address = await addressFromPrivateKey(testPrivateKey);
    print(address); //testAddress
    assert(address == testAddress, "addressFromPrivateKey error");

    const password = 'dasdad';
    final keystore =
        await privateKeyToKeyStore(testPrivateKey, testAddress, password);
    print(keystore);

    var pk = await privateKeyFromKeyStore(keystore, password);
    print(pk);

    assert(pk == testPrivateKey,
        "privateKeyToKeyStore & privateKeyFromKeyStore error");

    // test mnemonicToKeystore & mnemonicFromKeystore
    var mnemonic = generateMnemonic();
    var keystore2 = await mnemonicToKeystore(mnemonic, '12132');
    var mnemonic2 = await mnemonicFromKeystore(keystore2, '12132');
    assert(mnemonic == mnemonic2,
        "mnemonicToKeystore & mnemonicFromKeystore error");
    // test mnemonicToKeystore & mnemonicFromKeystore end
  }
}

String generateMnemonic() {
  return bip39.generateMnemonic();
}

String privateKeyFromMnemonic(String mnemonic) {
  final seed = bip39.mnemonicToSeed(mnemonic);
  final nodeFromSeed = BIP32.fromSeed(seed);
  final privateKey = nodeFromSeed.privateKey;
  return HEX.encode(privateKey);
}

Future<Map<String, dynamic>> transferToken({
  String from,
  String to,
  String count,
  String fee,
  String privateKey,
}) async {
  var tx = {
    'method': 'transferTo',
    'fee': fee,
    'value': count,
    'input': {
      'to': to,
    },
  };
  var nonce = await ChainApi.getNonce(from);
  tx['nonce'] = nonce + 1;
  var signTxRes = await JsChainLib.signTransferTx(jsonEncode(tx), privateKey);
  String hash = signTxRes['hash'];
  await ChainApi.sendTransaction(signTxRes['data']);
  var confirmed = await ChainApi.checkReceipt(hash);
  return {
    'hash': hash,
    'confirmed': confirmed,
  };
}
