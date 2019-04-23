
import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  
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