// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
        "accountListBtnCreate":
            MessageLookupByLibrary.simpleMessage("Create Wallet"),
        "accountListBtnImport":
            MessageLookupByLibrary.simpleMessage("Import Wallet"),
        "accountListTitle":
            MessageLookupByLibrary.simpleMessage("Wallet Management"),
        "accountManagerActionLine1":
            MessageLookupByLibrary.simpleMessage("Backup Mnemonics"),
        "accountManagerActionLine2":
            MessageLookupByLibrary.simpleMessage("Backup KeyStore"),
        "accountManagerActionLine3":
            MessageLookupByLibrary.simpleMessage("Backup PrivateKey"),
        "accountManagerAddress":
            MessageLookupByLibrary.simpleMessage("Wallet Address"),
        "accountManagerDelete":
            MessageLookupByLibrary.simpleMessage("Delete Wallet"),
        "accountManagerSnackBar":
            MessageLookupByLibrary.simpleMessage("Address Copy Succeed"),
        "accountManagerTitle":
            MessageLookupByLibrary.simpleMessage("Manage Wallet"),
        "appMainContainerNavBarAccount":
            MessageLookupByLibrary.simpleMessage("Account"),
        "appMainContainerNavBarWallet":
            MessageLookupByLibrary.simpleMessage("Wallet"),
        "appMainContainerOutdateBtn":
            MessageLookupByLibrary.simpleMessage("To Update"),
        "appMainContainerOutdateText": MessageLookupByLibrary.simpleMessage(
            "You must update to continue using the software"),
        "backupAccountCopy": MessageLookupByLibrary.simpleMessage("Copy"),
        "backupAccountDescKeystore": MessageLookupByLibrary.simpleMessage(
            "Keystore file is an encrypted private key. Please copy and keep it in a safe place. Once lost, it cannot be retrieved. Here is the keystore file for the wallet."),
        "backupAccountDescMnemonic": MessageLookupByLibrary.simpleMessage(
            "Mnemonics are private keys, which consist of 12-24 words. You can recover your assets through mnemonics. For the safety of your assets, please be sure to copy and store them in a safe location. Once the mnemonics are lost, they cannot be retrieved."),
        "backupAccountDescPrivatekey": MessageLookupByLibrary.simpleMessage(
            "Obtaining the private key is equal to owning the property of the wallet. Please copy and keep it in a safe place. The following is the private key of the wallet"),
        "backupAccountSnackbar":
            MessageLookupByLibrary.simpleMessage("Copy Succeed"),
        "backupAccountTitle": MessageLookupByLibrary.simpleMessage("Backup "),
        "backupAccountTitleKeystore":
            MessageLookupByLibrary.simpleMessage("keystore"),
        "backupAccountTitleMnemonic":
            MessageLookupByLibrary.simpleMessage("mnemonic"),
        "backupAccountTitlePrivatekey":
            MessageLookupByLibrary.simpleMessage("private key"),
        "backupMnemonicAppBar":
            MessageLookupByLibrary.simpleMessage("backup Menmonics"),
        "backupMnemonicErr": MessageLookupByLibrary.simpleMessage("Error:"),
        "backupMnemonicSafeAreaCancel":
            MessageLookupByLibrary.simpleMessage("Cancel"),
        "backupMnemonicSafeAreaConfirm":
            MessageLookupByLibrary.simpleMessage("Finished Copying"),
        "backupMnemonicSafeAreaInfo1": MessageLookupByLibrary.simpleMessage(
            "• Mnemonics are private keys, which are composed of 12-24 words"),
        "backupMnemonicSafeAreaInfo2": MessageLookupByLibrary.simpleMessage(
            "• You can restore your assets by mnemonics"),
        "backupMnemonicSafeAreaInfo3": MessageLookupByLibrary.simpleMessage(
            "• For the safety of your assets, please be sure to copy and store them in a safe place"),
        "backupMnemonicSafeAreaInfo4": MessageLookupByLibrary.simpleMessage(
            "• Once the mnemonics are lost, it cannot be retrieved"),
        "backupMnemonicSafeAreaText1": MessageLookupByLibrary.simpleMessage(
            "• Please copy word by word and store in a safe place"),
        "createWalletConfirmHelperText":
            MessageLookupByLibrary.simpleMessage("Please Input Password Again"),
        "createWalletConfirmLabelText":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "createWalletConfirmValidator":
            MessageLookupByLibrary.simpleMessage("Password not match"),
        "createWalletHelperText": MessageLookupByLibrary.simpleMessage(
            "Mixing upper/lower case letters, numbers and symbols, length >= 8"),
        "createWalletInValidatorEmpty":
            MessageLookupByLibrary.simpleMessage("Empty password"),
        "createWalletInValidatorLength": MessageLookupByLibrary.simpleMessage(
            "Mixing upper/lower case letters, numbers and symbols, length >= 8"),
        "createWalletInfoLine1": MessageLookupByLibrary.simpleMessage(
            "Password is used to protect the SECRET KEY, please choose a strong one. "),
        "createWalletInfoLine2": MessageLookupByLibrary.simpleMessage(
            "Ruff won\'t store the password, either help to get it back. Please keep it safe."),
        "createWalletLabelText":
            MessageLookupByLibrary.simpleMessage("Password"),
        "createWalletSubmit": MessageLookupByLibrary.simpleMessage("Create"),
        "createWalletTitle":
            MessageLookupByLibrary.simpleMessage("Create Wallet"),
        "hello": MessageLookupByLibrary.simpleMessage("Hello"),
        "importWalletButton":
            MessageLookupByLibrary.simpleMessage("Start Importing"),
        "importWalletConfirmHelper": MessageLookupByLibrary.simpleMessage(
            "Enter the password again to confirm"),
        "importWalletConfirmText":
            MessageLookupByLibrary.simpleMessage("Confirm Pasword"),
        "importWalletFormHelper": MessageLookupByLibrary.simpleMessage(
            "Please enter mnemonics separated by spaces"),
        "importWalletFormKeystoreHelper": MessageLookupByLibrary.simpleMessage(
            "Please input Keystore content"),
        "importWalletFormKeystoreLabel":
            MessageLookupByLibrary.simpleMessage("Keystore"),
        "importWalletFormKeystorePasswordHelper":
            MessageLookupByLibrary.simpleMessage(
                "The keystore password will be used as the wallet password"),
        "importWalletFormKeystorePasswordLabel":
            MessageLookupByLibrary.simpleMessage("Keystore Password"),
        "importWalletFormLabel":
            MessageLookupByLibrary.simpleMessage("Mnemonics"),
        "importWalletFormPasswordHelper": MessageLookupByLibrary.simpleMessage(
            "<= 8 characters, mixed case letters, numbers and symbols recommended"),
        "importWalletFormPasswordLabel":
            MessageLookupByLibrary.simpleMessage("Wallet Password"),
        "importWalletFormPrivatekeyHelper":
            MessageLookupByLibrary.simpleMessage(
                "Please enter the plaintext private key"),
        "importWalletFormPrivatekeyLabel":
            MessageLookupByLibrary.simpleMessage("Private Key"),
        "importWalletImportKeystore": MessageLookupByLibrary.simpleMessage(
            "The password cannot unlock keysore. Please enter the password and keystore correctly"),
        "importWalletImportMnemonic":
            MessageLookupByLibrary.simpleMessage("Invalid mnemonics"),
        "importWalletImportPrivatekey":
            MessageLookupByLibrary.simpleMessage("Invalid Private Key"),
        "importWalletKeystore":
            MessageLookupByLibrary.simpleMessage("Keystore"),
        "importWalletMnemonic":
            MessageLookupByLibrary.simpleMessage("Mnemonics"),
        "importWalletPrivatekey":
            MessageLookupByLibrary.simpleMessage("Private Key"),
        "importWalletTabKeystore":
            MessageLookupByLibrary.simpleMessage("Keystore"),
        "importWalletTabMnemonic":
            MessageLookupByLibrary.simpleMessage("Mnemonics"),
        "importWalletTabPrivatekey":
            MessageLookupByLibrary.simpleMessage("Private Key"),
        "importWalletTitle":
            MessageLookupByLibrary.simpleMessage("Import Wallet"),
        "importWalletValidPwd":
            MessageLookupByLibrary.simpleMessage("Please Input Password"),
        "importWalletValidPwdEqual":
            MessageLookupByLibrary.simpleMessage("Password inconsistency"),
        "importWalletValidPwdLength": MessageLookupByLibrary.simpleMessage(
            "<= 8 characters, mixed case letters, numbers and symbols recommended"),
        "importWalletValidate": MessageLookupByLibrary.simpleMessage(
            "Wallet already exists, no need to import again"),
        "importWalletValidateErr":
            MessageLookupByLibrary.simpleMessage("Error:"),
        "initWalletPrimBtn":
            MessageLookupByLibrary.simpleMessage("Create Wallet"),
        "initWalletSecBtn":
            MessageLookupByLibrary.simpleMessage("Import Wallet"),
        "mineAboutAppBar": MessageLookupByLibrary.simpleMessage("About Us"),
        "mineAboutSafeAreaVersionLog":
            MessageLookupByLibrary.simpleMessage("Version Log"),
        "mineAboutSafeAreaVersionUpdate":
            MessageLookupByLibrary.simpleMessage("Version Update"),
        "mineAboutUs": MessageLookupByLibrary.simpleMessage("About Us"),
        "mineAboutUsCurVersion":
            MessageLookupByLibrary.simpleMessage("Current Version"),
        "mineAboutUsLatestVersion":
            MessageLookupByLibrary.simpleMessage("Latest Version"),
        "mineAboutUsTitle":
            MessageLookupByLibrary.simpleMessage("New version detected"),
        "mineAboutUsToUpdate":
            MessageLookupByLibrary.simpleMessage("Update now?"),
        "mineAboutUsUpdated":
            MessageLookupByLibrary.simpleMessage("This is the latest version"),
        "mineCommunityListTitle":
            MessageLookupByLibrary.simpleMessage("Join Community"),
        "mineHelpCenter": MessageLookupByLibrary.simpleMessage("Help Center"),
        "mineJoin": MessageLookupByLibrary.simpleMessage("Join Community"),
        "mineVersion1001": MessageLookupByLibrary.simpleMessage(
            "Fix: Support for creating and importing wallets"),
        "mineVersion1002": MessageLookupByLibrary.simpleMessage(
            "Fix: Support for backup Wallet"),
        "mineVersion1003":
            MessageLookupByLibrary.simpleMessage("Fix: Support ruff transfer"),
        "mineVersion110": MessageLookupByLibrary.simpleMessage(
            "Fix: Add address prefix ruff"),
        "mineVersion120": MessageLookupByLibrary.simpleMessage(
            "Fix: failed when transfer amount has too many decimal places"),
        "mineVersion121": MessageLookupByLibrary.simpleMessage(
            "Fix: address validation issue"),
        "mineVersionLogTitle":
            MessageLookupByLibrary.simpleMessage("Version Log"),
        "mineVersionVer": MessageLookupByLibrary.simpleMessage("Version"),
        "receiveTokenQRCode": MessageLookupByLibrary.simpleMessage(
            "Scan QR code to transfer token to me"),
        "receiveTokenSnackBar":
            MessageLookupByLibrary.simpleMessage("Address copied successfully"),
        "receiveTokenTitle":
            MessageLookupByLibrary.simpleMessage("Receive Token"),
        "termsAgree": MessageLookupByLibrary.simpleMessage("Agree"),
        "termsAgreeConfirm": MessageLookupByLibrary.simpleMessage(
            "I have carefully read and agree to the above agreement "),
        "termsPrimary": MessageLookupByLibrary.simpleMessage(
            "Loading failed, please try again."),
        "title": MessageLookupByLibrary.simpleMessage("Ruff Wallet"),
        "transferTokenConfirmModalClose":
            MessageLookupByLibrary.simpleMessage("Close"),
        "transferTokenConfirmModalContent":
            MessageLookupByLibrary.simpleMessage("Transaction Succeeds! Hash "),
        "transferTokenConfirmModalTitle":
            MessageLookupByLibrary.simpleMessage("Transaction confirmed"),
        "transferTokenEnter":
            MessageLookupByLibrary.simpleMessage("Please Enter"),
        "transferTokenEnterAmount":
            MessageLookupByLibrary.simpleMessage("Please Enter Amount"),
        "transferTokenEnterValid":
            MessageLookupByLibrary.simpleMessage("Please enter a valid number"),
        "transferTokenErrGasfee":
            MessageLookupByLibrary.simpleMessage("Please input Gasfee >= 0.1"),
        "transferTokenErrPrecision": MessageLookupByLibrary.simpleMessage(
            "Token precision input up to 9 bits"),
        "transferTokenFormAddressHelper": MessageLookupByLibrary.simpleMessage(
            "Please enter the receiving Address "),
        "transferTokenFormAddressLabel":
            MessageLookupByLibrary.simpleMessage("To Address "),
        "transferTokenFormGasHelper": MessageLookupByLibrary.simpleMessage(
            "Please input the miner\'s fee ≥ 0.1 "),
        "transferTokenFormTokenHelper": MessageLookupByLibrary.simpleMessage(
            "Please enter the transfer amount "),
        "transferTokenFormTokenLabel":
            MessageLookupByLibrary.simpleMessage("Token Amount "),
        "transferTokenInvalidAddr": MessageLookupByLibrary.simpleMessage(
            "Invalid address, please re-enter"),
        "transferTokenScanAccessErr":
            MessageLookupByLibrary.simpleMessage("Camera access error"),
        "transferTokenScanDenied": MessageLookupByLibrary.simpleMessage(
            "Please open the camera permission of the app in the mobile phone settings to use the code scanning function normally."),
        "transferTokenScanErr": MessageLookupByLibrary.simpleMessage("Error "),
        "transferTokenStart":
            MessageLookupByLibrary.simpleMessage("Start Transfer"),
        "transferTokenTransfer":
            MessageLookupByLibrary.simpleMessage("RUFF Transfer "),
        "transferTokenUnconfirmModalClose":
            MessageLookupByLibrary.simpleMessage("Close"),
        "transferTokenUnconfirmModalContent": MessageLookupByLibrary.simpleMessage(
            "The transaction has been sent successfully, but confirmation has not been obtained in a short time. Please confirm whether the transaction has been executed by chain. Transaction Hash value:"),
        "transferTokenUnconfirmModalCopy":
            MessageLookupByLibrary.simpleMessage("Copy Hash "),
        "transferTokenUnconfirmModalCopyOK":
            MessageLookupByLibrary.simpleMessage("Copy Succeed "),
        "transferTokenUnconfirmModalTitle":
            MessageLookupByLibrary.simpleMessage("Transaction to be confirmed"),
        "txHistoryDetailAmount":
            MessageLookupByLibrary.simpleMessage("Transaction Amount"),
        "txHistoryDetailBlock":
            MessageLookupByLibrary.simpleMessage("Block Number"),
        "txHistoryDetailCaller": MessageLookupByLibrary.simpleMessage("Sendor"),
        "txHistoryDetailCopyOK":
            MessageLookupByLibrary.simpleMessage("Copy Succeed"),
        "txHistoryDetailGasFee":
            MessageLookupByLibrary.simpleMessage("Gas Fee"),
        "txHistoryDetailHash":
            MessageLookupByLibrary.simpleMessage("Transaction Hash"),
        "txHistoryDetailMethod":
            MessageLookupByLibrary.simpleMessage("Transaction Method"),
        "txHistoryDetailReceiver":
            MessageLookupByLibrary.simpleMessage("Payee"),
        "txHistoryDetailTime":
            MessageLookupByLibrary.simpleMessage("Trading Time"),
        "txHistoryDetailTitle":
            MessageLookupByLibrary.simpleMessage("Transaction Details"),
        "txHistoryIndexTabAll": MessageLookupByLibrary.simpleMessage("All"),
        "txHistoryIndexTabReceive":
            MessageLookupByLibrary.simpleMessage("Receive"),
        "txHistoryIndexTabTransfer":
            MessageLookupByLibrary.simpleMessage("Transfer"),
        "txHistoryIndexTitle":
            MessageLookupByLibrary.simpleMessage("Transaction History"),
        "txHistoryListLoading":
            MessageLookupByLibrary.simpleMessage("Loading completed"),
        "txHistoryListNone":
            MessageLookupByLibrary.simpleMessage("No Information"),
        "txHistoryListTitle": MessageLookupByLibrary.simpleMessage(
            "The network is unstable. Please try again"),
        "walletHeaderBarPayment":
            MessageLookupByLibrary.simpleMessage("Transfer"),
        "walletHeaderBarReceive":
            MessageLookupByLibrary.simpleMessage("Receive"),
        "walletHeaderBarTransaction":
            MessageLookupByLibrary.simpleMessage("Transactions"),
        "walletListEmpty":
            MessageLookupByLibrary.simpleMessage("Asset list is empty"),
        "walletSnackBar": MessageLookupByLibrary.simpleMessage(
            "Please check the network connection")
      };
}
