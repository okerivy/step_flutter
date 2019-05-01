import 'package:flutter/material.dart';
import 'package:step_flutter/model/post.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: posts.map((post) {
            return Card(
              //?  shape 功能也很强大, 可以剪切成圆形
              // shape: CircleBorder(side: const BorderSide(
              //     color: Colors.green,
              //     width: 2.0,
              //     style:BorderStyle.solid
              // )),
              // borderOnForeground: false, 
              //? 方法1 对图片进行剪切  因为图片默认不剪切, 所以上面两个角没有剪切
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16/9,
                    //? 方法2 对图片添加 圆角效果 ClipRRect 给他的孩子裁剪出圆角效果
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                      child: Image.network(
                        post.imageUrl,
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(post.imageUrl),
                    ),
                    title: Text(post.title),
                    subtitle: Text(post.author),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      post.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(height: 0,),
                  ButtonTheme.bar(
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: Text('Like'.toUpperCase()),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text('Read'.toUpperCase()),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}