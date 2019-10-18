import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ruff_wallet/common/chain_info_api.dart';
import 'package:ruff_wallet/common/constant.dart';
import 'package:ruff_wallet/model/user_token.dart';
import 'package:ruff_wallet/pages/account_list.dart';
import 'package:ruff_wallet/pages/receive_token.dart';
import 'package:ruff_wallet/pages/transaction_history/index.dart';
import 'package:ruff_wallet/pages/transfer_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _address = '';
  String _sysCount = '';
  bool _loading = true;
  List<UserToken> _tokenList = [];

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {
    var prefs = await SharedPreferences.getInstance();
    var address = prefs.getString(PreferencesKeys.activeWalletAddress);
    setState(() {
      _address = address;
      _sysCount = ' - ';
    });
    await Future.delayed(Duration.zero);
    _refreshIndicatorKey.currentState.show();
  }

  Future _updateData() async {
    try {
      setState(() {
        _loading = true;
      });
      var tokenRes = await ChainInfoApi.getTokensByAddress(_address);
      List<UserToken> tokenList = json
          .decode(tokenRes)
          .cast<Map<String, dynamic>>()
          .map<UserToken>((json) => UserToken.fromJson(json))
          .toList();
      int ruffIndex = tokenList.indexWhere((item) => item.name == 'RUFF');

      if (ruffIndex < 0) {
        ruffIndex = 0;
        tokenList.insert(0, UserToken(name: 'RUFF', type: '', value: 0.0));
      }

      var sysCount = tokenList.elementAt(ruffIndex).value;
      setState(() {
        _tokenList = tokenList;
        _sysCount = sysCount.toString();
      });
    } catch (e) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('请检查网络连接'),
          duration: Duration(milliseconds: 2000),
        ),
      );
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  _viewAccountList() async {
    var res = await Navigator.of(context).pushNamed(AccountListPage.routeName);
    String address = res as String;
    if (address == null) {
      var prefs = await SharedPreferences.getInstance();
      address = prefs.getString(PreferencesKeys.activeWalletAddress);
    }
    if (address != null && address.isNotEmpty && address != _address) {
      setState(() {
        _sysCount = '-';
        _address = address;
      });
      _refreshIndicatorKey.currentState.show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          _header(),
          _assetList(),
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2.0,
          ),
        ],
      ),
      child: SafeArea(
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.white),
          child: Column(
            children: <Widget>[
              _headerTop(),
              _headerToolBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerTop() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              bottom: 5,
            ),
            child: Row(
              children: [
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'RuffChain',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _viewAccountList,
                  child: Icon(
                    Icons.account_balance_wallet,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
          SizedBox(height: 0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_address),
                SizedBox(height: 2),
                Text(
                  _sysCount + ' RUFF',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2),
        ],
      ),
    );
  }

  Widget _headerToolBar() {
    return Row(
      children: <Widget>[
        _buildToolBarItem(
          '转账',
          icon: Icons.payment,
          onTap: () {
            Navigator.of(context).pushNamed(TransferTokenPage.routeName);
          },
        ),
        _toolBarDivider(),
        _buildToolBarItem(
          '收款',
          icon: Icons.local_atm,
          onTap: () {
            Navigator.of(context).pushNamed(
              ReceiveTokenPage.routeName,
              arguments: _address,
            );
          },
        ),
        _toolBarDivider(),
        _buildToolBarItem(
          '交易',
          icon: Icons.unfold_less,
          onTap: () {
            Navigator.of(context).pushNamed(
              TransactionHistoryPage.routeName,
              arguments: _address,
            );
          },
        ),
      ],
    );
  }

  Widget _buildToolBarItem(
    String text, {
    IconData icon,
    GestureTapCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Column(
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
                size: 26,
              ),
              SizedBox(height: 4),
              Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _toolBarDivider() {
    return Container(
      width: 0.0,
      height: 30,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.white70,
            width: 0,
          ),
        ),
      ),
    );
  }

  Widget _assetList() {
    return Expanded(
      child: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _updateData,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 12,
          ),
          itemCount: _tokenList.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (_tokenList.isEmpty)
              return _loading
                  ? Container()
                  : Container(
                      padding: EdgeInsets.only(
                        top: 120,
                      ),
                      child: Center(
                        child: Text(
                          '资产列表为空',
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    );
            if (index == _tokenList.length) return Container();
            var token = _tokenList[index];
            return Container(
              margin: EdgeInsets.symmetric(
                vertical: 6,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      token.name,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Text(
                    token.value.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
