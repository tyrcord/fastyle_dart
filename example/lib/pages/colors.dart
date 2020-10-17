import 'package:flutter/material.dart';
import 'package:fastyle_dart/fastyle_dart.dart';

class ColorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FastSectionPage(
      titleText: 'Colors',
      isViewScrollable: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 64,
            color: ThemeHelper.colors.getRedColor(context),
          ),
          kFastSizedBox32,
          Container(
            height: 64,
            color: ThemeHelper.colors.getPurpleColor(context),
          ),
          kFastSizedBox32,
          Container(
            height: 64,
            color: ThemeHelper.colors.getPinkColor(context),
          ),
          kFastSizedBox32,
          Container(
            height: 64,
            color: ThemeHelper.colors.getOrangeColor(context),
          ),
          kFastSizedBox32,
          Container(
            height: 64,
            color: ThemeHelper.colors.getTealColor(context),
          ),
          kFastSizedBox32,
          Container(
            height: 64,
            color: ThemeHelper.colors.getIndigoColor(context),
          ),
          kFastSizedBox32,
          Container(
            height: 64,
            color: ThemeHelper.colors.getBlueGrayColor(context),
          ),
          kFastSizedBox32,
          Container(
            height: 64,
            color: ThemeHelper.colors.getGreenColor(context),
          ),
          kFastSizedBox32,
          Container(
            height: 64,
            color: ThemeHelper.colors.getBlueColor(context),
          ),
          kFastSizedBox32,
          Container(
            height: 64,
            color: ThemeHelper.colors.getWhiteColor(context),
          ),
          kFastSizedBox32,
          Container(
            height: 64,
            color: ThemeHelper.colors.getYellowColor(context),
          ),
        ],
      ),
    );
  }
}
