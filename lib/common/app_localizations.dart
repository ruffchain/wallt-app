import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    // this will be generated by intl tools manually
    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get title {
    return Intl.message('Hello world App',
        name: 'title', desc: 'The application title');
  }

  String get hello {
    return Intl.message('Hello', name: 'hello');
  }

  String get termsPrimary {
    return Intl.message('Loading failed, please try again.',
        name: 'termsPrimary');
  }

  String get termsAgreeConfirm {
    return Intl.message(
        'I have carefully read and agree to the above agreement.',
        name: 'termsAgreeConfirm');
  }

  String get termsAgree {
    return Intl.message("Agree", name: 'termsAgree');
  }

  String get initWalletPrimBtn {
    return Intl.message("Create Wallet", name: 'initWalletPrimBtn');
  }

  String get initWalletSecBtn {
    return Intl.message("Import Wallet", name: 'initWalletSecBtn');
  }

  // createWallet
  String get createWalletLabelText {
    return Intl.message("Password", name: 'createWalletLabelText');
  }

  String get createWalletHelperText {
    return Intl.message(
        "Mixing upper/lower case letters, numbers and symbols, length >= 8",
        name: 'createWalletHelperText');
  }

  String get createWalletInValidatorEmpty {
    return Intl.message("Empty password", name: 'createWalletInValidatorEmpty');
  }

  String get createWalletInValidatorLength {
    return Intl.message(
        "Mixing upper/lower case letters, numbers and symbols, length >= 8",
        name: 'createWalletInValidatorLength');
  }

  String get createWalletConfirmLabelText {
    return Intl.message("Confirm Password",
        name: 'createWalletConfirmLabelText');
  }

  String get createWalletConfirmHelperText {
    return Intl.message("Please Input Password Again",
        name: 'createWalletConfirmHelperText');
  }

  String get createWalletConfirmValidator {
    return Intl.message("Password not match",
        name: 'createWalletConfirmValidator');
  }

  String get createWalletSubmit {
    return Intl.message("Create", name: 'createWalletSubmit');
  }

  String get createWalletTitle {
    return Intl.message("Create Wallet", name: 'createWalletTitle');
  }

  String get createWalletInfoLine1 {
    return Intl.message(
        "Password is used to protect the SECRET KEY, please choose a strong one. ",
        name: 'createWalletInfoLine1');
  }

  String get createWalletInfoLine2 {
    return Intl.message(
        "Ruff won't store the password, either help to get it back. Please keep it safe.",
        name: 'createWalletInfoLine2');
  }

  String get backupMnemonicErr {
    return Intl.message("Error:", name: 'backupMnemonicErr');
  }

  String get backupMnemonicAppBar {
    return Intl.message("backup Menmonics", name: 'backupMnemonicAppBar');
  }

  String get backupMnemonicSafeAreaInfo1 {
    return Intl.message(
        "• Mnemonics are private keys, which are composed of 12-24 words",
        name: 'backupMnemonicSafeAreaInfo1');
  }

  String get backupMnemonicSafeAreaInfo2 {
    return Intl.message("• You can restore your assets by mnemonics",
        name: 'backupMnemonicSafeAreaInfo2');
  }

  String get backupMnemonicSafeAreaInfo3 {
    return Intl.message(
        "• For the safety of your assets, please be sure to copy and store them in a safe place",
        name: 'backupMnemonicSafeAreaInfo3');
  }

  String get backupMnemonicSafeAreaInfo4 {
    return Intl.message("• Once the mnemonics are lost, it cannot be retrieved",
        name: 'backupMnemonicSafeAreaInfo4');
  }

  String get backupMnemonicSafeAreaText1 {
    return Intl.message("• Please copy word by word and store in a safe place",
        name: 'backupMnemonicSafeAreaText1');
  }

  String get backupMnemonicSafeAreaCancel {
    return Intl.message("Cancel", name: 'backupMnemonicSafeAreaCancel');
  }

  String get backupMnemonicSafeAreaConfirm {
    return Intl.message("Finished Copying",
        name: 'backupMnemonicSafeAreaConfirm');
  }

  String get importWalletMnemonic {
    return Intl.message("Mnemonics", name: 'importWalletMnemonic');
  }

  String get importWalletKeystore {
    return Intl.message("Keystore", name: 'importWalletKeystore');
  }

  String get importWalletPrivatekey {
    return Intl.message("Private Key", name: 'importWalletPrivatekey');
  }

  String get importWalletValidPwd {
    return Intl.message("Please Input Password", name: 'importWalletValidPwd');
  }

  String get importWalletValidPwdLength {
    return Intl.message(
        "<= 8 characters, mixed case letters, numbers and symbols recommended",
        name: 'importWalletValidPwdLength');
  }

  String get importWalletValidPwdEqual {
    return Intl.message("Password inconsistency",
        name: 'importWalletValidPwdEqual');
  }

  String get importWalletImportMnemonic {
    return Intl.message("Invalid mnemonics",
        name: 'importWalletImportMnemonic');
  }

  String get importWalletImportKeystore {
    return Intl.message(
        "The password cannot unlock keysore. Please enter the password and keystore correctly",
        name: 'importWalletImportKeystore');
  }

  String get importWalletImportPrivatekey {
    return Intl.message("Invalid Private Key",
        name: 'importWalletImportPrivatekey');
  }

  String get importWalletValidate {
    return Intl.message("Wallet already exists, no need to import again",
        name: 'importWalletValidate');
  }

  String get importWalletValidateErr {
    return Intl.message("Error:", name: 'importWalletValidateErr');
  }

  String get importWalletTitle {
    return Intl.message("Import Wallet", name: 'importWalletTitle');
  }

  String get importWalletTabMnemonic {
    return Intl.message("Mnemonics", name: 'importWalletTabMnemonic');
  }

  String get importWalletTabKeystore {
    return Intl.message("Keystore", name: 'importWalletTabKeystore');
  }

  String get importWalletTabPrivatekey {
    return Intl.message("Private Key", name: 'importWalletTabPrivatekey');
  }

  String get importWalletButton {
    return Intl.message("Start Importing", name: 'importWalletButton');
  }

  String get importWalletFormLabel {
    return Intl.message("Mnemonics", name: 'importWalletFormLabel');
  }

  String get importWalletFormHelper {
    return Intl.message("Please enter mnemonics separated by spaces",
        name: 'importWalletFormHelper');
  }

  String get importWalletFormPasswordLabel {
    return Intl.message("Wallet Password",
        name: 'importWalletFormPasswordLabel');
  }

  String get importWalletFormPasswordHelper {
    return Intl.message(
        "<= 8 characters, mixed case letters, numbers and symbols recommended",
        name: 'importWalletFormPasswordHelper');
  }

  String get importWalletFormKeystoreLabel {
    return Intl.message("Keystore", name: 'importWalletFormKeystoreLabel');
  }

  String get importWalletFormKeystoreHelper {
    return Intl.message("Please input Keystore content",
        name: 'importWalletFormKeystoreHelper');
  }

  String get importWalletFormKeystorePasswordLabel {
    return Intl.message("Keystore Password",
        name: 'importWalletFormKeystorePasswordLabel');
  }

  String get importWalletFormKeystorePasswordHelper {
    return Intl.message(
        "The keystore password will be used as the wallet password",
        name: 'importWalletFormKeystorePasswordHelper');
  }

  String get importWalletFormPrivatekeyLabel {
    return Intl.message("Private Key", name: 'importWalletFormPrivatekeyLabel');
  }

  String get importWalletFormPrivatekeyHelper {
    return Intl.message("Please enter the plaintext private key",
        name: 'importWalletFormPrivatekeyHelper');
  }

  String get importWalletConfirmText {
    return Intl.message("Confirm Pasword", name: 'importWalletConfirmText');
  }

  String get importWalletConfirmHelper {
    return Intl.message("Enter the password again to confirm",
        name: 'importWalletConfirmHelper');
  }

  String get appMainContainerNavBarWallet {
    return Intl.message("Wallet", name: 'appMainContainerNavBarWallet');
  }

  String get appMainContainerNavBarAccount {
    return Intl.message("Account", name: 'appMainContainerNavBarAccount');
  }

  String get appMainContainerOutdateText {
    return Intl.message("You must update to continue using the software",
        name: 'appMainContainerOutdateText');
  }

  String get appMainContainerOutdateBtn {
    return Intl.message("To Update", name: 'appMainContainerOutdateBtn');
  }

  String get accountListTitle {
    return Intl.message("Wallet Management", name: 'accountListTitle');
  }

  String get accountListBtnCreate {
    return Intl.message("Create Wallet", name: 'accountListBtnCreate');
  }

  String get accountListBtnImport {
    return Intl.message("Import Wallet", name: 'accountListBtnImport');
  }

  String get accountManagerTitle {
    return Intl.message("Manage Wallet", name: 'accountManagerTitle');
  }

  String get accountManagerActionLine1 {
    return Intl.message("Backup Mnemonics", name: 'accountManagerActionLine1');
  }

  String get accountManagerActionLine2 {
    return Intl.message("Backup KeyStore", name: 'accountManagerActionLine2');
  }

  String get accountManagerActionLine3 {
    return Intl.message("Backup PrivateKey", name: 'accountManagerActionLine3');
  }

  String get accountManagerDelete {
    return Intl.message("Delete Wallet", name: 'accountManagerDelete');
  }

  String get accountManagerAddress {
    return Intl.message("Wallet Address", name: 'accountManagerAddress');
  }

  String get accountManagerSnackBar {
    return Intl.message("Address Copy Succeed", name: 'accountManagerSnackBar');
  }

  String get backupAccountTitleKeystore {
    return Intl.message("keystore", name: 'backupAccountTitleKeystore');
  }

  String get backupAccountTitleMnemonic {
    return Intl.message("mnemonic", name: 'backupAccountTitleMnemonic');
  }

  String get backupAccountTitlePrivatekey {
    return Intl.message("private key", name: 'backupAccountTitlePrivatekey');
  }

  String get backupAccountSnackbar {
    return Intl.message("Copy Succeed", name: 'backupAccountSnackbar');
  }

  String get backupAccountTitle {
    return Intl.message("Backup ", name: 'backupAccountTitle');
  }

  String get backupAccountDescPrivatekey {
    return Intl.message(
        "Obtaining the private key is equal to owning the property of the wallet. Please copy and keep it in a safe place. The following is the private key of the wallet",
        name: 'backupAccountDescPrivatekey');
  }

  String get backupAccountDescMnemonic {
    return Intl.message(
        "Mnemonics are private keys, which consist of 12-24 words. You can recover your assets through mnemonics. For the safety of your assets, please be sure to copy and store them in a safe location. Once the mnemonics are lost, they cannot be retrieved.",
        name: 'backupAccountDescMnemonic');
  }

  String get backupAccountDescKeystore {
    return Intl.message(
        "Keystore file is an encrypted private key. Please copy and keep it in a safe place. Once lost, it cannot be retrieved. Here is the keystore file for the wallet.",
        name: 'backupAccountDescKeystore');
  }

  String get backupAccountCopy {
    return Intl.message("Copy", name: 'backupAccountCopy');
  }

  String get transferTokenEnter {
    return Intl.message("Please Enter", name: 'transferTokenEnter');
  }

  String get transferTokenInvalidAddr {
    return Intl.message("Invalid address, please re-enter",
        name: 'transferTokenInvalidAddr');
  }

  String get transferTokenEnterValid {
    return Intl.message("Please enter a valid number",
        name: 'transferTokenEnterValid');
  }

  String get transferTokenEnterAmount {
    return Intl.message("Please Enter Amount",
        name: 'transferTokenEnterAmount');
  }

  String get transferTokenErrPrecision {
    return Intl.message("Token precision input up to 9 bits",
        name: 'transferTokenErrPrecision');
  }

  String get transferTokenErrGasfee {
    return Intl.message("Please input Gasfee >= 0.1",
        name: 'transferTokenErrGasfee');
  }

  String get transferTokenConfirmModalTitle {
    return Intl.message("Transaction confirmed",
        name: 'transferTokenConfirmModalTitle');
  }

  String get transferTokenConfirmModalContent {
    return Intl.message("Transaction Succeeds! Hash ",
        name: 'transferTokenConfirmModalContent');
  }

  String get transferTokenConfirmModalClose {
    return Intl.message("Close", name: 'transferTokenConfirmModalClose');
  }

  String get transferTokenUnconfirmModalTitle {
    return Intl.message("Transaction to be confirmed",
        name: 'transferTokenUnconfirmModalTitle');
  }

  String get transferTokenUnconfirmModalContent {
    return Intl.message(
        "The transaction has been sent successfully, but confirmation has not been obtained in a short time. Please confirm whether the transaction has been executed by chain. Transaction Hash value:",
        name: 'transferTokenUnconfirmModalContent');
  }

  String get transferTokenUnconfirmModalClose {
    return Intl.message("Close", name: 'transferTokenUnconfirmModalClose');
  }

  String get transferTokenUnconfirmModalCopy {
    return Intl.message("Copy Hash ", name: 'transferTokenUnconfirmModalCopy');
  }

  String get transferTokenUnconfirmModalCopyOK {
    return Intl.message("Copy Succeed ",
        name: 'transferTokenUnconfirmModalCopyOK');
  }

  String get transferTokenScanDenied {
    return Intl.message(
        "Please open the camera permission of the app in the mobile phone settings to use the code scanning function normally.",
        name: 'transferTokenScanDenied');
  }

  String get transferTokenScanAccessErr {
    return Intl.message("Camera access error",
        name: 'transferTokenScanAccessErr');
  }

  String get transferTokenScanErr {
    return Intl.message("Error ", name: 'transferTokenScanErr');
  }

  String get transferTokenTransfer {
    return Intl.message("RUFF Transfer ", name: 'transferTokenTransfer');
  }

  String get transferTokenFormAddressLabel {
    return Intl.message("To Address ", name: 'transferTokenFormAddressLabel');
  }

  String get transferTokenFormAddressHelper {
    return Intl.message("Please enter the receiving Address ",
        name: 'transferTokenFormAddressHelper');
  }

  String get transferTokenFormTokenLabel {
    return Intl.message("Token Amount ", name: 'transferTokenFormTokenLabel');
  }

  String get transferTokenFormTokenHelper {
    return Intl.message("Please enter the transfer amount ",
        name: 'transferTokenFormTokenHelper');
  }

  String get transferTokenFormGasHelper {
    return Intl.message("Please input the miner's fee ≥ 0.1 ",
        name: 'transferTokenFormGasHelper');
  }

  String get transferTokenStart {
    return Intl.message("Start Transfer", name: 'transferTokenStart');
  }

  String get receiveTokenTitle {
    return Intl.message("Receive Token", name: 'receiveTokenTitle');
  }

  String get receiveTokenQRCode {
    return Intl.message("Scan QR code to transfer token to me",
        name: 'receiveTokenQRCode');
  }

  String get receiveTokenSnackBar {
    return Intl.message("Address copied successfully",
        name: 'receiveTokenSnackBar');
  }

  String get txHistoryDetailTitle {
    return Intl.message("Transaction Details", name: 'txHistoryDetailTitle');
  }

  String get txHistoryDetailTime {
    return Intl.message("Trading Time", name: 'txHistoryDetailTime');
  }

  String get txHistoryDetailMethod {
    return Intl.message("Transaction Method", name: 'txHistoryDetailMethod');
  }

  String get txHistoryDetailAmount {
    return Intl.message("Transaction Amount", name: 'txHistoryDetailAmount');
  }

  String get txHistoryDetailCaller {
    return Intl.message("Sendor", name: 'txHistoryDetailCaller');
  }

  String get txHistoryDetailReceiver {
    return Intl.message("Payee", name: 'txHistoryDetailReceiver');
  }

  String get txHistoryDetailGasFee {
    return Intl.message("Gas Fee", name: 'txHistoryDetailGasFee');
  }

  String get txHistoryDetailHash {
    return Intl.message("Transaction Hash", name: 'txHistoryDetailHash');
  }

  String get txHistoryDetailBlock {
    return Intl.message("Block Number", name: 'txHistoryDetailBlock');
  }

  String get txHistoryDetailCopyOK {
    return Intl.message("Copy Succeed", name: 'txHistoryDetailCopyOK');
  }

  String get txHistoryIndexTitle {
    return Intl.message("Transaction History", name: 'txHistoryIndexTitle');
  }

  String get txHistoryIndexTabAll {
    return Intl.message("All", name: 'txHistoryIndexTabAll');
  }

  String get txHistoryIndexTabTransfer {
    return Intl.message("Transfer", name: 'txHistoryIndexTabTransfer');
  }

  String get txHistoryIndexTabReceive {
    return Intl.message("Receive", name: 'txHistoryIndexTabReceive');
  }

  String get txHistoryListTitle {
    return Intl.message("The network is unstable. Please try again",
        name: 'txHistoryListTitle');
  }

  String get txHistoryListNone {
    return Intl.message("No Information", name: 'txHistoryListNone');
  }

  String get txHistoryListLoading {
    return Intl.message("Loading completed", name: 'txHistoryListLoading');
  }

  String get mineCommunityListTitle {
    return Intl.message("Join Community", name: 'mineCommunityListTitle');
  }

  String get mineAboutUsTitle {
    return Intl.message("New version detected", name: 'mineAboutUsTitle');
  }

  String get mineAboutUsCurVersion {
    return Intl.message("Current Version", name: 'mineAboutUsCurVersion');
  }

  String get mineAboutUsLatestVersion {
    return Intl.message("Latest Version", name: 'mineAboutUsLatestVersion');
  }

  String get mineAboutUsToUpdate {
    return Intl.message("Update now?", name: 'mineAboutUsToUpdate');
  }

  String get mineAboutUsUpdated {
    return Intl.message("This is the latest version",
        name: 'mineAboutUsUpdated');
  }

  String get mineAboutAppBar {
    return Intl.message("About Us", name: 'mineAboutAppBar');
  }

  String get mineAboutSafeAreaVersionLog {
    return Intl.message("Version Log", name: 'mineAboutSafeAreaVersionLog');
  }

  String get mineAboutSafeAreaVersionUpdate {
    return Intl.message("Version Update",
        name: 'mineAboutSafeAreaVersionUpdate');
  }

  String get mineHelpCenter {
    return Intl.message("Help Center", name: 'mineHelpCenter');
  }

  String get mineJoin {
    return Intl.message("Join Community", name: 'mineJoin');
  }

  String get mineAboutUs {
    return Intl.message("About Us", name: 'mineAboutUs');
  }

  String get mineVersionLogTitle {
    return Intl.message("Version Log", name: 'mineVersionLogTitle');
  }

  String get mineVersionVer {
    return Intl.message("Version", name: 'mineVersionVer');
  }

  String get mineVersion124 {
    return Intl.message("Fix: ios input text paste issue",
        name: 'mineVersion124');
  }

  String get mineVersion123 {
    return Intl.message("Fix: App name, privacy agreement",
        name: 'mineVersion123');
  }

  String get mineVersion122 {
    return Intl.message("Fix: English version", name: 'mineVersion122');
  }

  String get mineVersion121 {
    return Intl.message("Fix: address validation issue",
        name: 'mineVersion121');
  }

  String get mineVersion120 {
    return Intl.message(
        "Fix: failed when transfer amount has too many decimal places",
        name: 'mineVersion120');
  }

  String get mineVersion110 {
    return Intl.message("Fix: Add address prefix ruff", name: 'mineVersion110');
  }

  String get mineVersion1001 {
    return Intl.message("Fix: Support for creating and importing wallets",
        name: 'mineVersion1001');
  }

  String get mineVersion1002 {
    return Intl.message("Fix: Support for backup Wallet",
        name: 'mineVersion1002');
  }

  String get mineVersion1003 {
    return Intl.message("Fix: Support ruff transfer", name: 'mineVersion1003');
  }

  String get walletSnackBar {
    return Intl.message("Please check the network connection",
        name: 'walletSnackBar');
  }

  String get walletHeaderBarPayment {
    return Intl.message("Transfer", name: 'walletHeaderBarPayment');
  }

  String get walletHeaderBarReceive {
    return Intl.message("Receive", name: 'walletHeaderBarReceive');
  }

  String get walletHeaderBarTransaction {
    return Intl.message("Transactions", name: 'walletHeaderBarTransaction');
  }

  String get walletListEmpty {
    return Intl.message("Asset list is empty", name: 'walletListEmpty');
  }

  String get loadingTransferText {
    return Intl.message(
        "\nPlease wait 20~40 seconds\nfor the transaction to be executed.",
        name: 'loadingTransferText');
  }

  String get inputPasswordDlgText {
    return Intl.message("Please Enter Wallet Password",
        name: 'inputPasswordDlgText');
  }

  String get inputPasswordDlgEmpty {
    return Intl.message("Password is Empty", name: 'inputPasswordDlgEmpty');
  }

  String get inputPasswordDlgWrong {
    return Intl.message("Password is Wrong", name: 'inputPasswordDlgWrong');
  }

  String get inputPasswordDlgCancel {
    return Intl.message("Cancel", name: 'inputPasswordDlgCancel');
  }

  String get inputPasswordDlgConfirm {
    return Intl.message("Confirm", name: 'inputPasswordDlgConfirm');
  }

  String get confirmDialogCancel {
    return Intl.message("Cancel", name: 'confirmDialogCancel');
  }

  String get confirmDialogConfirm {
    return Intl.message("Confirm", name: 'confirmDialogConfirm');
  }

  String get configTermsUrl {
    return Intl.message("https://ruffchain.com/wallet/terms_en.html",
        name: 'configTermsUrl');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
