import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //? 获取 在 bloc_demo中设置的 CounterProvider 的值
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return Center(
      child: ActionChip(
        label: Text('0'),
        onPressed: () {
          _counterBloc.log();
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //? 获取 在 bloc_demo中设置的 CounterProvider 的值
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return FloatingActionButton(
      child: Icon(Icons.add), 
      onPressed: () {
        _counterBloc.log();
      },
    );
  }
}

//? 使用 InheritedWidget 传递 BLoC
class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;
  
  CounterProvider({
    this.child,
    this.bloc,
  }) : super(child: child);

  //? 使用这个方法, 可以让外界得到 在 CounterProvider 设置的值
  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}


class CounterBloc {
  void log() {
    print('Bloc');
  }
}