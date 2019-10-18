import 'package:flutter/material.dart';
import 'package:ruff_wallet/common/chain_info_api.dart';
import 'package:ruff_wallet/common/utils.dart';
import 'package:ruff_wallet/components/confirm_dialog.dart';
import 'package:ruff_wallet/pages/transaction_history/detail.dart';
import 'package:ruff_wallet/pages/transaction_history/index.dart';
import 'package:date_format/date_format.dart';

class TransactionListView extends StatefulWidget {
  final TransactionType type;
  final String address;
  const TransactionListView({
    Key key,
    this.type,
    this.address,
  }) : super(key: key);

  _TransactionListViewState createState() => _TransactionListViewState();
}

class _TransactionListViewState extends State<TransactionListView> {
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  ScrollController _scrollController;
  List<Map> _txs = [];
  int _page = 1;
  int _pageSize = 20;
  bool _isPullUpLoadMore = false;
  bool _noMore = false;
  bool _initFetchDone = false;
  bool _isFetching = false;

  @override
  void initState() {
    print(widget.address);
    super.initState();
    Future.delayed(Duration.zero).then((res) {
      _isPullUpLoadMore = false;
      _refreshIndicatorKey.currentState.show();
    });
  }

  Future _fetchData() async {
    try {
      if (_isFetching) return;
      setState(() {
        _isFetching = true;
      });
      bool isPullDownRefresh = !_isPullUpLoadMore;
      if (isPullDownRefresh) {
        _page = 1;
        _noMore = false;
      }
      _isPullUpLoadMore = false; //clean

      Map res = await ChainInfoApi.getTxsByAddress(
        type: widget.type,
        address: widget.address,
        page: _page,
        pageSize: _pageSize,
      );
      _initFetchDone = true;
      List<Map> data = res['data'].cast<Map>().toList();
      int total = res['total'];
      if (total < _page * _pageSize) {
        _noMore = true;
      }
      if (isPullDownRefresh) {
        _txs = data;
      } else {
        _txs.addAll(data);
      }
      _page++;
    } catch (e) {
      print(e);
      showModal(
        title: '网络不稳定，请重新再试',
        context: context,
        showCancel: false,
      );
    } finally {
      _isFetching = false;
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _fetchData,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          itemCount: _txs.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (!_initFetchDone) return Container();
            if (_txs.isEmpty)
              return _isFetching
                  ? Container()
                  : Container(
                      padding: EdgeInsets.only(
                        top: 120,
                      ),
                      child: Center(
                        child: Text(
                          '暂无信息',
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    );

            var reachBottom = index == _txs.length;
            if (reachBottom) {
              if (_noMore) return _noMoreView();
              if (!_isFetching) {
                _isPullUpLoadMore = true;
                _refreshIndicatorKey.currentState.show(atTop: false);
              }
              return Container(height: 60);
            }
            return _buildListItem(index);
          },
        ),
      ),
    );
  }

  Widget _noMoreView() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Center(
        child: Text('加载完毕'),
      ),
    );
  }

  Widget _buildListItem(int index) {
    Map tx = _txs.elementAt(index);
    Map txContent = tx['content'];
    var ms = tx['timestamp'] * 1000;
    var time = DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          TransactionDetailPage.routeName,
          arguments: tx,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Color(0x20000000),
              width: 0,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(shortHash(tx['hash'])),
                  Text(
                    formatDate(
                      time.toLocal(),
                      [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss, z],
                    ),
                  ),
                ],
              ),
            ),
            if (txContent['method'] == 'transferTo')
              Text(txContent['value'] + ' RUFF'),
          ],
        ),
      ),
    );
  }
}
