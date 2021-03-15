import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _kHeaderPadding = EdgeInsets.symmetric(horizontal: 16.0);
const _kAppBarHeightSize = Size.fromHeight(kToolbarHeight);
const _kMargin = EdgeInsets.symmetric(vertical: 16.0);
const _kBottomPaddingMin = 16.0;
const _kElevation = 0.0;

class FastSectionPage extends StatelessWidget {
  final String? titleText;
  final Color? titleColor;
  final EdgeInsets contentPadding;
  final Widget? child;
  final Widget? footer;
  final Widget? leading;
  final List<Widget>? actions;
  final bool isViewScrollable;
  final Widget? floatingActionButton;
  final Color? appBarBackgroundColor;
  final bool isTitlePositionBelowAppBar;
  final Size appBarHeightSize;
  final Widget? closeButton;
  final Widget? backButton;
  final Future<bool>? loadingFuture;
  final WidgetBuilder? loadingBuilder;
  final WidgetBuilder? errorBuilder;
  final WidgetBuilder? contentBuilder;
  final WidgetBuilder? footerBuilder;

  FastSectionPage({
    Key? key,
    this.appBarHeightSize = _kAppBarHeightSize,
    this.contentPadding = kFastEdgeInsets16,
    this.isTitlePositionBelowAppBar = true,
    this.isViewScrollable = false,
    this.titleColor,
    this.titleText,
    this.actions,
    this.leading,
    this.floatingActionButton,
    this.appBarBackgroundColor,
    this.closeButton,
    this.backButton,
    this.loadingBuilder,
    this.loadingFuture,
    this.errorBuilder,
    this.contentBuilder,
    this.footerBuilder,
    this.child,
    this.footer,
  })  : assert(
          contentBuilder == null || child == null,
          'contentBuilder and child properties '
          'should not be initialized together',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: appBarHeightSize,
        child: _buildAppBar(context),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: FastSectionPageController(
          loadedBuilder: _buildPageContent(),
          loadingBuilder: loadingBuilder,
          errorBuilder: errorBuilder,
          loadingFuture: loadingFuture,
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }

  Widget _buildAppBar(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);
    var brightness = themeBloc.currentState.brightness;
    brightness = brightness == Brightness.dark
        ? Brightness.dark
        : ThemeHelper.colors.getBrightnessForColor(
            context: context,
            color: appBarBackgroundColor ??
                ThemeHelper.colors.getBackGroundColor(context),
          );

    return AppBar(
      automaticallyImplyLeading: false,
      brightness: brightness,
      leading: leading ?? _buildLeadingIcon(context),
      iconTheme: IconThemeData(
        color: themeBloc.currentState.brightness == Brightness.light
            ? ThemeHelper.texts.getBodyTextStyle(context).color
            : ThemeHelper.colors.getWhiteColor(context),
      ),
      backgroundColor: appBarBackgroundColor ?? Colors.transparent,
      elevation: _kElevation,
      actions: actions,
      title: !isTitlePositionBelowAppBar && titleText != null
          ? FastTitle(
              text: titleText!,
              textColor: titleColor,
              fontSize: 28.0,
            )
          : null,
      centerTitle: false,
    );
  }

  Widget? _buildLeadingIcon(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final canPop = parentRoute?.canPop ?? false;
    final useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;
    Widget? leading;

    if (canPop) {
      leading = useCloseButton
          ? closeButton ?? const CloseButton()
          : backButton ?? const BackButton();
    }

    return leading;
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
        if (titleText != null && isTitlePositionBelowAppBar)
          Container(
            padding: _kHeaderPadding,
            margin: _kMargin,
            child: FastHeadline(
              textColor: titleColor,
              text: titleText!,
            ),
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
    return Padding(
      padding: footer == null
          ? contentPadding.copyWith(bottom: _getBottomPadding(context))
          : contentPadding.copyWith(bottom: 0.0),
      child: contentBuilder != null ? Builder(builder: contentBuilder!) : child,
    );
  }

  Widget _buildFooter(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return Padding(
      padding: contentPadding.copyWith(
        top: 0.0,
        bottom: mediaQueryData.padding.bottom + _kBottomPaddingMin,
      ),
      child: footerBuilder != null ? Builder(builder: footerBuilder!) : footer,
    );
  }

  double _getBottomPadding(BuildContext context) {
    if (isViewScrollable) {
      final mediaQueryData = MediaQuery.of(context);

      return mediaQueryData.padding.bottom + _kBottomPaddingMin;
    }

    return 0.0;
  }
}
