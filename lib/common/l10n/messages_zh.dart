// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
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
  String get localeName => 'zh';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "createWalletConfirmHelperText" : MessageLookupByLibrary.simpleMessage("再次输入密码以确认"),
    "createWalletConfirmLabelText" : MessageLookupByLibrary.simpleMessage("确认密码"),
    "createWalletConfirmValidator" : MessageLookupByLibrary.simpleMessage("密码不一致"),
    "createWalletHelperText" : MessageLookupByLibrary.simpleMessage("不少于8位字符，建议混合大小写字母，数字，符号"),
    "createWalletInValidatorEmpty" : MessageLookupByLibrary.simpleMessage("密码不能为空"),
    "createWalletInValidatorLength" : MessageLookupByLibrary.simpleMessage("不少于8位字符，建议混合大小写字母，数字，符号"),
    "createWalletInfoLine1" : MessageLookupByLibrary.simpleMessage("• 密码用于加密保护私钥、转账等，请设置高强度密码。 "),
    "createWalletInfoLine2" : MessageLookupByLibrary.simpleMessage("• RUFF不存储密码，也无法帮您找回密码，请务必牢记。"),
    "createWalletLabelText" : MessageLookupByLibrary.simpleMessage("密码"),
    "createWalletSubmit" : MessageLookupByLibrary.simpleMessage("创建"),
    "createWalletTitle" : MessageLookupByLibrary.simpleMessage("创建钱包"),
    "hello" : MessageLookupByLibrary.simpleMessage("Hello"),
    "initWalletPrimBtn" : MessageLookupByLibrary.simpleMessage("创建钱包"),
    "initWalletSecBtn" : MessageLookupByLibrary.simpleMessage("导入钱包"),
    "termsAgree" : MessageLookupByLibrary.simpleMessage("同意"),
    "termsAgreeConfirm" : MessageLookupByLibrary.simpleMessage("我已仔细阅读并同意以上协议"),
    "termsPrimary" : MessageLookupByLibrary.simpleMessage("加载失败，点击重试"),
    "title" : MessageLookupByLibrary.simpleMessage("Ruff钱包")
  };
}
