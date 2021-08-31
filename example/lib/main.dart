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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widget_Finder Exampel'),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  key: key,
                  color: Colors.red,
                  width: 200,
                  height: 300,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        position = WidgetFinder.of(key).center;
                        size = WidgetFinder.of(key).size;
                      });
                    },
                    child: Text('Find!'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('position: $position'),
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
