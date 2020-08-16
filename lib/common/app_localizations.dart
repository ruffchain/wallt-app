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
