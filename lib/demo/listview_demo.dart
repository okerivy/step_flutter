import 'package:flutter/material.dart';
import '../model/post.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key key}) : super(key: key);

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Image.network(posts[index].imageUrl),
          SizedBox(height: 16.0), //* 留点空间
          Text(
            posts[index].title,
            style: Theme.of(context).textTheme.title, //* 文字主题
          ),
          Text(
            posts[index].author,
            style: Theme.of(context).textTheme.subhead,
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: _listItemBuilder,
      );
  }
}