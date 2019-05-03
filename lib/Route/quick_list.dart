import 'package:flutter/material.dart';

class QuickList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuickList'),
        elevation: 0.0,
      ),
      body: QuickListHome(),
    );
  }
}


class QuickListHome extends StatefulWidget {
  @override
  _QuickListHomeState createState() => _QuickListHomeState();
}

class _QuickListHomeState extends State<QuickListHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          PageItem(routeName: 'home'),
          PageItem(routeName: 'Navigator'),
          PageItem(routeName: 'about'),
          PageItem(routeName: 'form'),
          PageItem(routeName: 'mdc'),
          PageItem(routeName: 'state-management'),
          PageItem(routeName: 'stream'),
          PageItem(routeName: 'rxdart'),
          PageItem(routeName: 'bloc'),
          PageItem(routeName: 'http'),
          PageItem(routeName: 'animation'),     
        ],
      ),
    );
  }
}

class PageItem extends StatelessWidget {
  final String routeName;

  const PageItem({Key key, this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text('${routeName}Demo'),
      onPressed: () {
        print('Button onPressed');
        Navigator.pushNamed(context, '/$routeName');
      },
    );
  }
}