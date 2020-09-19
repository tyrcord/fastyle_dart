import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

const _kStepDotSize = 10.0;
const _kDoneText = 'done';
const _kNextText = 'next';
const _kSkipText = 'skip';

typedef BoolCallback = bool Function();

class FastWelcomeView extends StatefulWidget {
  final List<Widget> slides;
  final bool allowToSkip;
  final double stepDotSize;
  final Color stepDotColor;
  final WidgetBuilder homeBuilder;
  final BoolCallback canSkip;
  final BoolCallback canTerminate;
  final VoidCallback onDone;
  final VoidCallback onSkip;
  final String doneText;
  final String nextText;
  final String skipText;
  final FastWelcomeViewController controller;

  const FastWelcomeView({
    Key key,
    @required this.homeBuilder,
    @required this.slides,
    bool allowToSkip = false,
    this.canSkip,
    this.canTerminate,
    double stepDotSize = _kStepDotSize,
    String doneText = _kDoneText,
    String nextText = _kNextText,
    String skipText = _kSkipText,
    this.stepDotColor,
    this.onDone,
    this.onSkip,
    this.controller,
  })  : assert(homeBuilder != null),
        assert(slides != null),
        this.allowToSkip = allowToSkip ?? false,
        this.doneText = doneText ?? _kDoneText,
        this.nextText = nextText ?? _kNextText,
        this.skipText = skipText ?? _kSkipText,
        this.stepDotSize = stepDotSize ?? _kStepDotSize,
        super(key: key);

  @override
  _FastWelcomeViewState createState() => _FastWelcomeViewState();
}

class _FastWelcomeViewState extends State<FastWelcomeView> {
  PageController _pageViewController = PageController();
  FastWelcomeViewController _controller;
  int _pageCursor = 0;
  int _slidesLength = 0;

  bool get hasReachEnd => _pageCursor + 1 == _slidesLength;

  @override
  void initState() {
    _controller = widget.controller ?? FastWelcomeViewController();
    _slidesLength = widget.slides?.length ?? 0;
    _pageViewController.addListener(() {
      setState(() => _pageCursor = _pageViewController.page.round());
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
    final SystemUiOverlayStyle overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Scaffold(
        body: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: _controller,
            builder: (BuildContext context, bool isPending, Widget child) {
              return IgnorePointer(
                ignoring: isPending,
                child: Column(
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Opacity(
          child: FastTextButton(onTap: _onSkip, text: widget.skipText),
          opacity: widget.allowToSkip && !hasReachEnd ? 1 : 0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildSteps(context),
        ),
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

  void _onSkip() {
    if (widget.onSkip != null) {
      widget.onSkip();
    }

    _done();
  }

  void _onDone() {
    if (widget.onDone != null) {
      widget.onDone();
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
