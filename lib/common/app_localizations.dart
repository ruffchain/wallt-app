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
