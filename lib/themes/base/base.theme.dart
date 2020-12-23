import 'package:fastyle_dart/themes/base/base.dart';
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
    MaterialInkController controller,
    RenderBox referenceBox,
    Offset position,
    Color color,
    TextDirection textDirection,
    bool containedInkWell = false,
    rectCallback,
    BorderRadius borderRadius,
    ShapeBorder customBorder,
    double radius,
    onRemoved,
  }) {
    return NoSplashInk(controller: controller, referenceBox: referenceBox);
  }
}

class NoSplashInk extends InteractiveInkFeature {
  NoSplashInk({
    @required MaterialInkController controller,
    @required RenderBox referenceBox,
  })  : assert(controller != null),
        assert(referenceBox != null),
        super(controller: controller, referenceBox: referenceBox);

  @override
  // ignore: no-empty-block
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}
