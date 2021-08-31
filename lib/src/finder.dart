import 'package:flutter/material.dart';

class WidgetFinder {
  final GlobalKey key;

  WidgetFinder.of(this.key);

  // 해당 위젯의 context
  BuildContext? get context => key.currentContext;

  RenderBox get box => context?.findRenderObject() as RenderBox;

  Size get size => box.size;

  double get width => size.width;
  double get height => size.height;

  Offset get topLeft => box.localToGlobal(Offset.zero);
  Offset get topCenter => topLeft + Offset(width / 2, 0);
  Offset get topRight => topLeft + Offset(width, 0);

  Offset get centerLeft => topLeft + Offset(0, height / 2);
  Offset get center => topLeft + Offset(width / 2, height / 2);
  Offset get centerRight => topLeft + Offset(width, height / 2);

  Offset get bottomLeft => topLeft + Offset(0, height);
  Offset get bottomCenter => topLeft + Offset(width / 2, height);
  Offset get bottomRight => topLeft + Offset(width, height);
}
