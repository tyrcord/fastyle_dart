import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kMargin = EdgeInsets.symmetric(vertical: 16.0);
const _kPadding = EdgeInsets.symmetric(horizontal: 16.0);

class FastListHeader extends StatelessWidget {
  final Color? categoryColor;
  final Color? captionColor;
  final String categoryText;
  final String? captionText;
  final EdgeInsets padding;
  final EdgeInsets margin;

  FastListHeader({
    Key? key,
    required this.categoryText,
    this.padding = _kPadding,
    this.margin = _kMargin,
    this.categoryColor,
    this.captionColor,
    this.captionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FastSubhead(text: categoryText, textColor: categoryColor),
          if (captionText != null)
            FastCaption(text: captionText!, textColor: captionColor),
        ],
      ),
    );
  }
}
