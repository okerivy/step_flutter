
import 'package:flutter/material.dart';
import 'package:step_flutter/model/post.dart';

class PostShow extends StatelessWidget {
  //? 外界传进来的数据模型
  final Post post;

  PostShow({
    @required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${post.title}'),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Image.network(
            post.imageUrl,
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity, //? 占满可以利用的空间
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${post.title}', style: Theme.of(context).textTheme.title),
                Text('${post.author}', style: Theme.of(context).textTheme.subhead),
                SizedBox(height: 16.0),
                // Fixme: description 过长, 可能超过边界了, 需要修正
                Text('${post.description}', style: Theme.of(context).textTheme.body1),
              ],
            ),
          ),

        ],
      ),
    );
  }
}