import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastNavigationBarView extends StatefulWidget {
  final void Function(int)? onDestinationSelected;
  final List<Widget> destinations;
  final List<Widget>? children;
  final Color? backgroundColor;
  final Color? indicatorColor;
  final bool showAppBar;

  const FastNavigationBarView({
    super.key,
    required this.destinations,
    this.showAppBar = true,
    this.onDestinationSelected,
    this.backgroundColor,
    this.indicatorColor,
    this.children,
  });

  @override
  State<FastNavigationBarView> createState() => _FastNavigationBarViewState();
}

class _FastNavigationBarViewState extends State<FastNavigationBarView> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeHelper.colors;
    final theme = Theme.of(context);
    final _backgroundColor =
        widget.backgroundColor ?? colors.getSecondaryBackgroundColor(context);
    final _indicatorColor =
        widget.indicatorColor ?? colors.getPrimaryColor(context);
    Widget? selectedPage;

    if (widget.children != null) {
      final children = widget.children!;

      if (currentPageIndex < children.length) {
        selectedPage = widget.children![currentPageIndex];
      }
    }

    return NavigationBarTheme(
      data: theme.navigationBarTheme.copyWith(
        indicatorColor: _indicatorColor,
      ),
      child: FastScaffold(
        showAppBar: widget.showAppBar,
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() => currentPageIndex = index);

            if (widget.onDestinationSelected != null) {
              widget.onDestinationSelected!(index);
            }
          },
          surfaceTintColor: _backgroundColor,
          backgroundColor: _backgroundColor,
          destinations: widget.destinations,
          selectedIndex: currentPageIndex,
        ),
        child: selectedPage,
      ),
    );
  }
}
