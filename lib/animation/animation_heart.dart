import 'package:flutter/material.dart';

class AnimationHeart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationHeart'),
        elevation: 0.0,
      ),
      body: AnimationHeartHome(),
    );
  }
}


class AnimationHeartHome extends StatefulWidget {
  @override
  _AnimationHeartHomeState createState() => _AnimationHeartHomeState();
}

class _AnimationHeartHomeState extends State<AnimationHeartHome> with TickerProviderStateMixin{
  AnimationController animationHeartController;
  Animation sizeAnimation;
  Animation colorAnimation;

  @override
  void initState() { 
    super.initState();

    /// 我们 还需要 给 `animationController` 提供一个 `vsync` 属性
    /// 主要作用就是 `防止屏幕外的动画 消耗不必要的资源`
    /// 这个 vsync 应该是一个  `TickerProvider`
    /// `TickerProvider 会在每一帧做出一个反应 `
    /// 比如通知一下动画对象计算出当前帧的值
    /// `frame 就是帧`, 一帧可以理解成一个画面, 一般 1秒可以显示 60帧,
    /// 也就是 1秒的动作可以分解成 60个画面
    animationHeartController = AnimationController(
      // value: 32.0, //? 初始值
      // lowerBound: 32.0, //? 最小值
      // upperBound: 100.0, //? 最大值
      duration: Duration(milliseconds: 3000),
      //? 这样我们就可以把 vsync设置成当前对象  this
      vsync: this,
    );

    //? Tween 是 in between 简写, 指两者之间, 用来设置动画的 范围值 颜色等
    sizeAnimation = Tween(begin: 32.0, end: 100.0)
      /// 可以接着使用  `tween` 的  `animate` 方法, 
      /// 需要提供一个 参数 `parent` 就是 `AnimationController`
      /// 返回一个 `Animation`
      .animate(animationHeartController);

    colorAnimation = ColorTween(begin: Colors.red[200], end: Colors.red[800])
      .animate(animationHeartController);

    int index = 0;
    animationHeartController.addListener((){
      index += 1;
      // print('$index : ${animationHeartController.value}');
      //? 动画改变以后, 刷新重建界面
      setState(() {
      });
    });

    animationHeartController.addStatusListener((AnimationStatus status) {
      print('status: $status');
    });

    // animationHeartController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationHeartController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('AnimationHeartHome 文本'),
            ],
          ),
          ActionChip(
            //? toStringAsFixed 保留2位小数
            label: Text('${animationHeartController.value.toStringAsFixed(2)}'),
            onPressed: () {
              animationHeartController.forward();
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            color: colorAnimation.value,
            iconSize: sizeAnimation.value,
            onPressed: () {
              switch (animationHeartController.status) {
                case AnimationStatus.completed:
                  animationHeartController.reverse(); // end --> begin
                  break;
                default:
                  animationHeartController.forward(); // begin --> end
              }
            },
          ),
        ],
      ),
    );
  }
}