import 'package:flutter/material.dart';
import 'package:step_flutter/demo/alert_dialog_demo.dart';
import 'package:step_flutter/demo/bottom_sheet_demo.dart';
import 'package:step_flutter/demo/button_demo.dart';
import 'package:step_flutter/demo/card_demo.dart';
import 'package:step_flutter/demo/checkbox_demo.dart';
import 'package:step_flutter/demo/chip_demo.dart';
import 'package:step_flutter/demo/data_table_demo.dart';
import 'package:step_flutter/demo/datetime_demo.dart';
import 'package:step_flutter/demo/expansion_panel_demo.dart';
import 'package:step_flutter/demo/floating_action_button_demo.dart';
import 'package:step_flutter/demo/form_demo.dart';
import 'package:step_flutter/demo/paginated_data_table_demo.dart';
import 'package:step_flutter/demo/popup_menu_button_demo.dart';
import 'package:step_flutter/demo/radio_demo.dart';
import 'package:step_flutter/demo/simple_dialog_demo.dart';
import 'package:step_flutter/demo/slider_demo.dart';
import 'package:step_flutter/demo/snack_bar_demo.dart';
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
          MCListItem(title: 'Card 卡片', page:CardDemo(),),
          MCListItem(title: 'PaginatedDataTable 分页数据表格', page:PaginatedDataTableDemo(),),
          MCListItem(title: 'DataTable 数据表格', page:DataTableDemo(),),
          MCListItem(title: 'Chip 小标签', page:ChipDemo(),),
          MCListItem(title: 'ExpansionPanel 收缩面板', page:ExpansionPanelDemo(),),
          MCListItem(title: 'SnackBar 操作提示栏', page:SnackBarDemo(),),
          MCListItem(title: 'BottomSheet 底部滑动窗口', page:BottomSheetDemo(),),
          MCListItem(title: 'AlertDialog 对话框', page:AlertDialogDemo(),),
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