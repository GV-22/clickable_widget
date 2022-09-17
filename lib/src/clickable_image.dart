import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

enum ClickableImageType { imageProvider, asset, file, network, memory }

/// A clickable image wrapped inside GestureDetector
class ClickableImage extends StatelessWidget {
  final ClickableImageType clickableImageType;

  /// A pointer that might cause a tap with a primary button has contacted the
  /// screen at a particular location.
  final GestureTapDownCallback? onTapDown;

  /// A pointer that will trigger a tap with a primary button has stopped
  /// contacting the screen at a particular location.
  final GestureTapUpCallback? onTapUp;

  /// A tap with a primary button has occurred.
  final GestureTapCallback? onTap;

  /// The pointer that previously triggered [onTapDown] will not end up causing
  /// a tap.
  final GestureTapCancelCallback? onTapCancel;

  /// A pointer that might cause a double tap has contacted the screen at a
  /// particular location.
  final GestureTapDownCallback? onDoubleTapDown;

  /// The user has tapped the screen with a primary button at the same location
  /// twice in quick succession.
  final GestureTapCallback? onDoubleTap;

  /// The pointer that previously triggered [onDoubleTapDown] will not end up
  /// causing a double tap.
  final GestureTapCancelCallback? onDoubleTapCancel;

  /// The pointer has contacted the screen with a primary button, which might
  /// be the start of a long-press.

  final GestureLongPressDownCallback? onLongPressDown;

  /// A pointer that previously triggered [onLongPressDown] will not end up
  /// causing a long-press.

  final GestureLongPressCancelCallback? onLongPressCancel;

  /// Called when a long press gesture with a primary button has been recognized.

  final GestureLongPressCallback? onLongPress;

  /// Called when a long press gesture with a primary button has been recognized.

  final GestureLongPressStartCallback? onLongPressStart;

  /// A pointer has been drag-moved after a long-press with a primary button.
  final GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate;

  /// A pointer that has triggered a long-press with a primary button has
  /// stopped contacting the screen.
  final GestureLongPressUpCallback? onLongPressUp;

  /// A pointer that has triggered a long-press with a primary button has
  /// stopped contacting the screen.
  final GestureLongPressEndCallback? onLongPressEnd;

  final ImageProvider<Object>? image;

  final ImageFrameBuilder? frameBuilder;

  /// A builder that specifies the widget to display to the user while an image
  /// is still loading.
  final ImageLoadingBuilder? loadingBuilder;

  /// A builder function that is called if an error occurs during image loading.

  final ImageErrorWidgetBuilder? errorBuilder;

  /// If non-null, require the image to have this width.

  final double? width;

  /// If non-null, require the image to have this height.

  final double? height;

  /// If non-null, this color is blended with each image pixel using [colorBlendMode].
  final Color? color;

  /// If non-null, the value from the [Animation] is multiplied with the opacity
  /// of each image pixel before painting onto the canvas.
  final Animation<double>? opacity;

  /// The rendering quality of the image.
  final FilterQuality filterQuality;

  /// Used to combine [color] with this image.
  final BlendMode? colorBlendMode;

  /// How to inscribe the image into the space allocated during layout.
  final BoxFit? fit;

  /// How to align the image within its bounds.
  final AlignmentGeometry alignment;

  /// How to paint any portions of the layout bounds not covered by the image.
  final ImageRepeat repeat;

  /// The center slice for a nine-patch image.
  final Rect? centerSlice;

  /// Whether to paint the image in the direction of the [TextDirection].
  final bool matchTextDirection;

  /// Whether to continue showing the old image (true), or briefly show nothing
  /// (false), when the image provider changes. The default value is false.
  final bool gaplessPlayback;

  /// A Semantic description of the image.
  final String? semanticLabel;

  /// Whether to exclude this image from semantics.
  final bool excludeFromSemantics;

  /// Whether to paint the image with anti-aliasing.
  final bool isAntiAlias;

  /// Whether to paint the image with anti-aliasing.
  final Map<String, String>? headers;

  final AssetBundle? bundle;
  final int? cacheWidth;
  final int? cacheHeight;
  final String? package;
  final double scale;

  /// [file] is used to create Image.file()
  /// it should not be null if [clickableImageType] is [ClickableImageType.file]
  final File? file;

  /// [src] is used to create Image.network()
  /// it should not be null if [clickableImageType] is [ClickableImageType.network]
  final String? src;

  /// [name] is used to create Image.asset()
  /// it should not be null if [clickableImageType] is [ClickableImageType.asset]
  final String? name;

  /// [bytes] is used to create Image.memory()
  /// [bytes] should not be null if [clickableImageType] is [ClickableImageType.memory]
  final Uint8List? bytes;

  // @override
  // final ImageProvider<Object>? image;

  const ClickableImage({
    super.key,
    // image properties
    required this.clickableImageType,
    this.image,
    this.file,
    this.src,
    this.name,
    this.bytes,
    this.width,
    this.height,
    this.fit,
    this.cacheWidth,
    this.cacheHeight,
    this.bundle,
    this.package,
    this.loadingBuilder,
    this.centerSlice,
    this.color,
    this.errorBuilder,
    this.colorBlendMode,
    this.frameBuilder,
    this.opacity,
    this.semanticLabel,
    this.headers,
    this.scale = 1.0,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.isAntiAlias = false,
    this.excludeFromSemantics = false,
    this.gaplessPlayback = false,
    this.matchTextDirection = false,
    this.filterQuality = FilterQuality.low,

    // gesture handler
    this.onTap,
    this.onTapUp,
    this.onTapDown,
    this.onTapCancel,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.onLongPress,
    this.onLongPressDown,
    this.onLongPressCancel,
    this.onLongPressStart,
    this.onLongPressUp,
    this.onLongPressEnd,
    this.onLongPressMoveUpdate,
  });

  // : assert(
  //         clickableImageType == ClickableImageType.imageProvider &&
  //             image != null,
  //         'Property [image] should not be null for [ClickableImageType.imageProvider]',
  //       ),
  //       assert(
  //         clickableImageType == ClickableImageType.asset && name != null,
  //         'Property [name] should not be null for [ClickableImageType.asset]',
  //       ),
  //       assert(
  //         clickableImageType == ClickableImageType.file && file != null,
  //         'Property [file] should not be null for [ClickableImageType.file]',
  //       ),
  //       assert(
  //         clickableImageType == ClickableImageType.memory && bytes != null,
  //         'Property [bytes] should not be null for [ClickableImageType.memory]',
  //       ),
  //       assert(
  //         clickableImageType == ClickableImageType.network && src != null,
  //         'Property [src] should not be null for [ClickableImageType.network]',
  //       );

  @override
  Widget build(BuildContext context) {
    Widget? widget;

    switch (clickableImageType) {
      case ClickableImageType.asset:
        widget = _imageFromAsset();

        break;
      case ClickableImageType.file:
        widget = _imageFromFile();
        break;
      case ClickableImageType.imageProvider:
        widget = _image();
        break;
      case ClickableImageType.memory:
        widget = _imageFromMemory();
        break;
      case ClickableImageType.network:
        widget = _imageFromNetwork();
        break;
      default:
        break;
    }

    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTap: onTap,
      onTapCancel: onTapCancel,
      onDoubleTapDown: onDoubleTapDown,
      onDoubleTap: onDoubleTap,
      onDoubleTapCancel: onDoubleTapCancel,
      onLongPressDown: onLongPressDown,
      onLongPressCancel: onLongPressCancel,
      onLongPress: onLongPress,
      onLongPressStart: onLongPressStart,
      onLongPressMoveUpdate: onLongPressMoveUpdate,
      onLongPressUp: onLongPressUp,
      onLongPressEnd: onLongPressEnd,
      // container
      child: widget,
    );
  }

  Widget _imageFromAsset() {
    if (name == null) {
      throw StateError("Missing [name] property for ClickableImageType.asset");
    }

    return Image.asset(
      name!,
      key: key,
      width: width,
      height: height,
      bundle: bundle,
      cacheHeight: cacheHeight,
      cacheWidth: cacheWidth,
      fit: fit,
      scale: scale,
      centerSlice: centerSlice,
      colorBlendMode: colorBlendMode,
      errorBuilder: errorBuilder,
      excludeFromSemantics: excludeFromSemantics,
      filterQuality: filterQuality,
      frameBuilder: frameBuilder,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      matchTextDirection: matchTextDirection,
      opacity: opacity,
      package: package,
      repeat: repeat,
      semanticLabel: semanticLabel,
      alignment: alignment,
      color: color,
    );
  }

  Widget _imageFromFile() {
    if (file == null) {
      throw StateError("Missing [file] property for ClickableImageType.file");
    }

    return Image.file(
      file!,
      key: key,
      width: width,
      height: height,
      cacheHeight: cacheHeight,
      cacheWidth: cacheWidth,
      fit: fit,
      scale: scale,
      centerSlice: centerSlice,
      colorBlendMode: colorBlendMode,
      errorBuilder: errorBuilder,
      excludeFromSemantics: excludeFromSemantics,
      filterQuality: filterQuality,
      frameBuilder: frameBuilder,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      matchTextDirection: matchTextDirection,
      opacity: opacity,
      repeat: repeat,
      semanticLabel: semanticLabel,
      alignment: alignment,
      color: color,
    );
  }

  Widget _imageFromNetwork() {
    if (src == null) {
      throw ("Missing [src] property for ClickableImageType.network");
    }

    return Image.network(
      src!,
      key: key,
      width: width,
      height: height,
      cacheHeight: cacheHeight,
      cacheWidth: cacheWidth,
      fit: fit,
      scale: scale,
      centerSlice: centerSlice,
      colorBlendMode: colorBlendMode,
      errorBuilder: errorBuilder,
      excludeFromSemantics: excludeFromSemantics,
      filterQuality: filterQuality,
      frameBuilder: frameBuilder,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      matchTextDirection: matchTextDirection,
      opacity: opacity,
      repeat: repeat,
      semanticLabel: semanticLabel,
      alignment: alignment,
      color: color,
      headers: headers,
      loadingBuilder: loadingBuilder,
    );
  }

  Widget _imageFromMemory() {
    if (name == null) {
      throw StateError(
          "Missing [bytes] property for ClickableImageType.memory");
    }

    return Image.memory(
      bytes!,
      width: width,
      height: height,
      cacheHeight: cacheHeight,
      cacheWidth: cacheWidth,
      fit: fit,
      scale: scale,
      centerSlice: centerSlice,
      colorBlendMode: colorBlendMode,
      errorBuilder: errorBuilder,
      excludeFromSemantics: excludeFromSemantics,
      filterQuality: filterQuality,
      frameBuilder: frameBuilder,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      matchTextDirection: matchTextDirection,
      opacity: opacity,
      repeat: repeat,
      semanticLabel: semanticLabel,
    );
  }

  Widget _image() {
    return Image(
      image: image!,
      width: width,
      height: height,
      fit: fit,
      centerSlice: centerSlice,
      colorBlendMode: colorBlendMode,
      errorBuilder: errorBuilder,
      excludeFromSemantics: excludeFromSemantics,
      filterQuality: filterQuality,
      frameBuilder: frameBuilder,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      matchTextDirection: matchTextDirection,
      opacity: opacity,
      repeat: repeat,
      semanticLabel: semanticLabel,
    );
  }
}
