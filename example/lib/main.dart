import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widget_finder/widget_finder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final key = GlobalKey();

  Offset? position;
  Size? size;

  double _width = 200;
  double _height = 200;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widget_Finder Example'),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetFinder.sizeNotifer(
                  key: key,
                  onSizeChanged: (Size value) {
                    print('Size is changed! : $value');
                  },
                  child: Container(
                    color: Colors.red,
                    width: _width,
                    height: _height,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: Colors.blue,
                        onPressed: () {
                          Random _rand = Random();
                          setState(() {
                            _width = (_rand.nextBool() ? 1 : -1) * _rand.nextInt(100) + 200;
                            _height = (_rand.nextBool() ? 1 : -1) * _rand.nextInt(100) + 200;
                          });
                        },
                        child: Text('Change size!'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            position = WidgetFinder.of(key).topLeft;
                            size = WidgetFinder.of(key).size;
                          });
                        },
                        child: Text('Find!'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('position of topLeft: $position'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('size: $size'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
