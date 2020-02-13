import 'package:flutter/material.dart';
import 'package:ruff_wallet/common/constant.dart';
import 'package:ruff_wallet/common/utils.dart';
import 'package:ruff_wallet/components/button.dart';
import 'package:ruff_wallet/pages/account_manager.dart';
import 'package:ruff_wallet/pages/create_wallet.dart';
import 'package:ruff_wallet/pages/import_wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountListPage extends StatefulWidget {
  static const String routeName = 'AccountList';
  const AccountListPage({Key key}) : super(key: key);

  @override
  _AccountListPageState createState() => _AccountListPageState();
}

class _AccountListPageState extends State<AccountListPage> {
  String _activeWalletAddress;
  List<String> _addressList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future _loadData() async {
    var prefs = await SharedPreferences.getInstance();
    var activeWalletAddress =
        prefs.getString(PreferencesKeys.activeWalletAddress) ?? '';
    var addressList = prefs.getStringList(PreferencesKeys.addressList);

    setState(() {
      _activeWalletAddress = activeWalletAddress;
      _addressList = addressList;
    });
  }

  Future _activeAddrss(String address) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(PreferencesKeys.activeWalletAddress, address);
    setState(() {
      _activeWalletAddress = address;
    });
    Navigator.of(context).pop(address);
  }

  _manageAddrss(String address) async {
    await Navigator.of(context).pushNamed(
      AccountManagerPage.routeName,
      arguments: address,
    );
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('钱包管理'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                itemCount: _addressList.length,
                itemBuilder: (BuildContext context, int index) {
                  var address = _addressList.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      _activeAddrss(address);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 10,
                        right: 0,
                        bottom: 10,
                        left: 10,
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        border: _activeWalletAddress == address
                            ? Border.all(
                                color: AppPrimaryColor,
                                width: 0,
                              )
                            : null,
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(addAddressPrefix(address)),
                          ),
                          IconButton(
                            padding: const EdgeInsets.all(0),
                            iconSize: 16,
                            color: Colors.black87,
                            onPressed: () {
                              _manageAddrss(address);
                            },
                            icon: Icon(Icons.more_vert),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: mySecondaryButton(
                      '创建钱包',
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(CreateWalletPage.routeName);
                      },
                    ),
                  ),
                  Container(
                    width: 15,
                  ),
                  Expanded(
                    child: myPrimaryButton(
                      '导入钱包',
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ImportWalletPage.routeName);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
