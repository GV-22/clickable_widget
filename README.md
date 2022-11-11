# Clickable Widget

This Flutter plugin provides some flutter widgets having gesture handlers their don't natively have in Flutter.

By default some flutter widgets (Widget Without Gesture) do not trigger gesture events so we wrap them inside the InkWell/GestureDetector widget. To overcome this, I decide to build a package which give developpers some gesture handlers directly inside WWG.

# Available gesture handlers

- `onTap`;
- `onTapDown`;
- `onTapUp`;
- `onTapCancel`
- `onDoubleTapDown`
- `onDoubleTap`
- `onDoubleTapCancel`
- `onLongPressDown`
- `onLongPressCancel`
- `onLongPress`
- `onLongPressStart`
- `onLongPressMoveUpdate`
- `onLongPressUp`
- `onLongPressEnd`

# Available widgets

1. **ClickableContainer**
2. **ClickableImage**
3. **ClickableCard**
4. **ClickableGridTile**
5. **ClickableSizedBox**
6. **ClickableText**
7. **ClickableRow**
8. **ClickableColumn**

# Usage

Add Clickable Widget to your `pubspec.yaml` in `dependencies`: section.

```yaml
dependencies:
  clickable_widget: ^latest
```

Update dependencies

```
  $ flutter pub get
```

Import Clickable **Container** widget in your code

```dart
  ClickableContainer(
    onTap: () {
      debugPrint("container tapped");
    },
    alignment: Alignment.center,
    width: 100.0,
    height: 100.0,
    color: Colors.grey,
    child: const Text("Tap me!"),
  ),
```

Import Clickable **Image** widget in your code

```dart
   ClickableImage(
    onTap: () {
      debugPrint("network image tapped");
    },
    clickableImageType: ClickableImageType.network,
    src: "https://pixabay.com/fr/images/search/nature/",
  ),
```

Import Clickable **GridTile** widget in your code

```dart
  ClickableGridTile(
    onTap: () {
      debugPrint("grid tile tapped");
    },
    child: const Text("Tap me!"),
  ),
```

> For more exmample, refer to the example section.

# Meta

Gael Vinou [gaelvinou@gmail.com](mailto:gaelvinou@gmail.com)

- Twitter [@gael_vinou](https://twitter.com/gael_vinou)
- LinkedIn [Gael Vinou](https://twitter.com/gael_vinou)

[https://github.com/GV-22/clickable_widget](https://github.com/GV-22/clickable_widget)

Distributed under the MIT License

# Contributing

1. Fork it (<https://github.com/GV-22/clickable_widget/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request
