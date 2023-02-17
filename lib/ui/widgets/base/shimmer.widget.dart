import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

/// A shimmer widget that can be used to display a loading state.
class FastShimmer extends StatelessWidget {
  final Color? highlightColor;
  final Color? baseColor;
  final Widget child;

  const FastShimmer({
    super.key,
    required this.child,
    this.highlightColor,
    this.baseColor,
  });

  @override
  Widget build(BuildContext context) {
    final grayPalette = ThemeHelper.getPaletteColors(context).gray;

    return BlocBuilderWidget(
      bloc: BlocProvider.of<FastThemeBloc>(context),
      builder: (BuildContext context, state) {
        final isDark = state.brightness == Brightness.dark;
        var _highlightColor = highlightColor;
        var _baseColor = baseColor;

        _highlightColor ??=
            isDark ? grayPalette.ultraDark : grayPalette.ultraLight;

        _baseColor ??= isDark ? grayPalette.darkest : grayPalette.lightest;

        return RepaintBoundary(
          child: Shimmer.fromColors(
            highlightColor: _highlightColor,
            baseColor: _baseColor,
            child: child,
          ),
        );
      },
    );
  }
}
