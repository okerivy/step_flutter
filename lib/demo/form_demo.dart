import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormDemo'),
        elevation: 0.0,
      ),
      body: Theme(
        //* ThemeData 会完全覆盖main 中定义的主题
        // data: ThemeData(
        //   primaryColor: Colors.lightBlue,
        // ),
        //* 如果只是想覆盖 Main中主题的 一个属性 , 就用 Theme.of(context).copyWith
        data: Theme.of(context).copyWith(
          primaryColor: Colors.lightBlue,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterFormDemo(),
            ],
          ),
        ),
      ),
    );
  }
}

//? 在form 中可以包装一些表单字段, 每一个表单字段都可以放在 formfield里面
class RegisterFormDemo extends StatefulWidget {
  @override
  _RegisterFormDemoState createState() => _RegisterFormDemoState();
}

class _RegisterFormDemoState extends State<RegisterFormDemo> {
  //* 定义一个Key, 然后把这个Key 交给表单, 然后就可以使用这个key来引用表单
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool _autovalidate = false;

  //* 在点击提交的时候 根据需要打开表单的自动验证功能
  void _submitRegisterForm () {

    if (registerFormKey.currentState.validate()) {
      //? 保存一下 RegisterFormDemo 表单里面的一些数据
      registerFormKey.currentState.save();
      debugPrint('username: $username \npassword: $password');

      //* 在屏幕底部弹出动画提示栏
      //? 找到最近的 Scaffold, 执行它的 showSnackBar 方法
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('正在注册中...'),
        )
      );
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }

  String _validatorUsername (value) {
    if (value.isEmpty) {
      return 'Username is Required.';
    }
    return null;
  }

  String _validatorPassword (value) {
    if (value.isEmpty) {
      return 'Password is Required.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      //? 包装一层竖排显示的小部件
      child: Column(
        children: <Widget>[
          //? 表单字段 都是 FormField
          //? 如果你需要一个文本字段, 需要一个 FormFied , 里面添加一个  TextField 
          //? 你也可以用系统提供的 TextFormField, 就是上面的包装好的
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
              helperText: '', //? 默认的帮助信息, 会占用空间, 当错误提示时, 会很自然
            ),
            //? 因为TextFormField 继承FormField, 所以 有onsave方法
            onSaved: (value) {
              username = value;
            },
            //? 验证表单里面的数据是否合法
            validator: _validatorUsername,
            autovalidate: _autovalidate, //* 自动验证功能
          ),
          TextFormField(
            obscureText: true, //* 设置成 密码不可见
            decoration: InputDecoration(
              labelText: 'Password',
              helperText: '', //? 默认的帮助信息, 会占用空间, 当错误提示时, 会很自然
            ),
            onSaved: (value) {
              password = value;
            },
            validator: _validatorPassword,
            autovalidate: _autovalidate,
          ),
          SizedBox(height: 32.0,),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('注册', style: TextStyle(color: Colors.white)),
              elevation: 0.0, //? 取消阴影
              onPressed: _submitRegisterForm,
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {

  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() { 
    super.initState();
    textEditingController.text = 'hi'; //? 设置初始文本
    textEditingController.addListener(
      () {
        debugPrint('输入了: ${textEditingController.text}');
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      // onChanged: (value) {
      //   debugPrint('输入: $value');
      // },

      onSubmitted: (value) {
        debugPrint('完成: $value');
      },

      // Fixme: 光标颜色是 mian中的颜色, 如何修改
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: '头部标签', //? 头部显示个标签
        hintText: '请输入文本', //? 默认文本
        // border: InputBorder.none, //? 隐藏下面的线
        // border: OutlineInputBorder(), //? 四周加边框
        filled: true,
        fillColor: Colors.lightBlue[100], //? 填充颜色
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //* Theme.of(context) 是离这个小部件最近的主题, main.dart定义的主题 会影响
      color: Theme.of(context).accentColor,
    );
  }
}