import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastNavigationBarView extends StatefulWidget {
  final List<FastNavigationDestination> destinations;
  final void Function(int)? onDestinationSelected;
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
    return FastMediaLayoutBuilder(
      builder: (context, mediaType) {
        final selectedPage = _findSelectedPage();
        var _indicatorColor = widget.indicatorColor;
        _indicatorColor ??= ThemeHelper.colors.getPrimaryColor(context);

        if (mediaType >= FastMediaType.tablet) {
          return FastScaffold(
            showAppBar: widget.showAppBar,
            child: buildNavigationRail(selectedPage, _indicatorColor),
          );
        }

        final theme = Theme.of(context);

        return NavigationBarTheme(
          data: theme.navigationBarTheme.copyWith(
            indicatorColor: _indicatorColor,
          ),
          child: FastScaffold(
            showAppBar: widget.showAppBar,
            bottomNavigationBar: buildNavigationBar(context),
            child: selectedPage,
          ),
        );
      },
    );
  }

  NavigationBar buildNavigationBar(BuildContext context) {
    final colors = ThemeHelper.colors;

    final _backgroundColor =
        widget.backgroundColor ?? colors.getSecondaryBackgroundColor(context);

    return NavigationBar(
      destinations: _buildNavigationDestinationList(),
      onDestinationSelected: _handleSelectionChange,
      surfaceTintColor: _backgroundColor,
      backgroundColor: _backgroundColor,
      selectedIndex: currentPageIndex,
    );
  }

  Widget buildNavigationRail(Widget? selectedPage, Color indicatorColor) {
    return Row(children: <Widget>[
      NavigationRail(
        destinations: _buildNavigationRailDestinationList(),
        onDestinationSelected: _handleSelectionChange,
        labelType: NavigationRailLabelType.all,
        selectedIndex: currentPageIndex,
        indicatorColor: indicatorColor,
      ),
      const VerticalDivider(thickness: 1, width: 1),
      Expanded(child: selectedPage ?? Container()),
    ]);
  }

  void _handleSelectionChange(int index) {
    setState(() => currentPageIndex = index);

    if (widget.onDestinationSelected != null) {
      widget.onDestinationSelected!(index);
    }
  }

  Widget? _findSelectedPage() {
    Widget? selectedPage;

    if (widget.children != null) {
      final children = widget.children!;

      if (currentPageIndex < children.length) {
        selectedPage = widget.children![currentPageIndex];
      }
    }

    return selectedPage;
  }

  List<NavigationDestination> _buildNavigationDestinationList() {
    return widget.destinations.map<NavigationDestination>((destination) {
      return destination.toNavigationDestination();
    }).toList();
  }

  List<NavigationRailDestination> _buildNavigationRailDestinationList() {
    return widget.destinations.map<NavigationRailDestination>((destination) {
      return destination.toNavigationRailDestination();
    }).toList();
  }
}
