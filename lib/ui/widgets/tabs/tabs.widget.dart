import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastTabs extends StatelessWidget {
  final TextStyle? unselectedLabelStyle;
  final Color? unselectedLabelColor;
  final double? indicatorWeight;
  final Color? indicatorColor;
  final TextStyle? labelStyle;
  final bool isViewScrollable;
  final List<Widget> views;
  final Color? labelColor;
  final int initialIndex;
  final List<Tab> tabs;

  const FastTabs({
    Key? key,
    required this.tabs,
    required this.views,
    this.isViewScrollable = true,
    this.initialIndex = 0,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
    this.indicatorWeight,
    this.indicatorColor,
    this.labelColor,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: initialIndex,
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
            dividerColor: Colors.transparent,
            tabs: tabs,
          ),
          Expanded(child: TabBarView(children: views)),
        ],
      ),
    );
  }
}
