import 'package:flutter/material.dart';
import 'package:step_flutter/model/post.dart';

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: PaginatedDataTableDemoTestFromPosts(),
      ),
    );
  }
}


class PostDataSource extends DataTableSource {
  final List<Post>_posts = posts;
  int _selectedCount = 0;

  @override
  int get rowCount => _posts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];

    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl))
      ]
    );
  }
}

//? 通过列表生成数据表格
class PaginatedDataTableDemoTestFromPosts extends StatefulWidget {
  @override
  _PaginatedDataTableDemoTestFromPostsState createState() => _PaginatedDataTableDemoTestFromPostsState();
}

class _PaginatedDataTableDemoTestFromPostsState extends State<PaginatedDataTableDemoTestFromPosts> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  final PostDataSource _postDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        PaginatedDataTable(
          header: Text('Posts'),
          rowsPerPage: 5,
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _sortAscending, //? true 升序列
          source: _postDataSource,
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
          
        ),
      ],
    );
  }
}
