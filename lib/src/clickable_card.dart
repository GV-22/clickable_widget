import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// A clickable card wrapped inside GestureDetector
class ClickableCard extends StatelessWidget {
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

  /// The card child widget
  final Widget? child;

  /// The card's background color.
  final Color? color;

  /// The color to paint the shadow below the card.
  final Color? shadowColor;

  /// The color used as an overlay on [color] to indicate elevation.
  final Color? surfaceTintColor;

  /// The z-coordinate at which to place this card. This controls the size of
  /// the shadow below the card.
  final double? elevation;

  /// The shape of the card's [Material].
  final ShapeBorder? shape;

  /// Whether to paint the [shape] border in front of the [child].
  final bool borderOnForeground;

  /// {@macro flutter.material.Material.clipBehavior}
  final Clip? clipBehavior;

  /// The empty space that surrounds the card.
  final EdgeInsetsGeometry? margin;

  /// Whether this widget represents a single semantic container, or if false
  /// a collection of individual semantic nodes.
  final bool semanticContainer;

  // final ClickableWidgetHandlers handlers;

  const ClickableCard({
    super.key,
    this.child,
    this.color,
    this.margin,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.shape,
    this.borderOnForeground = true,
    this.semanticContainer = true,
    this.clipBehavior = Clip.none,

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
      child: Card(
        key: key,
        color: color,
        margin: margin,
        borderOnForeground: borderOnForeground,
        clipBehavior: clipBehavior,
        elevation: elevation,
        surfaceTintColor: surfaceTintColor,
        semanticContainer: semanticContainer,
        shadowColor: shadowColor,
        shape: shape,
        child: child,
      ),
    );
  }
}
