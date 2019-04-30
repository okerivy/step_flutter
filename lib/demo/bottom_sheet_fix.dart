//Flutter Modal Bottom Sheet
//Modified by Suvadeep Das
//Based on https://gist.github.com/andrelsmoraes/9e4af0133bff8960c1feeb0ead7fd749


// https://gist.github.com/crimsonsuv/b25d5ebd04236f9be2aa66accba19446

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

const Duration _kBottomSheetDuration = const Duration(milliseconds: 200);
const Color _kBottomSheetBarrierColor = Colors.black54; //? 上面的背景颜色
const Color _kBottomSheetBgColor = Colors.white; //? 下面的背景颜色

const double _kMinFlingVelocity = 700.0;
const double _kCloseProgressThreshold = 0.5;


/// A material design bottom sheet.
///
/// There are two kinds of bottom sheets in material design:
///
///  * _Persistent_. A persistent bottom sheet shows information that
///    supplements the primary content of the app. A persistent bottom sheet
///    remains visible even when the user interacts with other parts of the app.
///    Persistent bottom sheets can be created and displayed with the
///    [ScaffoldState.showBottomSheet] function or by specifying the
///    [Scaffold.bottomSheet] constructor parameter.
///
///  * _Modal_. A modal bottom sheet is an alternative to a menu or a dialog and
///    prevents the user from interacting with the rest of the app. Modal bottom
///    sheets can be created and displayed with the [showModalBottomSheet]
///    function.
///
/// The [BottomSheetApp] widget itself is rarely used directly. Instead, prefer to
/// create a persistent bottom sheet with [ScaffoldState.showBottomSheet] or
/// [Scaffold.bottomSheet], and a modal bottom sheet with [showModalBottomSheet].
///
/// See also:
///
///  * [showBottomSheet] and [ScaffoldState.showBottomSheet], for showing
///    non-modal "persistent" bottom sheets.
///  * [showModalBottomSheet], which can be used to display a modal bottom
///    sheet.
///  * <https://material.io/design/components/sheets-bottom.html>
class BottomSheetApp extends StatefulWidget {
  /// Creates a bottom sheet.
  ///
  /// Typically, bottom sheets are created implicitly by
  /// [ScaffoldState.showBottomSheet], for persistent bottom sheets, or by
  /// [showModalBottomSheet], for modal bottom sheets.
  const BottomSheetApp({
    Key key,
    this.animationController,
    this.enableDrag = true,
    this.elevation = 0.0,
    this.isTransparency = false,
    this.bottomSheetBgColor,
    @required this.onClosing,
    @required this.builder
  }) : assert(enableDrag != null),
       assert(onClosing != null),
       assert(builder != null),
       assert(elevation != null && elevation >= 0.0),
       super(key: key);

  /// The animation that controls the bottom sheet's position.
  ///
  /// The BottomSheetApp widget will manipulate the position of this animation, it
  /// is not just a passive observer.
  final AnimationController animationController;

  /// Called when the bottom sheet begins to close.
  ///
  /// A bottom sheet might be prevented from closing (e.g., by user
  /// interaction) even after this callback is called. For this reason, this
  /// callback might be call multiple times for a given bottom sheet.
  final VoidCallback onClosing;

  /// A builder for the contents of the sheet.
  ///
  /// The bottom sheet will wrap the widget produced by this builder in a
  /// [Material] widget.
  final WidgetBuilder builder;

  /// If true, the bottom sheet can dragged up and down and dismissed by swiping
  /// downards.
  ///
  /// Default is true.
  final bool enableDrag;

  /// The z-coordinate at which to place this material relative to its parent.
  ///
  /// This controls the size of the shadow below the material.
  ///
  /// Defaults to 0. The value is non-negative.
  final double elevation;

  //? 最后的背景是否透明
  final bool isTransparency;

  //? 如果不透明的话,设置背景颜色
  final Color bottomSheetBgColor; 

  @override
  _BottomSheetAppState createState() => _BottomSheetAppState();

  /// Creates an animation controller suitable for controlling a [BottomSheetApp].
  static AnimationController createAnimationController(TickerProvider vsync, {Duration duration = _kBottomSheetDuration}) {
    return AnimationController(
      duration: duration,
      debugLabel: 'BottomSheetApp',
      vsync: vsync,
    );
  }
}

class _BottomSheetAppState extends State<BottomSheetApp> {

  final GlobalKey _childKey = GlobalKey(debugLabel: 'BottomSheetApp child');

  double get _childHeight {
    final RenderBox renderBox = _childKey.currentContext.findRenderObject();
    return renderBox.size.height;
  }
  
  // 获取背景颜色
  Color get _bgColor {
    Color typeColor = Theme.of(context).canvasColor;
    typeColor = widget.bottomSheetBgColor ?? (typeColor ?? _kBottomSheetBgColor);
    return widget.isTransparency ? null : typeColor;
  }

  MaterialType get _type {
    return widget.isTransparency 
    ? MaterialType.transparency 
    : MaterialType.canvas;
  } 

  bool get _dismissUnderway => widget.animationController.status == AnimationStatus.reverse;

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_dismissUnderway)
      return;
    widget.animationController.value -= details.primaryDelta / (_childHeight ?? details.primaryDelta);
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_dismissUnderway)
      return;
    if (details.velocity.pixelsPerSecond.dy > _kMinFlingVelocity) {
      final double flingVelocity = -details.velocity.pixelsPerSecond.dy / _childHeight;
      if (widget.animationController.value > 0.0)
        widget.animationController.fling(velocity: flingVelocity);
      if (flingVelocity < 0.0)
        widget.onClosing();
    } else if (widget.animationController.value < _kCloseProgressThreshold) {
      if (widget.animationController.value > 0.0)
        widget.animationController.fling(velocity: -1.0);
      widget.onClosing();
    } else {
      widget.animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget bottomSheet = Material(
      type: _type,
      color: _bgColor,
      key: _childKey,
      elevation: widget.elevation,
      child: widget.builder(context),
    );
    return !widget.enableDrag ? bottomSheet : GestureDetector(
      onVerticalDragUpdate: _handleDragUpdate,
      onVerticalDragEnd: _handleDragEnd,
      child: bottomSheet,
      excludeFromSemantics: true,
    );
  }
}

// PERSISTENT BOTTOM SHEETS

// See scaffold.dart


// MODAL BOTTOM SHEETS


class _ModalBottomSheetLayout extends SingleChildLayoutDelegate {
  _ModalBottomSheetLayout(this.progress, this.bottomInset);

  final double progress;
  final double bottomInset;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return new BoxConstraints(
        minWidth: constraints.maxWidth,
        maxWidth: constraints.maxWidth,
        minHeight: 0.0,
        maxHeight: constraints.maxHeight
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return new Offset(0.0, size.height - bottomInset - childSize.height * progress);
  }

  @override
  bool shouldRelayout(_ModalBottomSheetLayout oldDelegate) {
    return progress != oldDelegate.progress || bottomInset != oldDelegate.bottomInset;
  }
}

class _ModalBottomSheet<T> extends StatefulWidget {
  const _ModalBottomSheet({ Key key, this.route }) : super(key: key);

  final _ModalBottomSheetRoute<T> route;

  @override
  _ModalBottomSheetState<T> createState() => new _ModalBottomSheetState<T>();
}

class _ModalBottomSheetState<T> extends State<_ModalBottomSheet<T>> {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: widget.route.dismissOnTap ? () => Navigator.pop(context) : null,
        child: new AnimatedBuilder(
            animation: widget.route.animation,
            builder: (BuildContext context, Widget child) {
              double bottomInset = widget.route.resizeToAvoidBottomPadding
                  ? MediaQuery.of(context).viewInsets.bottom : 0.0;
              return new ClipRect(
                  child: new CustomSingleChildLayout(
                      delegate: new _ModalBottomSheetLayout(widget.route.animation.value, bottomInset),
                      child: new BottomSheetApp(
                          enableDrag: widget.route.enableDrag,
                          animationController: widget.route._animationController,
                          isTransparency: widget.route.isTransparency,
                          bottomSheetBgColor: widget.route.bottomSheetBgColor,
                          onClosing: () => Navigator.pop(context),
                          builder: widget.route.builder
                      )
                  )
              );
            }
        )
    );
  }
}

class _ModalBottomSheetRoute<T> extends PopupRoute<T> {
  _ModalBottomSheetRoute({
    this.builder,
    this.theme,
    this.barrierLabel,
    RouteSettings settings,
    this.resizeToAvoidBottomPadding,
    this.dismissOnTap,
    this.enableDrag,
    this.dismissOnTapBarrier,
    this.bottomSheetDuration,
    this.bottomSheetBarrierColor,
    this.isTransparency = false,
    this.bottomSheetBgColor,
  }) : super(settings: settings);

  final WidgetBuilder builder;
  final ThemeData theme;
  final bool resizeToAvoidBottomPadding; //? 好像是底部的工具栏
  final bool dismissOnTap;  //? 是否要点击下面白色背景 消失
  final bool enableDrag; //? 是否允许 拖拽关闭
  // Fixme: 点击背景如何消失
  final bool dismissOnTapBarrier;  //? 是否要点击 上面半透明背景 消失
  final Duration bottomSheetDuration; //? 动画时间
  final Color bottomSheetBarrierColor; //? 上面背景颜色
  final bool isTransparency; //? 下面背景是否透明
  final Color bottomSheetBgColor; //? 如果不透明的话,设置背景颜色

  @override
  Duration get transitionDuration => bottomSheetDuration ?? _kBottomSheetDuration;

  @override
  bool get barrierDismissible => dismissOnTapBarrier;

  @override
  final String barrierLabel;

  @override
  Color get barrierColor => bottomSheetBarrierColor ?? _kBottomSheetBarrierColor;

  AnimationController _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    //? 以前是访问的 BottomSheetApp 的静态方法 static
    _animationController = BottomSheetApp.createAnimationController(
      navigator.overlay,
      duration: bottomSheetDuration ?? _kBottomSheetDuration,
    );
    return _animationController;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    // By definition, the bottom sheet is aligned to the bottom of the page
    // and isn't exposed to the top padding of the MediaQuery.
    Widget bottomSheet = new MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: new _ModalBottomSheet<T>(route: this),
    );
    if (theme != null)
      bottomSheet = new Theme(data: theme, child: bottomSheet);
    return bottomSheet;
  }
}

/// Shows a modal material design bottom sheet.
///
/// A modal bottom sheet is an alternative to a menu or a dialog and prevents
/// the user from interacting with the rest of the app.
///
/// A closely related widget is a persistent bottom sheet, which shows
/// information that supplements the primary content of the app without
/// preventing the use from interacting with the app. Persistent bottom sheets
/// can be created and displayed with the [showBottomSheet] function or the
/// [ScaffoldState.showBottomSheet] method.
///
/// The `context` argument is used to look up the [Navigator] and [Theme] for
/// the bottom sheet. It is only used when the method is called. Its
/// corresponding widget can be safely removed from the tree before the bottom
/// sheet is closed.
///
/// Returns a `Future` that resolves to the value (if any) that was passed to
/// [Navigator.pop] when the modal bottom sheet was closed.
///
/// See also:
///
///  * [BottomSheetApp], which is the widget normally returned by the function
///    passed as the `builder` argument to [showModalBottomSheet].
///  * [showBottomSheet] and [ScaffoldState.showBottomSheet], for showing
///    non-modal bottom sheets.
///  * <https://material.google.com/components/bottom-sheets.html#bottom-sheets-modal-bottom-sheets>
Future<T> showModalBottomSheetApp<T>({
  @required BuildContext context,
  @required WidgetBuilder builder,
  bool dismissOnTap: false,
  bool dismissOnTapBarrier: true,
  bool enableDrag: true,
  bool resizeToAvoidBottomPadding : true,
  Duration bottomSheetDuration: _kBottomSheetDuration,
  Color bottomSheetBarrierColor: _kBottomSheetBarrierColor,
  bool isTransparency: false,
  Color bottomSheetBgColor,
}) {
  assert(context != null);
  assert(builder != null);
  return Navigator.push(context, new _ModalBottomSheetRoute<T>(
    builder: builder,
    theme: Theme.of(context, shadowThemeOnly: true),
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    resizeToAvoidBottomPadding: resizeToAvoidBottomPadding,
    dismissOnTap: dismissOnTap,
    enableDrag: enableDrag,
    dismissOnTapBarrier: dismissOnTapBarrier,
    bottomSheetBarrierColor: bottomSheetBarrierColor,
    bottomSheetDuration: bottomSheetDuration,
    isTransparency: isTransparency,
    bottomSheetBgColor: bottomSheetBgColor
  ));
}