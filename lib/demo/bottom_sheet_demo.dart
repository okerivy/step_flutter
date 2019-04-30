import 'package:flutter/material.dart';
import 'package:step_flutter/Route/semi_transparent.dart';
import 'package:step_flutter/demo/bottom_sheet_fix.dart';
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
          height: 500.0,
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

  
  Future _showSignupModalSheet() async { 
        
    // Fixme: showModalBottomSheetApp 点击背景能取消吗

    final option = await showModalBottomSheetApp(
      context: context,
      dismissOnTap: true, //? 是否要点击下面白色背景 消失
      dismissOnTapBarrier: true, //? 是否要点击 上面半透明背景 消失
      enableDrag: true, //? 是否允许 拖拽关闭
      resizeToAvoidBottomPadding: true, //? 好像是计算底部的工具栏
      bottomSheetBarrierColor: Colors.yellow.withOpacity(0.5), //? 上面背景颜色
      bottomSheetDuration: Duration(milliseconds: 500), //? 动画时间
      bottomSheetBgColor: Colors.red.withOpacity(0.5), //? 下面背景颜色
      isTransparency: false, //? 是否透明
      builder: (BuildContext context) {
        return SheetStackDemo();
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
              child: Text('Modal BottomSheet 系统 9/16'),
              onPressed: _openModalBottomSheet,
            ),
            SizedBox(width: 16.0),
            FlatButton(
              child: Text('Full Modal BottomSheet 改写系统->全屏'),
              onPressed: _openFullModalBottomSheet,
            ),
            SizedBox(width: 16.0),
            FlatButton(
              child: Text('Modal BottomSheet 全屏 别人写的'),
              onPressed: _showSignupModalSheet,
            ),
            SizedBox(width: 16.0),
            FlatButton(
              child: Text('透明的 Route'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TransparentTestPage()),
                );
              },
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


//? 普通的一个 Container 透明
class SheetContainDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Fixme: 这个颜色 怎么设置成 半透明
      // color: Colors.lightGreen.withOpacity(0.5),
      height: 400.0,
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
}

//? 让背景图片也透明
class SheetStackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.withOpacity(0.3),
      margin: EdgeInsets.all(16.0),
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.5,
            child: Container(
              // Fixme: 这个颜色 怎么设置成 半透明
              // color: Colors.blue.withOpacity(0.5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://resources.ninghao.org/images/say-hello-to-barry.jpg'),
                  alignment: Alignment.topCenter,
                  // repeat: ImageRepeat.repeatY, 
                  fit: BoxFit.cover, 
                  
                  colorFilter: ColorFilter.mode(
                    Colors.indigoAccent[400].withOpacity(0.5), //? 滤镜的颜色
                    BlendMode.hardLight, //? 滤镜的混合模式
                  )
                ),
              ),
              margin: EdgeInsets.all(16.0),
              height: 400.0,
            ),
          ),
          Container(
            // Fixme: 这个颜色 怎么设置成 半透明
            // color: Colors.blue.withOpacity(0.5),
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: NetworkImage('https://resources.ninghao.org/images/say-hello-to-barry.jpg'),
            //     alignment: Alignment.topCenter,
            //     // repeat: ImageRepeat.repeatY, 
            //     fit: BoxFit.cover, 
                
            //     colorFilter: ColorFilter.mode(
            //       Colors.indigoAccent[400].withOpacity(0.5), //? 滤镜的颜色
            //       BlendMode.hardLight, //? 滤镜的混合模式
            //     )
            //   ),
            // ),
            margin: EdgeInsets.all(32.0),
            height: 400.0,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.blue.withOpacity(1),
                  height: 100,
                  child: ListTile(
                    title: Text('Option A'),
                    onTap: () {
                      Navigator.pop(context, 'A');
                    },
                  ),
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
          ),
        ],
      ),
    );
  }
}
