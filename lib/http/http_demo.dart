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
    // fetchPost()
    //   // .then((value) => print(value));
    //   //? 也可以直接调用 Print 方法, 因为参数和 返回结果都和 Print一样
    //   .then(print);

    // localJson();
  }


  localJson() {

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

  Future<List<Post>> fetchPost() async {
    final response = 
        await http.get('https://resources.ninghao.net/demo/posts.json');
    
    print('statusCode: ${response.statusCode}');
    // print('body: ${response.body}');

    if (response.statusCode == 200) {
      
      final responseBody = convert.json.decode(response.body);
      List<Post> posts = responseBody['posts']
        //? map 处理后的结果 返回的是 Post对象
        //? map 接收的参数是 json字典
        .map<Post>((item) => Post.fromJson(item))
        .toList();

      return posts;
    } else {
      throw Exception('失败: Failed to fetch posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //? fetchPost 返回的数据(转好的模型) 交给 future
      future: fetchPost(),
      //? snapshot 里面会带着 future的数据, 已经是转好的模型
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print('data: ${snapshot.data}');
        print('connectionState: ${snapshot.connectionState}');
        
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('loading.....'),);
        }
        return ListView(
          children: snapshot.data.map<Widget>((Post item) {
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(
                // Fixme:  NetworkImage 和 Image.network 区别是什么??
                //?  backgroundImage。它需要一个ImageProvider: 提供图像数据的对象, 而不是图像
                //? NetworkImage 它不是小部件，不会将图像输出到屏幕, 而是一个  供应者.
                backgroundImage: NetworkImage(item.imageUrl),
                // backgroundImage: Image.network(item.imageUrl),
                //? Image.network 返回一个 image, 是一个小部件　
                // child: Image.network(item.imageUrl),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class Post {
  final String title;
  final String description;
  final int id;
  final String author;
  final String imageUrl;

  Post(
    this.title,
    this.description,
    this.id,
    this.author,
    this.imageUrl,
  );

 
  ///  // Fixme: 冒号 这是什么写法?
  /// http://wiki.jikexueyuan.com/project/dart-language-tour/classes.html
  /// 初始化列表
  /// 除了调用父类构造函数，你也可以在构造函数体运行之前初始化实例变量。用逗号隔开使其分别初始化。
  /// 
  /// http://nucode.cn/article/1543745957253?p=1&m=0
  /// 注意：在实例变量中只可以用 final 而非 const。必须在构造函数体之前初始化 final 变量
  /// 
  /// http://flycode.co/archives/280160
  /// 构造函数大括号前还可用冒号指明初始化字段表，常用来设置final字段
  ///
  /// 
  /// Post是一个默认的构造函数
  /// 使用命名构造函数可以为一个类声明多个构造函数，或者说是提供额外的声明
  /// Post.fromJson 是一个 命名的构造函数
  //? 把json 转成 Model, 准备的说应该是把map 转成model,而不是服务器返回的原始json
  Post.fromJson(Map json)
    : title = json['title'],
      id = json['id'],
      author = json['author'],
      imageUrl = json['imageUrl'],
      description = json['description'];

  //? 这个方法返回的是 map 类型的数据, 而不是能直接发给 后台的 json
  //? 但是因为这个方法是 被 convert.json.encode(postModel) 内部调用 的
  //? 所以通过  json.encode 返回的是真正的 json
  Map toJson() => {
    'title': title,
    'description': description,
    'id': id,
    'author': author,
    'imageUrl': imageUrl,
  };
}