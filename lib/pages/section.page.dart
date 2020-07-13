import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';
import 'package:flutter/material.dart';

const _kContentPadding = kFastEdgeInsets16;
const _kHeaderPadding = EdgeInsets.symmetric(horizontal: 16.0);
const _kMargin = EdgeInsets.symmetric(vertical: 16.0);
const _kElevation = 0.0;
const _kAppBarHeightSize = Size.fromHeight(kToolbarHeight);

class FastSectionPage extends StatelessWidget {
  final String titleText;
  final Color titleColor;
  final EdgeInsets contentPadding;
  final Widget child;
  final Widget footer;
  final Widget leading;
  final List<Widget> actions;
  final bool isViewScrollable;
  final Widget floatingActionButton;
  final Color appBarbackgroundColor;
  final isTitlePositionBelowAppBar;
  final Size appBarHeightSize;
  final bool isLoading;

  FastSectionPage({
    Key key,
    this.child,
    this.footer,
    this.titleColor,
    this.contentPadding,
    this.titleText,
    this.actions,
    this.leading,
    this.isViewScrollable = false,
    this.floatingActionButton,
    this.appBarbackgroundColor,
    this.isTitlePositionBelowAppBar = true,
    this.isLoading = false, // BETA
    this.appBarHeightSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: appBarHeightSize ?? _kAppBarHeightSize,
        child: AppBar(
          brightness: themeBloc.currentState.brightness,
          leading: leading,
          iconTheme: IconThemeData(
            color: themeBloc.currentState.brightness == Brightness.light
                ? ThemeHelper.texts.getBodyTextStyle(context).color
                : ThemeHelper.colors.getWhiteColor(context),
          ),
          backgroundColor: appBarbackgroundColor ?? Colors.transparent,
          elevation: _kElevation,
          actions: actions,
          title: !isTitlePositionBelowAppBar
              ? FastTitle(
                  text: titleText,
                  textColor: titleColor,
                  fontSize: 28.0,
                )
              : null,
          centerTitle: false,
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: !isLoading
            ? _buildPageContent(context)
            : FusexThreeBounceIndicator(),
      ),
      floatingActionButton: floatingActionButton,
    );
  }

  Widget _buildPageContent(BuildContext context) {
    if (isViewScrollable) {
      return _builScrollableContent(context);
    }

    return _buildFixedContent(context);
  }

  Widget _buildFixedContent(BuildContext context) {
    Widget content = _buildContent(context);

    if (!isViewScrollable) {
      content = Expanded(
        child: content,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (titleText != null && isTitlePositionBelowAppBar)
          Container(
            child: FastHeadline(
              text: titleText,
              textColor: titleColor,
            ),
            padding: _kHeaderPadding,
            margin: _kMargin,
          ),
        content,
        if (!isViewScrollable && footer != null) _buildFooter(context),
      ],
    );
  }

  CustomScrollView _builScrollableContent(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _buildFixedContent(context),
        ),
        if (footer != null)
          SliverFillRemaining(
            hasScrollBody: false,
            child: _buildFooter(context),
          ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    final padding = contentPadding ?? _kContentPadding;

    return Padding(
      padding: footer == null
          ? padding.copyWith(bottom: _getBottomPadding(context))
          : padding.copyWith(bottom: 0.0),
      child: child,
    );
  }

  Widget _buildFooter(BuildContext context) {
    final padding = contentPadding ?? _kContentPadding;
    final mediaQueryData = MediaQuery.of(context);

    return Padding(
      padding: padding.copyWith(
        top: 0.0,
        bottom: mediaQueryData.padding.bottom,
      ),
      child: footer,
    );
  }

  double _getBottomPadding(BuildContext context) {
    if (isViewScrollable) {
      final mediaQueryData = MediaQuery.of(context);
      return mediaQueryData.padding.bottom;
    }

    return 0.0;
  }
}
