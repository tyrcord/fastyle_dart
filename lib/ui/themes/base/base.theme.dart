import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

final kBaseFastTheme = ThemeData(
  splashColor: Colors.transparent,
  tabBarTheme: kFastTabBarTheme,
  textTheme: kFastTextTheme,
  splashFactory: const NoSplashFactory(),
);

class NoSplashFactory extends InteractiveInkFeatureFactory {
  const NoSplashFactory();

  @override
  InteractiveInkFeature create({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    Offset? position,
    Color? color,
    TextDirection? textDirection,
    bool containedInkWell = false,
    rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    onRemoved,
  }) {
    return NoSplashInk(controller: controller, referenceBox: referenceBox);
  }
}

class NoSplashInk extends InteractiveInkFeature {
  NoSplashInk({
    required MaterialInkController controller,
    required RenderBox referenceBox,
  }) : super(
          controller: controller,
          referenceBox: referenceBox,
          color: Colors.transparent,
        );

  @override
  // ignore: no-empty-block
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}
