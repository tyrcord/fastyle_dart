import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:tbloc_dart/core/base/bloc_provider.dart';

const _kContentPadding = kFastEdgeInsets16;
const _kHeaderPadding = EdgeInsets.symmetric(horizontal: 16.0);
const _kMargin = EdgeInsets.only(bottom: 16.0);
const _kElevation = 0.0;

class FastSectionPage extends StatelessWidget {
  final String titleText;
  final Color titleColor;
  final EdgeInsets contentPadding;
  final Widget child;
  final Widget footer;
  final Widget leading;
  final List<Widget> actions;
  final bool isViewScrollable;

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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        brightness: themeBloc.currentState.brightness,
        leading: leading,
        iconTheme: IconThemeData(
          color: themeBloc.currentState.brightness == Brightness.light
              ? ThemeHelper.texts.getBodyTextStyle(context).color
              : ThemeHelper.colors.getWhiteColor(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: _kElevation,
        actions: actions,
      ),
      body: SafeArea(
        top: false,
        child: _buildPageContent(),
      ),
    );
  }

  Widget _buildPageContent() {
    if (isViewScrollable) {
      return _builScrollableContent();
    }

    return _buildFixedContent();
  }

  Widget _buildFixedContent() {
    Widget content = _buildContent();

    if (!isViewScrollable) {
      content = Expanded(
        child: content,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (titleText != null)
          Container(
            child: FastHeadline(
              text: titleText,
              textColor: titleColor,
            ),
            padding: _kHeaderPadding,
            margin: _kMargin,
          ),
        content,
        if (!isViewScrollable && footer != null) _buildFooter(),
      ],
    );
  }

  CustomScrollView _builScrollableContent() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _buildFixedContent(),
        ),
        if (footer != null)
          SliverFillRemaining(
            hasScrollBody: false,
            child: _buildFooter(),
          ),
      ],
    );
  }

  Widget _buildContent() {
    final padding = contentPadding ?? _kContentPadding;

    return Padding(
      padding: footer == null ? padding : padding.copyWith(bottom: 0.0),
      child: child,
    );
  }

  Widget _buildFooter() {
    final padding = contentPadding ?? _kContentPadding;

    return Padding(
      padding: padding.copyWith(top: 0.0),
      child: footer,
    );
  }
}
