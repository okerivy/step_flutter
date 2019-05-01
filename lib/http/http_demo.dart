import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //? 起个名字??
import 'dart:async';



class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() { 
    super.initState();
    // fetchPost();

    //? map 类型的数据 Map<String, String> 
    final post = {
      'title': 'hello ~',
      'description': 'nice to meet you',
    };
    print(post);
    print(post['title']);
    print(post['description']);

    //? map 转 json [String postJson]  可以发送到应用的后台
    final postJson = convert.json.encode(post);
    print(postJson);

    //? 请求接口返回的数据, 需要转换以后才能在fltter 中使用
    //? json 转成 map
    final postJsonConverted = convert.json.decode(postJson);
    print(postJsonConverted is Map);

    final postModel = Post.fromJson(postJsonConverted);
    print('Title: ${postModel.title}, description: ${postModel.description}');
  }

  fetchPost() async {
    final response = 
        await http.get('https://resources.ninghao.net/demo/posts.json');
    
    print('statusCode: ${response.statusCode}');
    print('body: ${response.body}');

  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Post {
  final String title;
  final String description;

  Post(
    this.title,
    this.description,
  );

  // Fixme: 冒号 这是什么写法?
  //? 构造函数大括号前还可用冒号指明初始化字段表，常用来设置final字段
  // http://wiki.jikexueyuan.com/project/dart-language-tour/classes.html
  Post.fromJson(Map json)
    : title = json['title'],
      description = json['description'];
}