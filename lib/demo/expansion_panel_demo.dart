import 'package:flutter/material.dart';

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int panelIndex, bool isExpanded) {
                setState(() {
                  _isExpanded = !isExpanded;
                  debugPrint('index: $panelIndex, 展开 $_isExpanded');
                });
              },
              children: [
                //? 每个面板需要一个头部, 一个主题, 和一个表示收缩状态的属性
                ExpansionPanel(
                  //? 头部
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Panel A',
                        style: Theme.of(context).textTheme.title,
                      ),
                    );
                  },
                  //? 内容
                  body: Container(
                    padding: EdgeInsets.all(16.0),
                    width: double.infinity,
                    child: Text('Content for Panel A'),
                  ),
                  //? 收缩属性
                  isExpanded: _isExpanded

                )
              ],
            )
          ],
        ),
      ),
    );
  }
}