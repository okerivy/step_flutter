import 'package:flutter/material.dart';
import 'package:step_flutter/model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: DataTableDemoTestFromPosts(),
      ),
    );
  }
}

//? 通过列表生成数据表格
class DataTableDemoTestFromPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DataTable(
          //? 栏目
          columns: [
            DataColumn(
              //? 可以通过 Container 设置占用的宽度
              // label: Container(
              //   width: 150,
              //   child: Text("Title"),
              // )
              label: Text("Title"),
            ),
            DataColumn(
              label: Text("Author"),
            ),
            DataColumn(
              label: Text("Image"),
            ),
          ],
          rows: posts.map(
            (Post item) {
              return DataRow(
                cells: [
                  DataCell(Text(item.title)),
                  DataCell(Text(item.author)),
                  DataCell(Image.network(item.imageUrl))
                ]
              );
            }
          ).toList(),
        ),
      ],
    );
  }
}

//? 手动生成测试数据
class DataTableDemoTest01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DataTable(
          //? 栏目
          columns: [
            DataColumn(
              label: Text("Title"),
            ),
            DataColumn(
              label: Text("Author"),
            ),
          ],
          //? 和栏目对应的每一行
          rows: [
            DataRow(
              cells: [
                DataCell(Text('Hello ~')),
                DataCell(Text('zhang san')),
              ]
            ),
            DataRow(
              cells: [
                DataCell(Text('Hola ~')),
                DataCell(Text('li si')),
              ]
            ),
            DataRow(
              cells: [
                DataCell(Text('您好 ~')),
                DataCell(Text('王五')),
              ]
            ),
          ],
        ),
      ],
    );
  }
}