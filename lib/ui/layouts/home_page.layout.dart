import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kHeaderPadding = 16.0;
const _kContentPadding = EdgeInsets.symmetric(vertical: _kHeaderPadding);

class FastHomePageLayout extends StatefulWidget {
  ///
  /// The padding for the page.
  ///
  final EdgeInsetsGeometry contentPadding;

  ///
  /// A button displayed floating above body, in the bottom right corner.
  ///
  final Widget? floatingActionButton;

  ///
  /// The widgets below the app bar in the tree.
  ///
  final List<Widget> children;

  ///
  /// The size of the app bar when it is fully expanded.
  ///
  final double appBarExpandedHeight;

  ///
  /// A list of Widgets to display in a row after the title.
  ///
  final List<Widget>? actions;

  ///
  /// Text displayed below the title.
  /// Typically, a description of the current contents of the app.
  ///
  final String? subtitleText;

  ///
  /// Title of the app.
  ///
  final String? titleText;

  ///
  /// A widget to display before the toolbar's title.
  ///
  final Widget? leading;

  final LinearGradient? appBarBackgroundLinearGradient;

  final Color? appBarBackgroundColor;

  final Widget? appBarDecoration;

  final ScrollController? scrollController;

  FastHomePageLayout({
    Key? key,
    required this.children,
    this.appBarExpandedHeight = kFastExpandedHeight,
    this.contentPadding = _kContentPadding,
    this.appBarBackgroundLinearGradient,
    this.appBarBackgroundColor,
    this.floatingActionButton,
    this.appBarDecoration,
    this.scrollController,
    this.subtitleText,
    this.titleText,
    this.actions,
    this.leading,
  })  : assert(
          appBarExpandedHeight >= kFastExpandedHeight ? true : false,
        ),
        super(key: key);

  @override
  _FastHomePageLayoutState createState() => _FastHomePageLayoutState();
}

class _FastHomePageLayoutState extends State<FastHomePageLayout> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          FastAppBarLayout(
            backgroundLinearGradient: widget.appBarBackgroundLinearGradient,
            backgroundColor: widget.appBarBackgroundColor,
            expandedHeight: widget.appBarExpandedHeight,
            decoration: widget.appBarDecoration,
            subtitleText: widget.subtitleText,
            titleText: widget.titleText,
            actions: widget.actions,
            leading: widget.leading,
            scrollController: _scrollController,
          ),
          _buildContent(),
        ],
      ),
      floatingActionButton: widget.floatingActionButton,
    );
  }

  Widget _buildContent() {
    return SliverSafeArea(
      top: false,
      sliver: SliverPadding(
        sliver: SliverList(delegate: SliverChildListDelegate(widget.children)),
        padding: widget.contentPadding,
      ),
    );
  }
}
