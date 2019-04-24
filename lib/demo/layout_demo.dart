import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
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
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}