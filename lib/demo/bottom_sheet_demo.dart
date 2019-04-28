import 'package:flutter/material.dart';
import 'dart:async';
import 'package:step_flutter/demo/full_bottom_sheet.dart';



class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  //? BottomSheet 是中屏幕底部滑动显示出来的一个东西
  //? 一般触发显示 BottomSheet ,可以使用 ScaffoldState 的 showBottomSheet 方法
  //? 要使用这个方法, 一般我们可以创建一个 GlobleKey, 用它可以引用那个对应的 Scaffold

  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  _openBottomSheetWithKey() {
    
    // Fixme: 为什么  showBottomSheet 一定要用 _bottomSheetScaffoldKey
    //? showBottomSheet 为啥不能直接调用 

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
  
  
  _openBottomSheetNoKey() {

    // Fixme: 为什么  showBottomSheet 一定要用 _bottomSheetScaffoldKey
    //? showBottomSheet 为啥不能直接调用 
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomAppBar(
          child: Container(
            height: 490.0,
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
      }
    );
  }

  Future _openModalBottomSheet() async {
    // Fixme: maxHeight: constraints.maxHeight * 9.0 / 16.0  怎么设置成全屏
    final option = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 600.0,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('Option A'),
                onTap: () {
                  Navigator.pop(context, 'A');
                },
              ),
              ListTile(
                title: Text('Option B'),
                onTap: () {
                  Navigator.pop(context, 'B');
                },
              ),
              ListTile(
                title: Text('Option C'),
                onTap: () {
                  Navigator.pop(context, 'C');
                },
              ),
            ],
          ),
        );
      }
    );

    debugPrint(option);
  }
  
  Future _openFullModalBottomSheet() async {
    // Fixme: maxHeight: constraints.maxHeight * 9.0 / 16.0  怎么设置成全屏
    
    final option = await showModalFullBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 1600.0,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('Option A'),
                onTap: () {
                  Navigator.pop(context, 'A');
                },
              ),
              ListTile(
                title: Text('Option B'),
                onTap: () {
                  Navigator.pop(context, 'B');
                },
              ),
              ListTile(
                title: Text('Option C'),
                onTap: () {
                  Navigator.pop(context, 'C');
                },
              ),
            ],
          ),
        );
      }
    );

    debugPrint(option);
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
            FlatButton(
              child: Text('Open BottomSheet with Key'),
              onPressed: _openBottomSheetWithKey,
            ),
            SizedBox(width: 16.0),
            FlatButton(
              child: Text('Open BottomSheet no Key = error'),
              onPressed: _openBottomSheetNoKey,
            ),
            SizedBox(width: 16.0),
            FlatButton(
              child: Text('Modal BottomSheet 系统9/16'),
              onPressed: _openModalBottomSheet,
            ),
            SizedBox(width: 16.0),
            FlatButton(
              child: Text('Full Modal BottomSheet 全屏'),
              onPressed: _openFullModalBottomSheet,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Text('BottomSheetDemo 文本'),
                // SizedBox(width: 16.0),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}