import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

const _kExpandedHeight = 160.0;
const _kHeaderPadding = 16.0;
const _kContentPadding = EdgeInsets.symmetric(vertical: _kHeaderPadding);

class FastHomePage extends StatefulWidget {
  final String titleText;
  final String subtitleText;
  final List<Widget> children;
  final Widget floatingActionButton;
  final EdgeInsetsGeometry contentPadding;
  final List<Widget> actions;
  final double expandedHeight;
  final Widget leading;

  FastHomePage({
    Key key,
    this.titleText,
    this.subtitleText,
    this.children,
    this.actions,
    this.leading,
    this.floatingActionButton,
    this.expandedHeight,
    this.contentPadding,
  })  : assert(
          expandedHeight != null ? expandedHeight >= _kExpandedHeight : true,
        ),
        super(key: key);

  @override
  _FastHomePageState createState() => _FastHomePageState();
}

class _FastHomePageState extends State<FastHomePage> {
  final _leadingKey = GlobalKey();
  final _subtitleKey = GlobalKey();

  double get _expandedHeight => widget.expandedHeight ?? _kExpandedHeight;
  ScrollController _scrollController;
  EdgeInsetsGeometry _titlePadding;
  double _subtitleOpacity = 1.0;
  bool _showSubtitle = true;
  Size _leadingSize;
  Size _subtitleSize;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(_onAfterLayout);
    _scrollController = ScrollController()..addListener(_onScrollNoticiation);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onAfterLayout(Duration duration) {
    final leadingContext = _leadingKey.currentContext;
    final subtitleContext = _subtitleKey.currentContext;
    RenderBox leadingRenderBox;
    RenderBox subtitleRenderBox;

    if (widget.leading != null) {
      leadingRenderBox = leadingContext.findRenderObject() as RenderBox;
    }

    if (widget.subtitleText != null) {
      subtitleRenderBox = subtitleContext.findRenderObject() as RenderBox;
    }

    setState(() {
      _leadingSize = leadingRenderBox?.size;
      _subtitleSize = subtitleRenderBox?.size;
      _setTitlePadding();
    });
  }

  void _onScrollNoticiation() {
    if (_scrollController.hasClients) {
      final threshold = _expandedHeight - kToolbarHeight;
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
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: _expandedHeight,
      stretch: true,
      pinned: true,
      leading: Container(
        child: widget.leading,
        key: _leadingKey,
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: ThemeHelper.gradients.primaryLinearGradient(context),
        ),
        child: _buildFlexibleSpaceBar(context),
      ),
      actions: widget.actions,
    );
  }

  Widget _buildFlexibleSpaceBar(BuildContext context) {
    final _textColor = ThemeHelper.colors.getColorWithBestConstrast(
      context: context,
      darkColor: ThemeHelper.texts.getTitleTextStyle(context).color,
      lightColor: ThemeHelper.colors.getWhiteColor(context),
    );

    return SafeArea(
      bottom: false,
      top: false,
      child: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: _titlePadding,
        title: FastTitle(
          text: widget.titleText,
          textColor: _textColor,
          maxLines: 1,
        ),
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
          text: widget.subtitleText,
          textColor: textColor,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return SliverSafeArea(
      top: false,
      sliver: SliverPadding(
        padding: widget.contentPadding ?? _kContentPadding,
        sliver: SliverList(delegate: SliverChildListDelegate(widget.children)),
      ),
    );
  }

  void _setTitlePadding({double multiplier = 1.0}) {
    var offsetLeft = 0.0;
    var offsetBottom = 0.0;

    if (widget.leading != null) {
      final subtitleSizeHeight = _subtitleSize?.height ?? 0;
      final leadingWidth = _leadingSize.width - _kHeaderPadding;
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
