import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tbloc/tbloc.dart';

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
        var highlightColor0 = highlightColor;
        var baseColor0 = baseColor;

        highlightColor0 ??=
            isDark ? grayPalette.ultraDark : grayPalette.ultraLight;

        baseColor0 ??= isDark ? grayPalette.darkest : grayPalette.lightest;

        return RepaintBoundary(
          child: Shimmer.fromColors(
            highlightColor: highlightColor0,
            baseColor: baseColor0,
            child: child,
          ),
        );
      },
    );
  }
}
