import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ruff_wallet/common/chain_utils.dart';
import 'package:ruff_wallet/common/theme_data.dart';
import 'package:ruff_wallet/pages/mine/about_us.dart';
import 'package:ruff_wallet/pages/account_list.dart';
import 'package:ruff_wallet/pages/backup_account.dart';
import 'package:ruff_wallet/pages/mine/community_list.dart';
import 'package:ruff_wallet/pages/mine/version_log.dart';
import 'package:ruff_wallet/pages/receive_token.dart';
import 'package:ruff_wallet/pages/terms.dart';
import 'package:ruff_wallet/pages/account_manager.dart';
import 'package:ruff_wallet/pages/transaction_history/detail.dart';
import 'package:ruff_wallet/pages/transaction_history/index.dart';
import 'package:ruff_wallet/pages/transfer_token.dart';

import 'pages/splash.dart';
import 'pages/init_wallet.dart';
import 'pages/create_wallet.dart';
import 'pages/import_wallet.dart';
import 'pages/backup_mnemonic.dart';
import 'pages/app_main_container.dart';

void main() {
  JsChainLib.init();
  runApp(MyApp());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: genThemeData(),
      title: 'Ruff Wallet',
      routes: {
        '/': (_) => const SplashPage(),
        SplashPage.routeName: (_) => const SplashPage(),
        TermsPage.routeName: (_) => const TermsPage(),
        InitWalletPage.routeName: (_) => const InitWalletPage(),
        CreateWalletPage.routeName: (_) => const CreateWalletPage(),
        BackupMnemonicPage.routeName: (_) => const BackupMnemonicPage(),
        ImportWalletPage.routeName: (_) => const ImportWalletPage(),
        AppMainContainer.routeName: (_) => const AppMainContainer(),
        AccountListPage.routeName: (_) => const AccountListPage(),
        AccountManagerPage.routeName: (_) => const AccountManagerPage(),
        BackupAccountPage.routeName: (_) => const BackupAccountPage(),
        TransferTokenPage.routeName: (_) => const TransferTokenPage(),
        ReceiveTokenPage.routeName: (_) => const ReceiveTokenPage(),
        TransactionHistoryPage.routeName: (_) => const TransactionHistoryPage(),
        TransactionDetailPage.routeName: (_) => const TransactionDetailPage(),
        CommunityListPage.routeName: (_) => const CommunityListPage(),
        AboutUsPage.routeName: (_) => const AboutUsPage(),
        VersionLogPage.routeName: (_) => const VersionLogPage(),
      },
    );
  }
}
