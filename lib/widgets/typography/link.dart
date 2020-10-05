import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final TextAlign textAlign;

  const FastLink({
    Key key,
    @required this.text,
    @required this.onTap,
    this.color,
    this.textAlign,
  })  : assert(text != null),
        assert(onTap != null),
        super(key: key);

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
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 34.0),
        child: RichText(
          textAlign: textAlign ?? TextAlign.left,
          text: TextSpan(style: linkTextStyle, text: text),
        ),
      ),
    );
  }
}
