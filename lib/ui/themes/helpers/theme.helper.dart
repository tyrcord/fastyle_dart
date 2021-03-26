import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class ThemeHelper {
  static final _gradientHelper = ThemeGradientHelper();
  static final _colorHelper = ThemeColorHelper();
  static final _textHelper = ThemeTextHelper();
  static double borderSize = kFastBorderSize;
  static double dividerSize = kFastDividerSize;
  static double dividerIndent = kFastDividerIndent;

  static ThemeGradientHelper get gradients {
    return _gradientHelper;
  }

  static ThemeColorHelper get colors {
    return _colorHelper;
  }

  static ThemeTextHelper get texts {
    return _textHelper;
  }

  // FIXME: should belong to the ThemeData Object
  // https://github.com/flutter/flutter/issues/31247
  static ListTileTheme getListTitleTheme({
    required BuildContext context,
    required Widget child,
  }) {
    final theme = Theme.of(context);

    return ListTileTheme(
      iconColor: theme.iconTheme.color,
      textColor: ThemeHelper.texts.getBodyTextStyle(context).color,
      dense: true,
      child: child,
    );
  }

  static BoxShadow getDefaultBoxShadow(BuildContext context) {
    return BoxShadow(
      color: ThemeHelper.colors.getShadowColor(context),
      blurRadius: kFastBlurRadius,
    );
  }

  static BoxDecoration createBorderSide(BuildContext context) {
    return BoxDecoration(
      border: Border(
        bottom: Divider.createBorderSide(
          context,
          color: Theme.of(context).dividerColor,
          width: kFastBorderSize,
        ),
      ),
    );
  }
}
