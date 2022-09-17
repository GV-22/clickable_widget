import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// A clickable card wrapped inside GestureDetector
class ClickableGridTile extends StatelessWidget {
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

  /// The container child widget
  final Widget child;

  /// The widget to show over the top of this grid tile.
  ///
  /// Typically a [GridTileBar].
  final Widget? header;

  /// The widget to show over the bottom of this grid tile.
  ///
  /// Typically a [GridTileBar].
  final Widget? footer;

  const ClickableGridTile({
    super.key,
    required this.child,
    this.header,
    this.footer,

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
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
      child: GridTile(
        key: key,
        footer: footer,
        header: header,
        child: child,
      ),
    );
  }
}
