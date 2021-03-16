import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

const _kExpandedHeight = 160.0;
const _kHeaderPadding = 16.0;
const _kContentPadding = EdgeInsets.symmetric(vertical: _kHeaderPadding);

class FastHomePage extends StatefulWidget {
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
  final double expandedHeight;

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

  FastHomePage({
    Key? key,
    required this.children,
    this.expandedHeight = _kExpandedHeight,
    this.contentPadding = _kContentPadding,
    this.floatingActionButton,
    this.subtitleText,
    this.titleText,
    this.actions,
    this.leading,
  })  : assert(
          expandedHeight >= _kExpandedHeight ? true : false,
        ),
        super(key: key);

  @override
  _FastHomePageState createState() => _FastHomePageState();
}

class _FastHomePageState extends State<FastHomePage> {
  final ScrollController _scrollController = ScrollController();
  final _leadingKey = GlobalKey();
  final _subtitleKey = GlobalKey();

  EdgeInsetsGeometry? _titlePadding;
  double _subtitleOpacity = 1.0;
  bool _showSubtitle = true;
  Size? _subtitleSize;
  Size? _leadingSize;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback(_onAfterLayout);
    _scrollController.addListener(_onScrollNoticiation);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onAfterLayout(Duration duration) {
    RenderBox? leadingRenderBox;
    RenderBox? subtitleRenderBox;

    if (widget.leading != null) {
      final leadingContext = _leadingKey.currentContext!;
      leadingRenderBox = leadingContext.findRenderObject() as RenderBox?;
    }

    if (widget.subtitleText != null) {
      final subtitleContext = _subtitleKey.currentContext!;
      subtitleRenderBox = subtitleContext.findRenderObject() as RenderBox?;
    }

    setState(() {
      _leadingSize = leadingRenderBox?.size;
      _subtitleSize = subtitleRenderBox?.size;
      _setTitlePadding();
    });
  }

  void _onScrollNoticiation() {
    if (_scrollController.hasClients) {
      final threshold = widget.expandedHeight - kToolbarHeight;
      final offset = _scrollController.offset;

      if ((offset >= 0 && offset <= threshold) || _subtitleOpacity > 0) {
        final distance = threshold - _scrollController.offset;
        final showSubtitle = offset < threshold;
        final multiplier = _sanitizeOpacity(distance / threshold);

        if (showSubtitle != _showSubtitle || multiplier != _subtitleOpacity) {
          setState(() {
            _showSubtitle = showSubtitle;
            _subtitleOpacity = multiplier;
            _setTitlePadding(multiplier: multiplier);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        slivers: <Widget>[
          _buildAppBar(context),
          _buildContent(),
        ],
      ),
      floatingActionButton: widget.floatingActionButton,
    );
  }

  Widget _buildAppBar(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);
    final gradient = ThemeHelper.gradients.primaryLinearGradient(context);
    final brightness = themeBloc.currentState.brightness;

    return SliverAppBar(
      leading: Container(key: _leadingKey, child: widget.leading),
      expandedHeight: widget.expandedHeight,
      backgroundColor: Colors.transparent,
      actions: widget.actions,
      stretch: true,
      pinned: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: _buildFlexibleSpaceBar(context),
      ),
      brightness: brightness == Brightness.dark
          ? Brightness.dark
          : ThemeHelper.gradients.getBrightnessForGradient(
              context: context,
              gradient: gradient,
            ),
    );
  }

  Widget _buildFlexibleSpaceBar(BuildContext context) {
    final _textColor = ThemeHelper.colors.getColorWithBestConstrast(
      context: context,
      darkColor: ThemeHelper.texts.getTitleTextStyle(context).color!,
      lightColor: ThemeHelper.colors.getWhiteColor(context),
    );

    return SafeArea(
      bottom: false,
      top: false,
      child: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: _titlePadding,
        title: widget.titleText != null
            ? FastTitle(
                text: widget.titleText!,
                textColor: _textColor,
                maxLines: 1,
              )
            : null,
        background: widget.subtitleText != null
            ? _buildFlexibleSpaceBarBackground(_textColor)
            : null,
      ),
    );
  }

  Widget _buildFlexibleSpaceBarBackground(Color textColor) {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.only(bottom: _kHeaderPadding),
      padding: const EdgeInsets.symmetric(horizontal: _kHeaderPadding),
      child: Opacity(
        opacity: _subtitleOpacity,
        child: FastBody(
          key: _subtitleKey,
          text: widget.subtitleText!,
          textColor: textColor,
        ),
      ),
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

  void _setTitlePadding({double multiplier = 1.0}) {
    var offsetLeft = 0.0;
    var offsetBottom = 0.0;

    if (widget.leading != null) {
      final subtitleSizeHeight = _subtitleSize?.height ?? 0;
      final leadingWidth = _leadingSize!.width - _kHeaderPadding;
      offsetLeft = leadingWidth - leadingWidth * multiplier;
      offsetBottom = (_kHeaderPadding / 2 + subtitleSizeHeight) * multiplier;
    }

    _titlePadding = EdgeInsets.only(
      right: _kHeaderPadding,
      left: _kHeaderPadding + offsetLeft,
      bottom: _kHeaderPadding + offsetBottom,
    );
  }

  double _sanitizeOpacity(double opacity) {
    if (opacity.isNegative) {
      opacity = 0.0;
    } else if (opacity > 1) {
      opacity = 1.0;
    }

    return opacity;
  }
}
