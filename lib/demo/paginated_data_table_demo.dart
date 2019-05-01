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

  //! 为什么这里是 _sort ,外界还是可以调用
  //? 第一个参数是一个方法参数, 其实应该是相当于回调之类的 
  //? getField(post) 接收一个 方法参数 post, 然后方法体 是由调用者来实现
  //? 这样外界调用的时候, 需要传一个 闭包 有参数, 有方法体的实现,
  //? 传进来以后, 在 _sort 内部 可以 随时调用 这个 外界写好的闭包.
  void _sort(getField(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }

      //?  调用外界的闭包
      final aValue = getField(a);
      final bValue = getField(b);

      //? 外界排序, 其实就是想要一个 int 值, -1 0 +1 
      //? 至于这个 int值怎么生成, 甚至可以与 需要排序的两个item 无关. 也可以写死.
      //? 怎么合乎你的逻辑, 怎么比较
      return Comparable.compare(aValue, bValue);
    });

    //? 排序完成以后 执行这个干啥...
    notifyListeners();

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
              // Fixme: 怎么感觉这 上下 箭头 图标不对啊
              onSort: (int columnIndex, bool ascending) {
                setState(() {
                  _sortColumnIndex = columnIndex;
                  _sortAscending = ascending;
                  print('index $columnIndex, ascending $ascending');

                  //? _sort 有两个参数, 第一个参数是接受一个方法
                  //?     这个方法接收一个 参数 post, 然后返回一个 结果 post.title.length
                  //?     意思是用一下文章标题的长度来作为 排序的依据
                  //?     第二个参数是表示 是否是升序排列
                  _postDataSource._sort((post) => post.title.length, ascending);
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
