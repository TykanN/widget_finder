import 'package:flutter/material.dart';

class SizeNotifier extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onSizeChanged;

  const SizeNotifier({
    Key? key,
    required this.child,
    required this.onSizeChanged,
  }) : super(key: key);

  @override
  _SizeNotifierState createState() => _SizeNotifierState();
}

class _SizeNotifierState extends State<SizeNotifier> {
  Size _oldSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) => _notifySize());
    return widget.child;
  }

  void _notifySize() {
    final size = context.size ?? Size.zero;
    if (_oldSize != size) {
      _oldSize = size;
      widget.onSizeChanged(size);
    }
  }
}
