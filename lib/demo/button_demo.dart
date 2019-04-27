

import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('禁用按钮'),
          //*  onPressed: null的时候  按钮就被禁用了
          onPressed: null,
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton(
          child: Text('可点击'),
          onPressed: () {},
          splashColor: Colors.grey, //? 溅墨效果的颜色
          textColor: Theme.of(context).accentColor, //? 文字颜色
        ),
        FlatButton.icon(
          icon: Icon(Icons.vertical_align_center),
          label: Text('图标按钮'),
          onPressed: () {},
          splashColor: Colors.blue,
          textColor: Theme.of(context).accentColor,
        )
      ],
    );

    //*  RaisedButton 默认有个背景颜色  和 阴影效果
    final Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text('按钮'),
          //*  onPressed: null的时候  按钮就被禁用了
          onPressed: () {},
          splashColor: Colors.grey,
          elevation: 0.0,
          color: Theme.of(context).accentColor,
          textColor: Colors.brown,
          // textTheme: ButtonTextTheme.accent,
        ),
        SizedBox(width: 16.0,),
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              //? 正方形
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(10.0),
              // ),
              //? 像球场之类的
              shape: StadiumBorder()
            )
          ),
          child: RaisedButton(
            child: Text('主题按钮'),
            onPressed: () {},
            splashColor: Colors.grey, //? 溅墨效果的颜色
            textColor: Theme.of(context).accentColor, //? 文字颜色
            elevation: 12.0,
          ),
        ),
        SizedBox(width: 16.0,),
        RaisedButton.icon(
          icon: Icon(Icons.vertical_align_center),
          label: Text('图标按钮'),
          onPressed: () {},
          splashColor: Colors.blue,
          textColor: Theme.of(context).accentColor,
          elevation: 0.0,
        )
      ],
    );

    //*  OutlineButton 有描边的按钮
    final Widget outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton(
          child: Text('按钮'),
          //*  onPressed: null的时候  按钮就被禁用了
          onPressed: () {},
          splashColor: Colors.lightGreen[300],
          color: Theme.of(context).accentColor,
          textColor: Colors.brown,
          // textTheme: ButtonTextTheme.accent,
          //? 描边的颜色
          borderSide: BorderSide(
            color: Colors.deepOrange
          ),
          //? 高亮的颜色
          highlightedBorderColor: Colors.purple,
        ),
        SizedBox(width: 16.0,),
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              //? 正方形
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(10.0),
              // ),
              //? 像球场之类的
              shape: StadiumBorder()
            )
          ),
          child: OutlineButton(
            child: Text('主题按钮'),
            onPressed: () {},
            splashColor: Colors.grey, //? 溅墨效果的颜色
            textColor: Theme.of(context).accentColor, //? 文字颜色
          ),
        ),
        SizedBox(width: 16.0,),
        OutlineButton.icon(
          icon: Icon(Icons.vertical_align_center),
          label: Text('图标按钮'),
          onPressed: () {},
          splashColor: Colors.blue,
          textColor: Theme.of(context).accentColor,
        )
      ],
    );

    //? 有固定宽度的按钮
    final Widget fixedWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton(
          child: Text('自动适应宽度'),
          onPressed: () {},
          splashColor: Colors.lightGreen[300],
          color: Theme.of(context).accentColor,
          textColor: Colors.brown,
          // textTheme: ButtonTextTheme.accent,
          //? 描边的颜色
          borderSide: BorderSide(
            color: Colors.deepOrange
          ),
          //? 高亮的颜色
          highlightedBorderColor: Colors.purple,
        ),
        SizedBox(width: 16.0,),
        Container(
          width: 160.0,
          child: OutlineButton(
            child: Text('固定宽度'),
            onPressed: () {},
            splashColor: Colors.lightGreen[300],
            color: Theme.of(context).accentColor,
            textColor: Colors.brown,
            // textTheme: ButtonTextTheme.accent,
            //? 描边的颜色
            borderSide: BorderSide(
              color: Colors.blue
            ),
            //? 高亮的颜色
            highlightedBorderColor: Colors.purple,
          ),
        )
      ],
    );


    //? 占满可用空间的按钮
    final Widget expandedWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
       Expanded(
          flex: 2,
          child: OutlineButton(
            child: Text('比例2'),
            onPressed: () {},
            splashColor: Colors.lightGreen[300],
            color: Theme.of(context).accentColor,
            textColor: Colors.brown,
            // textTheme: ButtonTextTheme.accent,
            //? 描边的颜色
            borderSide: BorderSide(
              color: Colors.blue
            ),
            //? 高亮的颜色
            highlightedBorderColor: Colors.purple,
          ),
        ),
        SizedBox(width: 16.0,),
        Expanded(
          flex: 4,
          child: OutlineButton(
            child: Text('比例4'),
            onPressed: () {},
            splashColor: Colors.lightGreen[300],
            color: Theme.of(context).accentColor,
            textColor: Colors.brown,
            // textTheme: ButtonTextTheme.accent,
            //? 描边的颜色
            borderSide: BorderSide(
              color: Colors.deepOrange
            ),
            //? 高亮的颜色
            highlightedBorderColor: Colors.purple,
          ),
        ),
        SizedBox(width: 16.0,),
        Expanded(
          flex: 3,
          child: OutlineButton(
            child: Text('比例3'),
            onPressed: () {},
            splashColor: Colors.lightGreen[300],
            color: Theme.of(context).accentColor,
            textColor: Colors.brown,
            // textTheme: ButtonTextTheme.accent,
            //? 描边的颜色
            borderSide: BorderSide(
              color: Colors.deepPurple
            ),
            //? 高亮的颜色
            highlightedBorderColor: Colors.purple,
          ),
        ),
      ],
    );

    //? 一组带边距的横排显示的按钮
    final Widget butttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          //? 根据 ButtonBar 源码, 调整 Theme的padding间距
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
            ),
          ),
          child:ButtonBar(
            //* ButtonBar 源码 其实就是Row 包含了一个 Padding 
            children: <Widget>[
              OutlineButton(
                child: Text('ButtonBar'),
                onPressed: () {},
                splashColor: Colors.lightGreen[300],
                color: Theme.of(context).accentColor,
                textColor: Colors.brown,
                // textTheme: ButtonTextTheme.accent,
                //? 描边的颜色
                borderSide: BorderSide(
                  color: Colors.blue
                ),
                //? 高亮的颜色
                highlightedBorderColor: Colors.purple,
              ),
              OutlineButton(
                child: Text('ButtonBar'),
                onPressed: () {},
                splashColor: Colors.lightGreen[300],
                color: Theme.of(context).accentColor,
                textColor: Colors.brown,
                // textTheme: ButtonTextTheme.accent,
                //? 描边的颜色
                borderSide: BorderSide(
                  color: Colors.deepOrange
                ),
                //? 高亮的颜色
                highlightedBorderColor: Colors.purple,
              ),
            ],
          ),
        )

      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            flatButtonDemo,
            raisedButtonDemo,
            outlineButtonDemo,
            fixedWidthButton,
            expandedWidthButton,
            butttonBarDemo,
          ],
        ),
      ),
    );
  }
}