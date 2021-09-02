import 'package:flutter/material.dart';
import 'sizeNotifier.dart';

class WidgetFinder {
  /// Use GlobalKey to find widget.
  ///
  /// Declare it as global constant or Manage it inside other state-management(provider, riverpod...)
  final GlobalKey key;

  WidgetFinder.of(this.key)
      : assert(key.currentContext?.findRenderObject() != null, 'No widget in the tree that matches this global key.');

  /// Context of the widget.
  BuildContext get context => key.currentContext!;

  /// RenderBox of the widget.
  RenderBox get box => context.findRenderObject() as RenderBox;

  /// Size of the widget.
  Size get size => box.size;

  /// Size.width of the widget.
  double get width => size.width;

  /// Size.height of the widget.
  double get height => size.height;

  /// TopLeft point of the widget.
  Offset get topLeft => box.localToGlobal(Offset.zero);

  /// TopCenter point of the widget.
  Offset get topCenter => topLeft + Offset(width / 2, 0);

  /// TopRight point of the widget.
  Offset get topRight => topLeft + Offset(width, 0);

  /// CenterLeft point of the widget.
  Offset get centerLeft => topLeft + Offset(0, height / 2);

  /// Center point of the widget.
  Offset get center => topLeft + Offset(width / 2, height / 2);

  /// CenterRight point of the widget.
  Offset get centerRight => topLeft + Offset(width, height / 2);

  /// BottomLeft point of the widget.
  Offset get bottomLeft => topLeft + Offset(0, height);

  /// BottomCenter point of the widget.
  Offset get bottomCenter => topLeft + Offset(width / 2, height);

  /// BottomRight point of the widget.
  Offset get bottomRight => topLeft + Offset(width, height);

  /// You can receive callback when size of child is changed.
  static SizeNotifier sizeNotifer({Key? key, required onSizeChanged, required child}) => SizeNotifier(
        key: key,
        onSizeChanged: onSizeChanged,
        child: child,
      );
}
