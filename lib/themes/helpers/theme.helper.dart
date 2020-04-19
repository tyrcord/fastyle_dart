import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class ThemeHelper {
  static ThemeGradientHelper _gradientHelper = ThemeGradientHelper();
  static ThemeColorHelper _colorHelper = ThemeColorHelper();
  static ThemeTextHelper _textHelper = ThemeTextHelper();
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
    @required BuildContext context,
    @required Widget child,
  }) {
    ThemeData theme = Theme.of(context);

    return ListTileTheme(
      iconColor: theme.iconTheme.color,
      textColor: theme.textTheme.body1.color,
      dense: true,
      child: child,
    );
  }
}
