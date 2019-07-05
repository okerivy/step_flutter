import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return LayoutRowDemoForAlignment();
  }
}

class LayoutTestDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("data"),
        ]
      ),
    );
  }
}


// Fixme: 如何让三个按钮 整体底部偏右, 三个按钮 底部对齐
class LayoutRowDemoForAlignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //* 使用Column 包装 IconBadge, 会显示成IconBadge的原本设置的尺寸, 不会像Container那样显示全屏
    
    // 内容 : 绿色大View 里面放 一个红色View,  红色View 里面放三个 蓝色图片Icon
          // 1. 绿色大View : Container 
          // 2. 红色View : Row 或者叫做 Container  //! Row是没有颜色的 红色由内部的 Container 决定
                //? 这里说明一点 因为 Row的 children中只有一个子部件 Container,
                //? 所以 Row的颜色就是由 子部件 Container 决定的. 
                //? 这里称 Row 为 红色View 其实是有错误的, 如果 children 设置两个Container 就能知晓了
                // 使用Row 包装, 会显示成里面内容原本设置的尺寸, 不会像Container那样显示全屏(全行) 
                //? 也可以放Column (对齐方式会有改变)
          // 3. 三个蓝色图片整体是 Row 的一行 : Container //! (红色)
                //? 因为 Container在 Row 的子部件, 所以 Row 是宽度是由 Container决定的. //* 这就是使用Row 包装的好处和目的
                //? Row 不能设置颜色, 所以 Container的红色 即是 Row的颜色 
          // 4. 三个蓝色图片: 左右排列 用 Row
          // 5. 一个蓝色图片: Icon
    // 对齐1: 红色View 在 绿色父view 底部偏右位置
          // 1. 底部: 绿色View底部
                // 绿色 View 的 alignment: Alignment.bottomCenter 
                //? bottomCenter  bottomLeft  bottomRight 等同 都是Bottom
          // 2. 偏右: 绿色View 偏右
                // 因为 红色view 是Row, 默认是整行, 所以 左右的位置 无法用绿色父view的 bottomRight确定 
                // bottomRight 其实只能确定 Bottom  //? 如果里面是 Column, 那么 bottomLeft 只能确定 Left
                // 所以 偏右 的位置 只能用 Row的主轴确定 mainAxisAlignment: MainAxisAlignment.end 
                // 因为 红色view 是Row 里面只有一个Cell ,并且Row 是横排, 所以 end 就是偏右
    // 对齐2: 三个蓝色图片Icon整体 在红色父view 中间偏左位置
          // 1. 也是一个 Container 包含一个 Row, //! 分析如上
          // 2. 红色view是 Container, 三个蓝色图片Icon整体 是一个Row
          // 3. 中间: 红色View 中间
                // 红色 View 的 alignment: Alignment.centerRight
                //? centerRight  centerLeft  center  都等同于 等同 center
          // 3. 偏左: 红色View 偏左
              // 因为三个蓝色整体 是Row, 而 Row 默认是横向滚动, 占满整行 
              // 所以 红色 Container 的 alignment 的左右调整 并不对 Row 起作用
              // 所以 偏左 的位置 只能用 Row的主轴确定 mainAxisAlignment: MainAxisAlignment.start 决定 
              // 因为 Row 有三个Icon , 所以 .start就是 在Row 中 偏左开始
    // 对齐2: 三个蓝色图片Icon 底部对齐, 中间有空隙
          // 1. 因为 Row 是横排的, 主轴是决定 多个Cell 横向排列, 交叉轴是决定 多个cell 竖直方向的对齐方式
          // 2. 所以 想要底部对齐, 其实就想 竖直方向对齐 设置  crossAxisAlignment: CrossAxisAlignment.start,
          // 3. 想要中间有空隙, 可以设置  主轴 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // 但是这样 是整个cell重新分配空间
          // 4. 也可以 中间加 Sizebox 设置间隙
    return Container(
      alignment: Alignment.bottomCenter,
      color: Colors.green,
      //! 如果想限制 这个红色框正好包裹着里面的东西, 可以 在row外面再包一个  Column, 然后设置  mainAxisSize: MainAxisSize.min, 并且取消里面的 height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        //? 这个交叉轴 没有作用吗? //! 是的在只有一个Cell 这种情况下, 无论是Row 还是 Column 都不起作用
        //? 如果  children 设置成两个 Container 就起作用了
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150,
            width: 220,
            color: Colors.red,
            // 外面从中间对齐
            alignment: Alignment.centerRight,
            // margin: const EdgeInsets.only(
            //   right: 10.0,
            // ),
            // Todo: 1 三个蓝色图标是Row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //? 这个交叉轴 没有作用吗?  //! 有作用, 因为  是多个Cell 高度不同
              crossAxisAlignment: CrossAxisAlignment.end,
              //? 这个MainAxisSize.min 可以限制最小的范围, 包裹 限制为最小宽度,使Container自动为最小的
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconBadge(Icons.pool, size:20.0),
                SizedBox(width: 5.0),
                IconBadge(Icons.beach_access, size:40.0),
                SizedBox(width: 5.0),
                IconBadge(Icons.airplanemode_active, size:30.0),
              ],
            ),
          ),
          Container(
            height: 60,
            width: 20,
            color: Colors.black,
          ),
          
        ],
      ),
    );
  }
}


class LayoutConstrainedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //* 带限制宽高的盒子
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 100.0,
              maxWidth: 100.0,
            ),
            child: Container(
              color: Color.fromRGBO(3, 54, 255, 1.0),
            ),
          ),
        ]
      ),
    );
  }
}




class LayoutAspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //* 宽高比的盒子
          AspectRatio(
            aspectRatio: 16.0/9.0,
            child: Container(
              color: Color.fromRGBO(3, 54, 255, 1.0),
            ),
          ),
        ]
      ),
    );
  }
}


class LayoutStackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //* Stack 可以放一摞小部件, 这些小部件会叠加到一块
          Stack(
            //* Stack 第一个sizebox是最大的,相当于成了底板
            //? stack 里面的部件,可以相对底板进行设置
            alignment: Alignment.topLeft,
            children: <Widget>[
              SizedBox(
                width: 200.0,
                height: 250.0,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(3, 54, 255, 1.0),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Icon(Icons.border_all, color: Colors.white, size: 32.0),
                ),
              ),
              SizedBox(height: 32.0,),
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(136, 78, 18, 1.0),
                    shape: BoxShape.circle, // 圆形
                    // 镜像渐变
                    gradient: RadialGradient(
                      colors: [
                        Color.fromRGBO(143, 102, 255, 1.0),
                        Color.fromRGBO(3, 54, 255, 1.0),
                      ]
                    )
                  ),
                  child: Icon(Icons.brightness_2, color: Colors.white, size: 32.0),
                ),
              ),
              //* Stack 可以用一些 Positioned部件 设置具体的位置
              //* Positioned部件 设置的位置是相对于 Stack 最大的部件
              Positioned(
                right: 20.0,
                top: 20.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
              ),
              Positioned(
                right: 10.0,
                top: 50.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
              ),
              Positioned(
                right: 10.0,
                top: 90.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
              ),
              Positioned(
                right: 50.0,
                top: 50.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LayoutSizebox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //* SizeBox可以强制他的子部件有一个固定的尺寸, (而 Container 默认是占满可以占满的区域)
          //? 如果不设置SizeBoxe 大小 width, 那么就是里面子部件的大小
          //? 单独使用 sizebox 可以用来 设置两个部件之间的间隔
          SizedBox(
            width: 200.0,
            height: 150.0,
            child: Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
              ),
              child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
            ),
          ),
          SizedBox(height: 32.0,),
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: Container(
              alignment: Alignment(1.0, -1.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
              ),
              child: Icon(Icons.brightness_2, color: Colors.white, size: 32.0),
            ),
          ),
        ],
      ),
    );
  }
}

class LayoutRowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //* 使用Column 包装 IconBadge, 会显示成IconBadge的原本设置的尺寸, 不会像Container那样显示全屏
    return Container(
      child: Row(
        //? spaceAround 把 剩余的空间分配在小部件的周围
        //? spaceBetween 把 剩余的空间分配在小部件的中间(上下顶着边)
        //? spaceEvenly 把 剩余的空间平均分配在小部件的之间
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // Fixme: 如何让三个按钮居中, 顶部对齐
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconBadge(Icons.pool),
          IconBadge(Icons.beach_access, size:64.0),
          IconBadge(Icons.airplanemode_active),
        ],
      ),
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {
    this.size = 32.0
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size:size, color: Colors.white),
      width: size + 20,
      height: size + 20,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}