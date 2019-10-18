import 'package:flutter/material.dart';
import 'package:ruff_wallet/common/constant.dart';

showModal({
  @required BuildContext context,
  String title,
  String content,
  bool showCancel = true,
  String cancelText = '取消',
  String confirmText = "确定",
  bool autoClose = true,
  Function confirm,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => Center(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (title != null)
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              if (content != null)
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                  width: double.infinity,
                  child: Text(
                    content,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      onPressed: () async {
                        if (autoClose) Navigator.of(context).pop();
                        if (confirm != null) confirm(true);
                      },
                      child: Text(
                        confirmText,
                        style: TextStyle(
                          color: AppPrimaryColor,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  if (showCancel) ...[
                    Container(
                      width: 1,
                      height: 22,
                      color: Colors.black12,
                    ),
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          if (autoClose) Navigator.of(context).pop();
                          if (confirm != null) confirm(false);
                        },
                        child: Text(
                          cancelText,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
