import 'package:flutter/material.dart';
import 'package:step_flutter/demo/button_demo.dart';
import 'package:step_flutter/demo/checkbox_demo.dart';
import 'package:step_flutter/demo/datetime_demo.dart';
import 'package:step_flutter/demo/floating_action_button_demo.dart';
import 'package:step_flutter/demo/form_demo.dart';
import 'package:step_flutter/demo/popup_menu_button_demo.dart';
import 'package:step_flutter/demo/radio_demo.dart';
import 'package:step_flutter/demo/simple_dialog_demo.dart';
import 'package:step_flutter/demo/slider_demo.dart';
import 'package:step_flutter/demo/switch_demo.dart';

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
          MCListItem(title: 'SimpleDialog 对话框', page: SimpleDialogDemo(),),
          MCListItem(title: 'DateTime 日期选择器', page: DateTimeDemo(),),
          MCListItem(title: 'Slider 滑动选择器', page: SliderDemo(),),
          MCListItem(title: 'Switch 开关', page: SwitchDemo(),),
          MCListItem(title: 'Radio 单选框', page: RadioDemo(),),
          MCListItem(title: 'Checkbox 复选框', page: CheckboxDemo(),),
          MCListItem(title: 'Form 表单', page: FormDemo(),),
          MCListItem(title: 'PopupMenuButton 弹出菜单', page: PopupMenuButtonDemo(),),
          MCListItem(title: 'Button 各种按钮', page: ButtonDemo(),),
          MCListItem(title: 'FloatingActionButton 浮动按钮', page: FloatingActionButtonDemo(),)
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