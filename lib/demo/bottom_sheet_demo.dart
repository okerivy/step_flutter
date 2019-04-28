import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  //? BottomSheet 是中屏幕底部滑动显示出来的一个东西
  //? 一般触发显示 BottomSheet ,可以使用 ScaffoldState 的 showBottomSheet 方法
  //? 要使用这个方法, 一般我们可以创建一个 GlobleKey, 用它可以引用那个对应的 Scaffold

  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  _openBottomSheet() {
    _bottomSheetScaffoldKey
      .currentState
      .showBottomSheet((BuildContext context) {
        return BottomAppBar(
          child: Container(
            height: 90.0,
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.pause_circle_outline),
                SizedBox(width: 16.0),
                Text('01:30 / 03:30'),
                Expanded(
                  child: Text('Fix you -coldplay', textAlign: TextAlign.right,),
                )
              ],
            ),
          ),
        );
      });
  }
  
  _openModalBottomSheet() {
    // Fixme: maxHeight: constraints.maxHeight * 9.0 / 16.0  怎么设置成全屏
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('Option A'),
              ),
              ListTile(
                title: Text('Option B'),
              ),
              ListTile(
                title: Text('Option C'),
              ),
            ],
          ),
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text('BottomSheetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Text('BottomSheetDemo 文本'),
                // SizedBox(width: 16.0),
                FlatButton(
                  child: Text('Open BottomSheet'),
                  onPressed: _openBottomSheet,
                ),
                SizedBox(width: 16.0),
                FlatButton(
                  child: Text('Modal BottomSheet'),
                  onPressed: _openModalBottomSheet,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}