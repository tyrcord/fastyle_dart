import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

const _kExpandedHeight = 160.0;
const _kHeaderPadding = 16.0;
const _kContentPadding = const EdgeInsets.symmetric(vertical: _kHeaderPadding);

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
            expandedHeight != null ? expandedHeight >= _kExpandedHeight : true),
        super(key: key);

  @override
  _FastHomePageState createState() => _FastHomePageState();
}

class _FastHomePageState extends State<FastHomePage> {
  double get _expandedHeight => widget.expandedHeight ?? _kExpandedHeight;
  ScrollController _scrollController;
  GlobalKey _leadingKey = GlobalKey();
  GlobalKey _subtitleKey = GlobalKey();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        slivers: <Widget>[
          // TODO: Make FastSylverAppBar
          SliverAppBar(
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
          ),
          _buildContent(),
        ],
      ),
      floatingActionButton: widget.floatingActionButton,
    );
  }

  void _onAfterLayout(Duration duration) {
    final leadingContext = _leadingKey.currentContext;
    final subtitleContext = _subtitleKey.currentContext;
    final RenderBox leadingRenderBox = leadingContext.findRenderObject();
    final RenderBox subtitleRenderBox = subtitleContext.findRenderObject();

    setState(() {
      _leadingSize = leadingRenderBox.size;
      _subtitleSize = subtitleRenderBox.size;
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
        double multiplier = distance / threshold;
        multiplier = _sanitizeOpacity(multiplier);

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

  Widget _buildFlexibleSpaceBar(BuildContext context) {
    final theme = Theme.of(context);
    final _textColor = ThemeHelper.colors.getColorWithBestConstrast(
      context: context,
      darkColor: theme.textTheme.title.color,
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
        ),
        background: Container(
          alignment: Alignment.bottomLeft,
          margin: const EdgeInsets.only(bottom: _kHeaderPadding),
          padding: const EdgeInsets.symmetric(horizontal: _kHeaderPadding),
          child: Opacity(
            opacity: _subtitleOpacity,
            child: FastBody(
              key: _subtitleKey,
              text: widget.subtitleText,
              textColor: _textColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return SliverSafeArea(
      top: false,
      sliver: SliverPadding(
        padding: widget.contentPadding ?? _kContentPadding,
        sliver: SliverList(
          delegate: SliverChildListDelegate(widget.children),
        ),
      ),
    );
  }

  void _setTitlePadding({multiplier = 1.0}) {
    double offsetLeft = 0;
    double offsetBottom = 0;

    if (widget.leading != null) {
      double leadingWidth = _leadingSize.width - _kHeaderPadding;
      offsetLeft = leadingWidth - leadingWidth * multiplier;
      offsetBottom = (_kHeaderPadding / 2 + _subtitleSize.height) * multiplier;
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
