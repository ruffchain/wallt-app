import 'package:flutter/material.dart';
import 'package:ruff_wallet/pages/transaction_history/list.dart';
import '../../common/app_localizations.dart';

enum TransactionType {
  all,
  transfer,
  receiveToken,
}

class TransactionHistoryPage extends StatefulWidget {
  static String routeName = 'TransactionHistoryPage';

  const TransactionHistoryPage({Key key}) : super(key: key);

  _TransactionHistoryPageState createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  var _showTxType = TransactionType.all;
  Set<TransactionType> _initedViews = Set();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      vsync: this,
      length: TransactionType.values.length,
      initialIndex: _showTxType.index,
    );
    _initedViews.add(TransactionType.all);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _selectType(int index) {
    setState(() {
      _showTxType = TransactionType.values[index];
      _initedViews.add(_showTxType);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).txHistoryIndexTitle),
        centerTitle: true,
        bottom: TabBar(
          indicatorColor: Colors.white54,
          tabs: [
            Tab(text: AppLocalizations.of(context).txHistoryIndexTabAll),
            Tab(text: AppLocalizations.of(context).txHistoryIndexTabTransfer),
            Tab(text: AppLocalizations.of(context).txHistoryIndexTabReceive),
          ],
          onTap: _selectType,
          controller: _tabController,
        ),
      ),
      body: Stack(
        children: <Widget>[
          _buildItem(TransactionType.all),
          _buildItem(TransactionType.transfer),
          _buildItem(TransactionType.receiveToken),
        ],
      ),
    );
  }

  _buildItem(TransactionType type) {
    Widget child = Container();
    if (_initedViews.contains(type)) {
      String adderss = ModalRoute.of(context).settings.arguments;
      child = TransactionListView(
        type: type,
        address: adderss,
      );
    }
    return Offstage(
      offstage: _showTxType != type,
      child: child,
    );
  }
}
