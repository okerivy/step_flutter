import 'package:flutter/material.dart';
import 'package:step_flutter/demo/button_demo.dart';
import 'package:step_flutter/demo/floating_action_button_demo.dart';
import 'package:step_flutter/demo/popup_menu_button_demo.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          MCListItem(title: 'PopupMenuButton', page: PopupMenuButtonDemo(),),
          MCListItem(title: 'Button', page: ButtonDemo(),),
          MCListItem(title: 'FloatingActionButton', page: FloatingActionButtonDemo(),)
        ],
      ),
    );
  }
}



class _WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
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
                
              ],
            )
          ],
        ),
      ),
    );
  }
}


class MCListItem extends StatelessWidget {
  final String title;
  final Widget page;

  MCListItem({
    this.title,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page)
        );
      },
    );
  }
}