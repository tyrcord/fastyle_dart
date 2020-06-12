import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FastLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  FastLink({
    Key key,
    @required this.text,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FIXME: https://github.com/flutter/flutter/issues/59316
    // TODO: report a bug?
    final scaleFactor = MediaQuery.of(context).textScaleFactor;
    final bodyTextStyle = ThemeHelper.texts.getBodyTextStyle(context);

    final linkTextStyle = bodyTextStyle.copyWith(
      fontSize: bodyTextStyle.fontSize * scaleFactor,
      color: color ?? ThemeHelper.colors.getBlueColor(context),
    );

    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          style: linkTextStyle,
          text: text,
        ),
      ),
    );
  }
}
