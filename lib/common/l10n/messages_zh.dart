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
    "accountListBtnCreate" : MessageLookupByLibrary.simpleMessage("创建钱包"),
    "accountListBtnImport" : MessageLookupByLibrary.simpleMessage("导入钱包"),
    "accountListTitle" : MessageLookupByLibrary.simpleMessage("钱包管理"),
    "accountManagerActionLine1" : MessageLookupByLibrary.simpleMessage("备份助记词"),
    "accountManagerActionLine2" : MessageLookupByLibrary.simpleMessage("备份keyStore"),
    "accountManagerActionLine3" : MessageLookupByLibrary.simpleMessage("备份私钥"),
    "accountManagerAddress" : MessageLookupByLibrary.simpleMessage("钱包地址"),
    "accountManagerDelete" : MessageLookupByLibrary.simpleMessage("删除钱包"),
    "accountManagerSnackBar" : MessageLookupByLibrary.simpleMessage("地址复制成功"),
    "accountManagerTitle" : MessageLookupByLibrary.simpleMessage("管理钱包"),
    "appMainContainerNavBarAccount" : MessageLookupByLibrary.simpleMessage("我的"),
    "appMainContainerNavBarWallet" : MessageLookupByLibrary.simpleMessage("钱包"),
    "appMainContainerOutdateBtn" : MessageLookupByLibrary.simpleMessage("去更新"),
    "appMainContainerOutdateText" : MessageLookupByLibrary.simpleMessage("必须更新才能继续使用本软件"),
    "backupAccountCopy" : MessageLookupByLibrary.simpleMessage("复制"),
    "backupAccountDescKeystore" : MessageLookupByLibrary.simpleMessage("Keystore文件是加密后的私钥，请复制并妥善保存在安全的地方，一旦丢失，无法找回。以下是钱包的Keystore文件。"),
    "backupAccountDescMnemonic" : MessageLookupByLibrary.simpleMessage("助记词即是私钥，由12~24个单词组成,你可以通过助记词恢复你的资产,为了你的资产安全，请务必将在抄写并存放至安全位置,助记词一旦丢失，不可找回。"),
    "backupAccountDescPrivatekey" : MessageLookupByLibrary.simpleMessage("助记词即是私钥，由12~24个单词组成,你可以通过助记词恢复你的资产,为了你的资产安全，请务必将在抄写并存放至安全位置,助记词一旦丢失，不可找回。"),
    "backupAccountSnackbar" : MessageLookupByLibrary.simpleMessage("复制成功"),
    "backupAccountTitle" : MessageLookupByLibrary.simpleMessage("备份 "),
    "backupAccountTitleKeystore" : MessageLookupByLibrary.simpleMessage("keystore"),
    "backupAccountTitleMnemonic" : MessageLookupByLibrary.simpleMessage("助记词"),
    "backupAccountTitlePrivatekey" : MessageLookupByLibrary.simpleMessage("私钥"),
    "backupMnemonicAppBar" : MessageLookupByLibrary.simpleMessage("备份助记词"),
    "backupMnemonicErr" : MessageLookupByLibrary.simpleMessage("出错:"),
    "backupMnemonicSafeAreaCancel" : MessageLookupByLibrary.simpleMessage("取消"),
    "backupMnemonicSafeAreaConfirm" : MessageLookupByLibrary.simpleMessage("我已抄写完毕"),
    "backupMnemonicSafeAreaInfo1" : MessageLookupByLibrary.simpleMessage("• 助记词即是私钥，由12~24个单词组成"),
    "backupMnemonicSafeAreaInfo2" : MessageLookupByLibrary.simpleMessage("• 你可以通过助记词恢复你的资产"),
    "backupMnemonicSafeAreaInfo3" : MessageLookupByLibrary.simpleMessage("• 为了你的资产安全，请务必在抄写并存放至安全位置"),
    "backupMnemonicSafeAreaInfo4" : MessageLookupByLibrary.simpleMessage("• 助记词一旦丢失，不可找回"),
    "backupMnemonicSafeAreaText1" : MessageLookupByLibrary.simpleMessage("请按照顺序正确抄写并存放至安全位置"),
    "configTermsUrl" : MessageLookupByLibrary.simpleMessage("https://ruffchain.com/wallet/terms.html"),
    "confirmDialogCancel" : MessageLookupByLibrary.simpleMessage("取消"),
    "confirmDialogConfirm" : MessageLookupByLibrary.simpleMessage("确定"),
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
    "inputPasswordDlgCancel" : MessageLookupByLibrary.simpleMessage("取消"),
    "inputPasswordDlgConfirm" : MessageLookupByLibrary.simpleMessage("确定"),
    "inputPasswordDlgEmpty" : MessageLookupByLibrary.simpleMessage("密码不能为空"),
    "inputPasswordDlgText" : MessageLookupByLibrary.simpleMessage("请输入钱包密码"),
    "inputPasswordDlgWrong" : MessageLookupByLibrary.simpleMessage("密码错误"),
    "loadingTransferText" : MessageLookupByLibrary.simpleMessage("\n请等待20~40秒\n交易提交执行中"),
    "mineAboutAppBar" : MessageLookupByLibrary.simpleMessage("关于我们"),
    "mineAboutSafeAreaVersionLog" : MessageLookupByLibrary.simpleMessage("版本日志"),
    "mineAboutSafeAreaVersionUpdate" : MessageLookupByLibrary.simpleMessage("版本更新"),
    "mineAboutUs" : MessageLookupByLibrary.simpleMessage("关于我们"),
    "mineAboutUsCurVersion" : MessageLookupByLibrary.simpleMessage("当前版本"),
    "mineAboutUsLatestVersion" : MessageLookupByLibrary.simpleMessage("最新版本"),
    "mineAboutUsTitle" : MessageLookupByLibrary.simpleMessage("检测到新版本"),
    "mineAboutUsToUpdate" : MessageLookupByLibrary.simpleMessage("去更新？"),
    "mineAboutUsUpdated" : MessageLookupByLibrary.simpleMessage("当前已经是最新版本"),
    "mineCommunityListTitle" : MessageLookupByLibrary.simpleMessage("加入社区"),
    "mineHelpCenter" : MessageLookupByLibrary.simpleMessage("帮助中心"),
    "mineJoin" : MessageLookupByLibrary.simpleMessage("加入社区"),
    "mineVersion1001" : MessageLookupByLibrary.simpleMessage("支持创建钱包和导入钱包"),
    "mineVersion1002" : MessageLookupByLibrary.simpleMessage("支持备份钱包"),
    "mineVersion1003" : MessageLookupByLibrary.simpleMessage("支持RUFF转账"),
    "mineVersion110" : MessageLookupByLibrary.simpleMessage("地址添加前缀 ruff"),
    "mineVersion120" : MessageLookupByLibrary.simpleMessage("修复：转账金额小数点后位数过多时失败的问题"),
    "mineVersion121" : MessageLookupByLibrary.simpleMessage("修复：地址有效性验证的问题"),
    "mineVersion122" : MessageLookupByLibrary.simpleMessage("修复: English 版本"),
    "mineVersion123" : MessageLookupByLibrary.simpleMessage("修复: App name"),
    "mineVersion124" : MessageLookupByLibrary.simpleMessage("修复: ios input text paste issue"),
    "mineVersionLogTitle" : MessageLookupByLibrary.simpleMessage("版本日志"),
    "mineVersionVer" : MessageLookupByLibrary.simpleMessage("版本"),
    "receiveTokenQRCode" : MessageLookupByLibrary.simpleMessage("扫描二维码向我转账"),
    "receiveTokenSnackBar" : MessageLookupByLibrary.simpleMessage("复制地址成功"),
    "receiveTokenTitle" : MessageLookupByLibrary.simpleMessage("收款"),
    "termsAgree" : MessageLookupByLibrary.simpleMessage("同意"),
    "termsAgreeConfirm" : MessageLookupByLibrary.simpleMessage("我已仔细阅读并同意以上协议"),
    "termsPrimary" : MessageLookupByLibrary.simpleMessage("加载失败，点击重试"),
    "title" : MessageLookupByLibrary.simpleMessage("Ruff钱包"),
    "transferTokenConfirmModalClose" : MessageLookupByLibrary.simpleMessage("关闭"),
    "transferTokenConfirmModalContent" : MessageLookupByLibrary.simpleMessage("交易成功! Hash值："),
    "transferTokenConfirmModalTitle" : MessageLookupByLibrary.simpleMessage("交易已确认"),
    "transferTokenEnter" : MessageLookupByLibrary.simpleMessage("请输入"),
    "transferTokenEnterAmount" : MessageLookupByLibrary.simpleMessage("请输入数量"),
    "transferTokenEnterValid" : MessageLookupByLibrary.simpleMessage("请输入有效的数字"),
    "transferTokenErrGasfee" : MessageLookupByLibrary.simpleMessage("请输入≥0.1的Gasfee"),
    "transferTokenErrPrecision" : MessageLookupByLibrary.simpleMessage("Token精度输入最多9位"),
    "transferTokenFormAddressHelper" : MessageLookupByLibrary.simpleMessage("请输入收款地址 "),
    "transferTokenFormAddressLabel" : MessageLookupByLibrary.simpleMessage("收款地址 "),
    "transferTokenFormGasHelper" : MessageLookupByLibrary.simpleMessage("请输入 ≥ 0.1的矿工费用"),
    "transferTokenFormTokenHelper" : MessageLookupByLibrary.simpleMessage("请输入转账数量"),
    "transferTokenFormTokenLabel" : MessageLookupByLibrary.simpleMessage("Token 数量 "),
    "transferTokenInvalidAddr" : MessageLookupByLibrary.simpleMessage("收款地址无效，请重新输入"),
    "transferTokenScanAccessErr" : MessageLookupByLibrary.simpleMessage("相机访问出错"),
    "transferTokenScanDenied" : MessageLookupByLibrary.simpleMessage("请在手机设置中开启应用的相机权限，才能正常使用扫码功能。"),
    "transferTokenScanErr" : MessageLookupByLibrary.simpleMessage("出错 "),
    "transferTokenStart" : MessageLookupByLibrary.simpleMessage("开始转账"),
    "transferTokenTransfer" : MessageLookupByLibrary.simpleMessage("RUFF 转账 "),
    "transferTokenUnconfirmModalClose" : MessageLookupByLibrary.simpleMessage("关闭"),
    "transferTokenUnconfirmModalContent" : MessageLookupByLibrary.simpleMessage("交易发送成功，但是在短时间内还没获取到交易成功执行的信息，请自行确认交易是否被链执行。交易Hash值："),
    "transferTokenUnconfirmModalCopy" : MessageLookupByLibrary.simpleMessage("复制Hash "),
    "transferTokenUnconfirmModalCopyOK" : MessageLookupByLibrary.simpleMessage("复制成功 "),
    "transferTokenUnconfirmModalTitle" : MessageLookupByLibrary.simpleMessage("交易待确认"),
    "txHistoryDetailAmount" : MessageLookupByLibrary.simpleMessage("交易金额"),
    "txHistoryDetailBlock" : MessageLookupByLibrary.simpleMessage("交易所在区块"),
    "txHistoryDetailCaller" : MessageLookupByLibrary.simpleMessage("发起人"),
    "txHistoryDetailCopyOK" : MessageLookupByLibrary.simpleMessage("复制成功"),
    "txHistoryDetailGasFee" : MessageLookupByLibrary.simpleMessage("矿工费用"),
    "txHistoryDetailHash" : MessageLookupByLibrary.simpleMessage("交易Hash"),
    "txHistoryDetailMethod" : MessageLookupByLibrary.simpleMessage("交易方法"),
    "txHistoryDetailReceiver" : MessageLookupByLibrary.simpleMessage("收款人"),
    "txHistoryDetailTime" : MessageLookupByLibrary.simpleMessage("交易时间"),
    "txHistoryDetailTitle" : MessageLookupByLibrary.simpleMessage("交易详情"),
    "txHistoryIndexTabAll" : MessageLookupByLibrary.simpleMessage("全部"),
    "txHistoryIndexTabReceive" : MessageLookupByLibrary.simpleMessage("收款"),
    "txHistoryIndexTabTransfer" : MessageLookupByLibrary.simpleMessage("转账"),
    "txHistoryIndexTitle" : MessageLookupByLibrary.simpleMessage("交易历史"),
    "txHistoryListLoading" : MessageLookupByLibrary.simpleMessage("加载完毕"),
    "txHistoryListNone" : MessageLookupByLibrary.simpleMessage("暂无信息"),
    "txHistoryListTitle" : MessageLookupByLibrary.simpleMessage("网络不稳定，请重新再试"),
    "walletHeaderBarPayment" : MessageLookupByLibrary.simpleMessage("转账"),
    "walletHeaderBarReceive" : MessageLookupByLibrary.simpleMessage("收款"),
    "walletHeaderBarTransaction" : MessageLookupByLibrary.simpleMessage("交易"),
    "walletListEmpty" : MessageLookupByLibrary.simpleMessage("资产列表为空"),
    "walletSnackBar" : MessageLookupByLibrary.simpleMessage("请检查网络连接")
  };
}
