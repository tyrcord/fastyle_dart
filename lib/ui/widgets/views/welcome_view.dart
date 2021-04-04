import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

const _kStepDotSize = 10.0;

typedef BoolCallback = bool Function();

class FastWelcomeView extends StatefulWidget {
  final FastWelcomeViewController? controller;

  ///
  /// Main widget when the application starts up.
  ///
  final WidgetBuilder homeBuilder;
  final VoidCallback? onDone;
  final VoidCallback? onSkip;
  final Color? stepDotColor;
  final List<Widget> slides;
  final double stepDotSize;
  final bool allowToSkip;
  final String doneText;
  final String nextText;
  final String skipText;

  const FastWelcomeView({
    Key? key,
    required this.homeBuilder,
    required this.slides,
    this.stepDotSize = _kStepDotSize,
    this.doneText = kFastDoneText,
    this.nextText = kFastNextText,
    this.skipText = kFastSkipText,
    this.allowToSkip = false,
    this.stepDotColor,
    this.controller,
    this.onDone,
    this.onSkip,
  }) : super(key: key);

  @override
  _FastWelcomeViewState createState() => _FastWelcomeViewState();
}

class _FastWelcomeViewState extends State<FastWelcomeView> {
  final PageController _pageViewController = PageController();
  late FastWelcomeViewController _controller;
  int _slidesLength = 0;
  int _pageCursor = 0;

  bool get hasReachEnd => _pageCursor + 1 == _slidesLength;

  @override
  void initState() {
    _controller = widget.controller ?? FastWelcomeViewController();
    _slidesLength = widget.slides.length;
    _pageViewController.addListener(() {
      setState(() => _pageCursor = _pageViewController.page!.round());
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);
    final brightness = themeBloc.currentState.brightness;
    final overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Scaffold(
        body: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: _controller,
            builder: (BuildContext context, bool isPending, Widget? child) {
              return IgnorePointer(
                ignoring: isPending,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: PageView.builder(
                        controller: _pageViewController,
                        itemCount: _slidesLength,
                        itemBuilder: (BuildContext context, int index) {
                          return widget.slides[index];
                        },
                      ),
                    ),
                    _buildStepper(context, isPending),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStepper(BuildContext context, bool isPending) {
    final canShowSkipButton = widget.allowToSkip && !hasReachEnd;

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildSteps(context),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: _buildButtonLayout(
            FastTextButton(
              onTap: () {
                if (hasReachEnd) {
                  _onDone();
                } else {
                  _pageViewController.nextPage(
                    duration: kTabScrollDuration,
                    curve: Curves.ease,
                  );
                }
              },
              text: hasReachEnd ? widget.doneText : widget.nextText,
              isEnabled: !isPending,
            ),
          ),
        ),
        if (canShowSkipButton)
          _buildButtonLayout(
            FastTextButton(onTap: _onSkip, text: widget.skipText),
          ),
      ],
    );
  }

  List<Widget> _buildSteps(BuildContext context) {
    final primaryColor =
        widget.stepDotColor ?? ThemeHelper.colors.getPrimaryColor(context);

    return List<Widget>.generate(
      _slidesLength,
      (index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: widget.stepDotSize,
        width: widget.stepDotSize,
        decoration: BoxDecoration(
          color: _pageCursor == index
              ? primaryColor
              : primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(widget.stepDotSize),
        ),
      ),
    );
  }

  Widget _buildButtonLayout(Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: child,
    );
  }

  void _onSkip() {
    if (widget.onSkip != null) {
      widget.onSkip!();
    }

    _done();
  }

  void _onDone() {
    if (widget.onDone != null) {
      widget.onDone!();
    }

    _done();
  }

  void _done() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: widget.homeBuilder),
    );
  }
}
