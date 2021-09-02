# widget_finder

Easily find position and size of widget.
Additionally, available to receive the size through callback function, using WidgetFinder.sizeNotifier widget.

## Getting Started

Add kpostal to your pubspec.yaml file:
```yaml
dependencies:
  widget_finder:
```

## Example

```dart
import 'package:widget_finder/widget_finder.dart';

// Create GlobalKey
final key = GlobalKey();

// Create Widget using above GlobalKey
Container(
    key: key,
    child ...
),

// Find!
Offset topLeftOffset = WidgetFinder.of(key).topLeft; // position of topLeft point
Offset centerOffset = WidgetFinder.of(key).center; // position of center point
Size size = WidgetFinder.of(key).size; // size of widget

// When you want to receive size, use WidgetFinder.sizeNotifier!
WidgetFinder.sizeNotifier(
  onSizeChanged: (size){
    // This size is real size of widget built.
    // If this widget is constrained by parent widgets, it is not the same size as set in the child widget.
    print('width: ${size.width}, height: ${size.height}');
  },
  child: Container(...),
)
```