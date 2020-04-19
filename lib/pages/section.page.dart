import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:tbloc_dart/core/base/bloc_provider.dart';

const _kContentPadding = kFastEdgeInsets16;
const _kHeaderPadding = EdgeInsets.symmetric(horizontal: 16.0);
const _kMargin = EdgeInsets.only(bottom: 16.0);
const _kElevation = 0.0;

class FastSectionPage extends StatelessWidget {
  final String titleText;
  final EdgeInsets contentPadding;
  final Widget child;
  final Widget leading;
  final List<Widget> actions;
  final bool isViewScrollable;

  FastSectionPage({
    Key key,
    this.child,
    this.contentPadding = _kContentPadding,
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
        leading: leading,
        iconTheme: IconThemeData(
          color: themeBloc.currentState.brightness == Brightness.light
              ? Theme.of(context).textTheme.body1.color
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
    Widget content = Padding(
      padding: contentPadding,
      child: child,
    );

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
            child: FastHeadline(text: titleText),
            padding: _kHeaderPadding,
            margin: _kMargin,
          ),
        content,
      ],
    );
  }

  ListView _builScrollableContent() {
    return ListView(
      children: <Widget>[
        _buildFixedContent(),
      ],
    );
  }
}
