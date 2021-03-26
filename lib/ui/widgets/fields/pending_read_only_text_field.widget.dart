import 'dart:ui';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastPendingReadOnlyTextField extends StatefulWidget {
  final bool enableInteractiveSelection;
  final bool showHelperBoundaries;
  final String placeholderText;
  final Color? helperTextColor;
  final Color? valueTextColor;
  final bool useFontForNumber;
  final TextAlign textAlign;
  final String? captionText;
  final String? pendingText;
  final String? helperText;
  final String? valueText;
  final String labelText;
  final bool isPending;

  FastPendingReadOnlyTextField({
    Key? key,
    required this.labelText,
    this.placeholderText = kFastEmptyString,
    this.enableInteractiveSelection = true,
    this.showHelperBoundaries = true,
    this.textAlign = TextAlign.left,
    this.useFontForNumber = false,
    this.isPending = false,
    this.helperTextColor,
    this.valueTextColor,
    this.pendingText,
    this.captionText,
    this.helperText,
    this.valueText,
  }) : super(key: key);

  @override
  _FastPendingReadOnlyTextFieldState createState() =>
      _FastPendingReadOnlyTextFieldState();
}

class _FastPendingReadOnlyTextFieldState
    extends State<FastPendingReadOnlyTextField>
    with SingleTickerProviderStateMixin {
  static const _animationDuration = Duration(milliseconds: 750);
  static final _blurWidget = Positioned(
    height: 37,
    bottom: 0,
    left: 0,
    right: 0,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
      child: Container(color: Colors.transparent),
    ),
  );

  late AnimationController _controller;
  late Animation<double> _animation;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _animation = Tween(begin: 1.0, end: 0.25).animate(curve);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      _animate(widget.isPending);
      _initialized = true;
    }
  }

  @override
  void didUpdateWidget(FastPendingReadOnlyTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isPending != oldWidget.isPending) {
      _animate(widget.isPending);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FastReadOnlyTextField(
      labelText: widget.labelText,
      captionText: widget.captionText,
      helperText: widget.helperText,
      helperTextColor: widget.helperTextColor,
      showHelperBoundaries: widget.showHelperBoundaries,
      child: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context, Widget? child) {
              return Opacity(opacity: _animation.value, child: child);
            },
            child: FastBody(
              text: widget.isPending && widget.pendingText != null
                  ? widget.pendingText!
                  : widget.valueText ?? widget.placeholderText,
              textColor: widget.valueTextColor,
              enableInteractiveSelection: widget.enableInteractiveSelection,
              textAlign: widget.textAlign,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (widget.isPending) _blurWidget,
        ],
      ),
    );
  }

  void _animate(bool shouldAnimate) {
    if (shouldAnimate) {
      _controller.repeat(reverse: true);
    } else {
      _controller.reset();
    }
  }
}
