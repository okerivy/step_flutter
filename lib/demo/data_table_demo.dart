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
class DataTableDemoTestFromPosts extends StatefulWidget {
  @override
  _DataTableDemoTestFromPostsState createState() => _DataTableDemoTestFromPostsState();
}

class _DataTableDemoTestFromPostsState extends State<DataTableDemoTestFromPosts> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DataTable(
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _sortAscending, //? true 升序列
          //? 栏目
          columns: [
            DataColumn(
              //? 可以通过 Container 设置占用的宽度
              // label: Container(
              //   width: 150,
              //   child: Text("Title"),
              // )
              label: Text("Title"),
              onSort: (int index, bool ascending) {
                setState(() {
                  _sortColumnIndex = index;
                  _sortAscending = ascending;
                  print('index $index, ascending $ascending');

                  posts.sort((a, b) {
                    if (!ascending) {
                      final c = a;
                      a = b;
                      b = c;
                    }
                    // sort 的交换是按 升序排的 
                    // 因为是升序, 如果 a.len < b.len 符合sort升序规则, 不交换
                    // 如果是降序, 因为 a.len < b.len 符合sort升序规则, 不交换, 
                    //    但是 因为是降序, 需要交换, 所以 先搞 两个假数据, 符合交换规则, 所以就先让 a 和 b 交换大小了, 然后根据 假a 假b 来判断交换
                    return a.title.length.compareTo(b.title.length);
                  });
                });
              }
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

// //? 通过列表生成数据表格
// class DataTableDemoTestFromPosts extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         DataTable(
//           sortColumnIndex: _sortColumnIndex,
//           sortAscending: _sortAscending, //? true 升序列
//           //? 栏目
//           columns: [
//             DataColumn(
//               //? 可以通过 Container 设置占用的宽度
//               // label: Container(
//               //   width: 150,
//               //   child: Text("Title"),
//               // )
//               label: Text("Title"),
//             ),
//             DataColumn(
//               label: Text("Author"),
//             ),
//             DataColumn(
//               label: Text("Image"),
//             ),
//           ],
//           rows: posts.map(
//             (Post item) {
//               return DataRow(
//                 cells: [
//                   DataCell(Text(item.title)),
//                   DataCell(Text(item.author)),
//                   DataCell(Image.network(item.imageUrl))
//                 ]
//               );
//             }
//           ).toList(),
//         ),
//       ],
//     );
//   }
// }

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