import 'package:flutter/material.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          MCListItem(title: 'Button', page: ButtonDemo(),),
          MCListItem(title: 'FloatingActionButton', page: FloatingActionButtonDemo(),)
        ],
      ),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Widget FlatButtonDemo = Row(
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
    final Widget RaisedButtonDemo = Row(
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
    final Widget OutlineButtonDemo = Row(
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
    final Widget FixedWidthButton = Row(
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
    final Widget ExpandedWidthButton = Row(
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
    final Widget ButttonBarDemo = Row(
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
            FlatButtonDemo,
            RaisedButtonDemo,
            OutlineButtonDemo,
            FixedWidthButton,
            ExpandedWidthButton,
            ButttonBarDemo,
          ],
        ),
      ),
    );
  }
}


class _WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
              ],
            )
          ],
        ),
      ),
    );
  }
}


class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //? 带小图标的漂浮按钮
    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.trending_up),
      elevation: 0.0,
      backgroundColor: Colors.deepOrange,
      //? 设置成正方形
      // shape: BeveledRectangleBorder(
      //   //? 角度, 正八边形
      //   borderRadius: BorderRadius.circular(15.0),
      // ),
    );

    final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
      onPressed: () {},
      icon: Icon(Icons.turned_in_not),
      label: Text('标签'),
      backgroundColor: Colors.deepOrange,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      // floatingActionButton: _floatingActionButtonExtended,
      //* 和底部工具栏 融合一起,并居中
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.lightBlue,
          height: 80.0,
        ),
        //? 在底部工具栏上切出一个  和 button 相符的一个缺口
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

class MCListItem extends StatelessWidget {
  final String title;
  final Widget page;

  MCListItem({
    this.title,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page)
        );
      },
    );
  }
}