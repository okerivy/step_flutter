import 'dart:convert' as convert;

import 'package:flutter/material.dart';
//? 起个名字?? 以前是调用 get, 现在需要用 http.get 可能是为了好看. 应该是 包名.
import 'package:http/http.dart' as http; 
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
    print(post['title']);
    print(post['description']);
    print(post);
    print('Map 类型 --> ${post is Map}');
    

    //? map 转 json [String postJson]  可以发送到应用的后台
    final postJson = convert.json.encode(post);
    print(postJson);
    print('Map 类型 --> ${postJson is Map}');

    //? 请求接口返回的数据, 需要转换以后才能在fltter 中使用
    //? json 转成 map
    final postJsonConverted = convert.json.decode(postJson);
    print(postJsonConverted);
    print('Map 类型 --> ${postJsonConverted is Map}');

    final postModel = Post.fromJson(postJsonConverted);
    print('postModel 类型: Title: ${postModel.title}, description: ${postModel.description}');

    //? json.encode 会自动调用  postModel 的 toJson 方法
    /// calling `.toJson()` on the unencodable object.
    String jsonMap = convert.json.encode(postModel);
    print(jsonMap);
    print('Map 类型 --> ${jsonMap is Map}');

    
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

 
  /**
   *  // Fixme: 冒号 这是什么写法?
   * http://wiki.jikexueyuan.com/project/dart-language-tour/classes.html
   * 初始化列表
   * 除了调用父类构造函数，你也可以在构造函数体运行之前初始化实例变量。用逗号隔开使其分别初始化。
   * 
   * http://nucode.cn/article/1543745957253?p=1&m=0
   * 注意：在实例变量中只可以用 final 而非 const。必须在构造函数体之前初始化 final 变量
   * 
   * http://flycode.co/archives/280160
   * 构造函数大括号前还可用冒号指明初始化字段表，常用来设置final字段
   *
   * 
   * Post是一个默认的构造函数
   * 使用命名构造函数可以为一个类声明多个构造函数，或者说是提供额外的声明
   * Post.fromJson 是一个 命名的构造函数
   */
  //? 把json 转成 Model, 准备的说应该是把map 转成model,而不是服务器返回的原始json
  Post.fromJson(Map json)
    : title = json['title'],
      description = json['description'];

  //? 这个方法返回的是 map 类型的数据, 而不是能直接发给 后台的 json
  //? 但是因为这个方法是 被 convert.json.encode(postModel) 内部调用 的
  //? 所以通过  json.encode 返回的是真正的 json
  Map toJson() => {
    'title': title,
    'description': description
  };
}