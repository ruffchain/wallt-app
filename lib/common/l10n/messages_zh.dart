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
    "backupMnemonicAppBar" : MessageLookupByLibrary.simpleMessage("备份助记词"),
    "backupMnemonicErr" : MessageLookupByLibrary.simpleMessage("出错:"),
    "backupMnemonicSafeAreaCancel" : MessageLookupByLibrary.simpleMessage("取消"),
    "backupMnemonicSafeAreaConfirm" : MessageLookupByLibrary.simpleMessage("我已抄写完毕"),
    "backupMnemonicSafeAreaInfo1" : MessageLookupByLibrary.simpleMessage("• 助记词即是私钥，由12~24个单词组成"),
    "backupMnemonicSafeAreaInfo2" : MessageLookupByLibrary.simpleMessage("• 你可以通过助记词恢复你的资产"),
    "backupMnemonicSafeAreaInfo3" : MessageLookupByLibrary.simpleMessage("• 为了你的资产安全，请务必在抄写并存放至安全位置"),
    "backupMnemonicSafeAreaInfo4" : MessageLookupByLibrary.simpleMessage("• 助记词一旦丢失，不可找回"),
    "backupMnemonicSafeAreaText1" : MessageLookupByLibrary.simpleMessage("请按照顺序正确抄写并存放至安全位置"),
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
    "importWalletButton" : MessageLookupByLibrary.simpleMessage("开始导入"),
    "importWalletConfirmHelper" : MessageLookupByLibrary.simpleMessage("再次输入密码以确认"),
    "importWalletConfirmText" : MessageLookupByLibrary.simpleMessage("确认密码"),
    "importWalletFormHelper" : MessageLookupByLibrary.simpleMessage("请输入助记词，按空格分隔"),
    "importWalletFormKeystoreHelper" : MessageLookupByLibrary.simpleMessage("请输入Keystore内容"),
    "importWalletFormKeystoreLabel" : MessageLookupByLibrary.simpleMessage("Keystore"),
    "importWalletFormKeystorePasswordHelper" : MessageLookupByLibrary.simpleMessage("keystore密码会作为钱包密码"),
    "importWalletFormKeystorePasswordLabel" : MessageLookupByLibrary.simpleMessage("keystore密码"),
    "importWalletFormLabel" : MessageLookupByLibrary.simpleMessage("助记词"),
    "importWalletFormPasswordHelper" : MessageLookupByLibrary.simpleMessage("不少于8位字符，建议混合大小写字母，数字，符号"),
    "importWalletFormPasswordLabel" : MessageLookupByLibrary.simpleMessage("设置钱包密码"),
    "importWalletFormPrivatekeyHelper" : MessageLookupByLibrary.simpleMessage("请输入明文私钥"),
    "importWalletFormPrivatekeyLabel" : MessageLookupByLibrary.simpleMessage("私钥"),
    "importWalletImportKeystore" : MessageLookupByLibrary.simpleMessage("密码无法解开Keystore,请正确输入密码和keystore内容"),
    "importWalletImportMnemonic" : MessageLookupByLibrary.simpleMessage("无效的助记词"),
    "importWalletImportPrivatekey" : MessageLookupByLibrary.simpleMessage("无效的私钥"),
    "importWalletKeystore" : MessageLookupByLibrary.simpleMessage("请输入Keystore"),
    "importWalletMnemonic" : MessageLookupByLibrary.simpleMessage("请输入助记词"),
    "importWalletPrivatekey" : MessageLookupByLibrary.simpleMessage("请输入私钥"),
    "importWalletTabKeystore" : MessageLookupByLibrary.simpleMessage("Keystore"),
    "importWalletTabMnemonic" : MessageLookupByLibrary.simpleMessage("助记词"),
    "importWalletTabPrivatekey" : MessageLookupByLibrary.simpleMessage("私钥"),
    "importWalletTitle" : MessageLookupByLibrary.simpleMessage("导入钱包"),
    "importWalletValidPwd" : MessageLookupByLibrary.simpleMessage("请输入密码"),
    "importWalletValidPwdEqual" : MessageLookupByLibrary.simpleMessage("密码不一致"),
    "importWalletValidPwdLength" : MessageLookupByLibrary.simpleMessage("不少于8位字符，建议混合大小写字母，数字，符号"),
    "importWalletValidate" : MessageLookupByLibrary.simpleMessage("钱包已存在，无需重复导入"),
    "importWalletValidateErr" : MessageLookupByLibrary.simpleMessage("出错:"),
    "initWalletPrimBtn" : MessageLookupByLibrary.simpleMessage("创建钱包"),
    "initWalletSecBtn" : MessageLookupByLibrary.simpleMessage("导入钱包"),
    "termsAgree" : MessageLookupByLibrary.simpleMessage("同意"),
    "termsAgreeConfirm" : MessageLookupByLibrary.simpleMessage("我已仔细阅读并同意以上协议"),
    "termsPrimary" : MessageLookupByLibrary.simpleMessage("加载失败，点击重试"),
    "title" : MessageLookupByLibrary.simpleMessage("Ruff钱包")
  };
}
