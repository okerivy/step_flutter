import 'package:flutter/material.dart';
import 'package:step_flutter/demo/post_show.dart';
import '../model/post.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key key}) : super(key: key);

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16/9,
                child: Image.network(
                  posts[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0), //* 留点空间
              Text(
                posts[index].title,
                style: Theme.of(context).textTheme.headline6, //* 文字主题
              ),
              Text(
                posts[index].author,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 16.0),
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent, //? 透明
              //? 溅墨效果, 水波纹
              child: InkWell(
                //* splashColor 慢慢展开是颜色
                splashColor: Colors.white.withOpacity(0.3), 
                //* highlightColor 高亮的背景颜色
                highlightColor: Colors.white.withOpacity(0.1), 
                onTap: () {
                  debugPrint('Tap Image');
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return PostShow(post: posts[index]);
                    })
                  );
                },
              ),
            ),
          )
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