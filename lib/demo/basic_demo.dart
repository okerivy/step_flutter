
import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green[100],
      //* decoration 和 color不能同时设置
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://resources.ninghao.org/images/say-hello-to-barry.jpg'),
          alignment: Alignment.topCenter,
          // repeat: ImageRepeat.repeatY, //* 图像的重复模式
          fit: BoxFit.cover, //* 图像的填充模式
          //* 图像的滤镜
          colorFilter: ColorFilter.mode(
            Colors.indigoAccent[400].withOpacity(0.5), //? 滤镜的颜色
            BlendMode.hardLight, //? 滤镜的混合模式
          )
        ),
      ),
      //* Container 区域默认是占满可用的区域, 如果想设置尺寸,可以把它放在row或colum里面
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            //* 现在Container的大小就是它包装的 子部件的尺寸
            child: Icon(Icons.check,size: 32.0,color: Colors.white),
            //! Container 颜色 和 decoration颜色冲突
            // color: Color.fromRGBO(3, 54, 255, 1.0),
            padding: EdgeInsets.only(left: 34.0, right: 8.0),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            //* 盒子装饰 背景颜色, 阴影, 边框之类的
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              //* 边框样式
              // border: Border(
              //   top: BorderSide(
              //     color: Colors.indigoAccent[100],
              //     width: 15.0,
              //     style: BorderStyle.solid
              //   ),
              //   bottom: BorderSide(
              //     color: Colors.cyanAccent[100],
              //     width: 5.0,
              //     style: BorderStyle.solid,
              //   ),
              // ),
              border: Border.all(
                color: Colors.cyanAccent[100],
                width: 5.0,
                style: BorderStyle.solid,
              ),
              //* 如果是分别设置的Border, 不是用的 Border.all ,那么设置完 borderRadius 界面异常
              // borderRadius: BorderRadius.circular(16.0),
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(26.0),
              //   bottomRight: Radius.circular(50.0)
              // ),
              //* 添加阴影
              boxShadow: [
                BoxShadow(
                  offset: Offset(6.0, 8.0),
                  color: Color.fromRGBO(16, 20, 188, 1.0),
                  blurRadius: 15.0, //* 阴影的模糊程度
                  spreadRadius: 2, //* 阴影的扩散程度
                ),
              ],
              //* 在圆形的盒子上 不能设置圆角效果 borderRadius
              shape: BoxShape.circle,
              //* 镜像的渐变
              // gradient: RadialGradient(
              //   colors: [
              //     Color.fromRGBO(7, 102, 255, 1.0),
              //     Color.fromRGBO(3, 28, 128, 1.0),
              //   ]
              // ),
              //* 线性的渐变
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 28, 128, 1.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              ),

            ),
          )
        ],
      ),

    );
  }
}

//* Container 一个界面, 需要背景颜色或图像,一定的尺寸,边距,圆角,边框之类的效果



//* RichText 一行显示多种样式的文本
class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "RichText",
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 34.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100,
        ),
        children: [
          TextSpan(
            text: ".app",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.green,
            )
          )
        ],
      ),
    );
  }
}


//* Text 显示一段文本
class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0,
  );
  final String _author = '李白';
  final String _title = '将进酒';


  @override
  Widget build(BuildContext context) {
    return Text(
      '''
      《 $_title 》 -- $_author
      君不见，黄河之水天上来，奔流到海不复回。 
      君不见，高堂明镜悲白发，朝如青丝暮成雪。 
      人生得意须尽欢，莫使金樽空对月。 
      天生我材必有用，千金散尽还复来。 
      烹羊宰牛且为乐，会须一饮三百杯。 
      岑夫子，丹丘生，将进酒，杯莫停。
      ''',
      textAlign: TextAlign.center,
      style: _textStyle,
      maxLines: 10,
      overflow: TextOverflow.ellipsis,
    );
  }
}