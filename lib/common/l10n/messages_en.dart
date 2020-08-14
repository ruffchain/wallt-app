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
        "initWalletPrimBtn":
            MessageLookupByLibrary.simpleMessage("Create Wallet"),
        "initWalletSecBtn":
            MessageLookupByLibrary.simpleMessage("Import Wallet"),
        "termsAgree": MessageLookupByLibrary.simpleMessage("Agree"),
        "termsAgreeConfirm": MessageLookupByLibrary.simpleMessage(
            "I have carefully read and agree to the above agreement "),
        "termsPrimary": MessageLookupByLibrary.simpleMessage(
            "Loading failed, please try again."),
        "title": MessageLookupByLibrary.simpleMessage("Ruff Wallet")
      };
}
