import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastPageLayout extends StatelessWidget {
  ///
  /// Function that creates a widget when the page is loading.
  ///
  final WidgetBuilder? loadingBuilder;

  ///
  /// Function that creates a widget for the page content.
  ///
  final WidgetBuilder? contentBuilder;

  ///
  /// Function that creates a widget for the page footer.
  ///
  final WidgetBuilder? footerBuilder;

  ///
  /// Function that creates a widget
  /// when the page has failed to load its content.
  ///
  final WidgetBuilder? errorBuilder;

  ///
  /// A future used to load the page.
  ///
  final Future<bool>? loadingFuture;

  ///
  /// Maximum time for loading the page.
  ///
  final Duration? loadingTimeout;

  ///
  /// The padding for the page.
  ///
  final EdgeInsets? contentPadding;

  ///
  /// Indicates whether the view is scrollable.
  ///
  final bool isViewScrollable;

  ///
  /// A widget used as the page footer.
  ///
  final Widget? footer;

  ///
  /// The child contained by the section page.
  ///
  final Widget? child;

  ///
  /// The title of the page.
  ///
  final String? titleText;

  ///
  /// Title's color.
  ///
  final Color? titleColor;

  FastPageLayout({
    Key? key,
    this.isViewScrollable = false,
    this.contentPadding,
    this.loadingTimeout,
    this.contentBuilder,
    this.loadingBuilder,
    this.footerBuilder,
    this.loadingFuture,
    this.errorBuilder,
    this.titleColor,
    this.titleText,
    this.footer,
    this.child,
  })  : assert(
          contentBuilder == null || child == null,
          'contentBuilder and child properties '
          'should not be initialized together',
        ),
        assert(
          footerBuilder == null || footer == null,
          'footerBuilder and footer properties '
          'should not be initialized together',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: FastSectionPageController(
        loadedBuilder: _buildPageContent(),
        loadingBuilder: loadingBuilder,
        errorBuilder: errorBuilder,
        loadingFuture: loadingFuture,
        loadingTimeout: loadingTimeout,
      ),
    );
  }

  WidgetBuilder _buildPageContent() {
    return (BuildContext context) {
      if (isViewScrollable) {
        return _builScrollableContent(context);
      }

      return _buildFixedContent(context);
    };
  }

  Widget _buildFixedContent(BuildContext context) {
    var content = _buildContent(context);

    if (!isViewScrollable) {
      content = Expanded(child: content);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (titleText != null)
          Container(
            padding: ThemeHelper.spacing.getHorizontalPadding(context),
            margin: ThemeHelper.spacing.getVerticalPadding(context),
            child: FastHeadline(textColor: titleColor, text: titleText!),
          ),
        content,
        if (!isViewScrollable && (footer != null || footerBuilder != null))
          _buildFooter(context),
      ],
    );
  }

  CustomScrollView _builScrollableContent(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildFixedContent(context)),
        if (footer != null || footerBuilder != null)
          SliverFillRemaining(
            hasScrollBody: false,
            child: _buildFooter(context),
          ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    final padding = _getContentPadding(context);

    return Padding(
      padding: footer == null
          ? padding.copyWith(bottom: _getBottomPadding(context))
          : padding.copyWith(bottom: 0.0),
      child: contentBuilder != null ? Builder(builder: contentBuilder!) : child,
    );
  }

  Widget _buildFooter(BuildContext context) {
    final spacing = ThemeHelper.spacing.getSpacing(context);
    final mediaQueryData = MediaQuery.of(context);
    final padding = _getContentPadding(context);

    return Padding(
      padding: padding.copyWith(
        bottom: mediaQueryData.padding.bottom + spacing,
        top: 0.0,
      ),
      child: footerBuilder != null ? Builder(builder: footerBuilder!) : footer,
    );
  }

  double _getBottomPadding(BuildContext context) {
    if (isViewScrollable) {
      final spacing = ThemeHelper.spacing.getSpacing(context);
      final mediaQueryData = MediaQuery.of(context);

      return mediaQueryData.padding.bottom + spacing;
    }

    return 0.0;
  }

  EdgeInsets _getContentPadding(BuildContext context) {
    if (contentPadding != null) {
      return contentPadding!;
    }

    return ThemeHelper.spacing.getPadding(context);
  }
}