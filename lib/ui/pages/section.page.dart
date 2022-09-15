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
  ///
  /// The padding for the page.
  ///
  final bool isTitlePositionBelowAppBar;

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
  /// A button displayed floating above body, in the bottom right corner.
  ///
  final Widget? floatingActionButton;

  ///
  /// The AppBar background color.
  ///
  final Color? appBarBackgroundColor;

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
  final EdgeInsets contentPadding;

  ///
  /// Indicates the size of the app bar.
  ///
  final Size appBarHeightSize;

  ///
  /// A list of Widgets to display in a row after the title.
  ///
  final List<Widget>? actions;

  ///
  /// Indicates whether the view is scrollable.
  ///
  final bool isViewScrollable;

  ///
  /// The widget used to close the page.
  ///
  final Widget? closeButton;

  ///
  /// The widget used to go back to the previous page.
  ///
  final Widget? backButton;

  ///
  /// The title of the page.
  ///
  final String? titleText;

  ///
  /// Title's color.
  ///
  final Color? titleColor;

  ///
  /// A widget to display before the title.
  ///
  final Widget? leading;

  ///
  /// A widget used as the page footer.
  ///
  final Widget? footer;

  ///
  /// The child contained by the section page.
  ///
  final Widget? child;

  FastSectionPage({
    Key? key,
    this.appBarHeightSize = _kAppBarHeightSize,
    this.contentPadding = kFastEdgeInsets16,
    this.isTitlePositionBelowAppBar = true,
    this.isViewScrollable = false,
    this.appBarBackgroundColor,
    this.floatingActionButton,
    this.loadingTimeout,
    this.contentBuilder,
    this.loadingBuilder,
    this.footerBuilder,
    this.loadingFuture,
    this.errorBuilder,
    this.closeButton,
    this.backButton,
    this.titleColor,
    this.titleText,
    this.actions,
    this.leading,
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
          loadingTimeout: loadingTimeout,
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }

  Widget _buildAppBar(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);
    final brightness = themeBloc.currentState.brightness;
    final palette = ThemeHelper.getPaletteColors(context);
    final overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : ThemeHelper.colors.getOverlayStyleForColor(
            context: context,
            color: appBarBackgroundColor ??
                ThemeHelper.colors.getSecondaryBackgroundColor(context),
          );

    return AppBar(
      systemOverlayStyle: overlayStyle,
      automaticallyImplyLeading: false,
      leading: leading ?? _buildLeadingIcon(context),
      iconTheme: IconThemeData(
        color: themeBloc.currentState.brightness == Brightness.light
            ? ThemeHelper.texts.getBodyTextStyle(context).color
            : palette.whiteColor,
      ),
      backgroundColor: appBarBackgroundColor ?? Colors.transparent,
      elevation: _kElevation,
      actions: actions,
      title: !isTitlePositionBelowAppBar && titleText != null
          ? FastTitle(text: titleText!, textColor: titleColor, fontSize: 28.0)
          : null,
      centerTitle: false,
    );
  }

  Widget? _buildLeadingIcon(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final canPop = parentRoute?.canPop ?? false;

    Widget? leading;

    if (canPop) {
      final useCloseButton =
          parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

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
