import 'dart:convert';
import 'package:ruff_wallet/common/chain_utils.dart';
import 'package:ruff_wallet/common/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalletAccount {
  String mnemonicKeystore;
  String keystore;
  String address;

  WalletAccount({
    this.address,
    this.mnemonicKeystore,
    this.keystore,
  });

  WalletAccount.fromJson(Map<String, dynamic> json)
      : this(
          address: json['address'],
          mnemonicKeystore: json['mnemonicKeystore'],
          keystore: json['keystore'],
        );

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'mnemonicKeystore': mnemonicKeystore,
      'keystore': keystore,
    };
  }

  Future<bool> saveAndActive() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString(address) == null) {
      await prefs.setString(address, jsonEncode(toJson()));

      var addressList = prefs.getStringList(PreferencesKeys.addressList) ?? [];
      addressList.add(address);
      await prefs.setStringList(PreferencesKeys.addressList, addressList);
      await prefs.setString(PreferencesKeys.activeWalletAddress, address);
      return true;
    } else {
      return false;
    }
  }

  static Future<WalletAccount> fromMnemonic(
      String mnemonic, String password) async {
    var mnemonicKeystore =
        await JsChainLib.mnemonicToKeystore(mnemonic, password);

    var privateKey = privateKeyFromMnemonic(mnemonic);
    var address = await JsChainLib.addressFromPrivateKey(privateKey);
    var keystore =
        await JsChainLib.privateKeyToKeyStore(privateKey, address, password);

    return WalletAccount(
      address: address,
      keystore: keystore,
      mnemonicKeystore: mnemonicKeystore,
    );
  }

  static Future<WalletAccount> fromPrivateKey(
      String privateKey, String password) async {
    var address = await JsChainLib.addressFromPrivateKey(privateKey);
    var keystore =
        await JsChainLib.privateKeyToKeyStore(privateKey, address, password);

    return WalletAccount(
      address: address,
      keystore: keystore,
      mnemonicKeystore: '',
    );
  }

  static Future<WalletAccount> fromKeystore(
      String keystore, String password) async {
    var privateKey =
        await JsChainLib.privateKeyFromKeyStore(keystore, password);
    var address = await JsChainLib.addressFromPrivateKey(privateKey);
    return WalletAccount(
      address: address,
      keystore: keystore,
      mnemonicKeystore: '',
    );
  }
}
