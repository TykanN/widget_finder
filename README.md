# widget_finder

Easily find position and size of widget.

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
```