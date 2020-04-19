import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastTabs extends StatelessWidget {
  final List<Tab> tabs;
  final List<Widget> views;
  final double indicatorWeight;
  final Color indicatorColor;
  final Color labelColor;
  final TextStyle labelStyle;
  final Color unselectedLabelColor;
  final TextStyle unselectedLabelStyle;
  final bool isViewScrollable;

  FastTabs({
    Key key,
    @required this.tabs,
    @required this.views,
    this.indicatorWeight,
    this.indicatorColor,
    this.labelColor,
    this.labelStyle,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
    this.isViewScrollable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TabBar(
            indicatorWeight: indicatorWeight ?? ThemeHelper.borderSize,
            isScrollable: isViewScrollable,
            indicatorColor:
                indicatorColor ?? ThemeHelper.colors.getPrimaryColor(context),
            labelColor: labelColor,
            labelStyle: labelStyle,
            unselectedLabelColor: unselectedLabelColor,
            unselectedLabelStyle: unselectedLabelStyle,
            tabs: tabs,
          ),
          Expanded(
            child: TabBarView(
              children: views,
            ),
          ),
        ],
      ),
    );
  }
}
