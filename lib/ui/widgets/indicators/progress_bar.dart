import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastProgressBarIndicator extends StatelessWidget {
  final bool showProgressLabel;
  final Color? backgroundColor;
  final int fractionDigits;
  final double minHeight;
  final double value;
  final Color? color;

  FastProgressBarIndicator({
    Key? key,
    this.showProgressLabel = false,
    this.fractionDigits = 0,
    this.minHeight = 16,
    this.value = 0,
    this.backgroundColor,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainColor = color ?? ThemeHelper.colors.getPrimaryColor(context);
    final formattedValue = (100 * value).toStringAsFixed(fractionDigits);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showProgressLabel)
            FastBody(
              text: '$formattedValue %',
              textColor: mainColor,
            ),
          kFastSizedBox16,
          LinearProgressIndicator(
            backgroundColor: backgroundColor ?? mainColor.withOpacity(0.35),
            minHeight: minHeight,
            color: mainColor,
            value: value,
          ),
        ],
      ),
    );
  }
}
