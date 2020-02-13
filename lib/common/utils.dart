import 'package:ruff_wallet/common/chain_utils.dart';
import 'package:ruff_wallet/common/constant.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

String shortHash(String hash) {
  return hash.substring(0, 12) +
      '...' +
      hash.substring(hash.length - 12, hash.length);
}

void launchUrl(String url) async {
  if (await urlLauncher.canLaunch(url)) {
    await urlLauncher.launch(
      url,
      enableJavaScript: true,
    );
  } else {
    throw 'Could not launch $url';
  }
}

String addAddressPrefix(String address) {
  return ADDRESS_PREFIX + address;
}

String rmAddressPrefix(String address) {
  return address.substring(ADDRESS_PREFIX.length);
}

Future<bool> isValidAddress(String address) async {
  var valid = false;
  if (address.startsWith(ADDRESS_PREFIX)) {
    address = rmAddressPrefix(address);
    valid = await JsChainLib.isValidAddress(address);
  }
  return valid;
}
