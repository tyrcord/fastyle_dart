import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kMargin = EdgeInsets.symmetric(vertical: 16.0);
const _kPadding = EdgeInsets.symmetric(horizontal: 16.0);

class FastListHeader extends StatelessWidget {
  final String categoryText;
  final String captionText;
  final Color categoryColor;
  final Color captionColor;
  final EdgeInsets margin;
  final EdgeInsets padding;

  FastListHeader({
    Key key,
    @required this.categoryText,
    this.captionText,
    this.categoryColor,
    this.captionColor,
    this.margin,
    this.padding,
  })  : assert(categoryText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? _kMargin,
      padding: padding ?? _kPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FastSubhead(text: categoryText, textColor: categoryColor),
          if (captionText != null)
            FastCaption(text: captionText, textColor: captionColor),
        ],
      ),
    );
  }
}
