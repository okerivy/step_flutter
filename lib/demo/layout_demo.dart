import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //* 使用Column 包装 IconBadge, 会显示成IconBadge的原本设置的尺寸, 不会像Container那样显示全屏
    return LayoutRowDemo();
  }
}

class LayoutRowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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