import 'dart:ui';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastPendingReadOnlyTextField extends StatefulWidget {
  final String labelText;
  final String captionText;
  final String placeholderText;
  final String helperText;
  final TextAlign textAlign;
  final String valueText;
  final String pendingText;
  final bool useFontForNumber;
  final Widget child;
  final bool enableInteractiveSelection;
  final bool isPending;

  FastPendingReadOnlyTextField({
    Key key,
    @required this.labelText,
    this.captionText,
    this.placeholderText,
    this.helperText,
    this.valueText,
    this.textAlign,
    bool useFontForNumber = false,
    this.child,
    bool enableInteractiveSelection = true,
    bool isPending = false,
    this.pendingText,
  })  : assert(labelText != null),
        isPending = isPending ?? false,
        enableInteractiveSelection = enableInteractiveSelection ?? true,
        useFontForNumber = useFontForNumber ?? false,
        super(key: key);

  @override
  _FastPendingReadOnlyTextFieldState createState() =>
      _FastPendingReadOnlyTextFieldState();
}

class _FastPendingReadOnlyTextFieldState
    extends State<FastPendingReadOnlyTextField>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );

    final CurvedAnimation curve = CurvedAnimation(
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
      child: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context, Widget child) {
              return Opacity(
                opacity: _animation.value,
                child: child,
              );
            },
            child: FastBody(
              text: widget.isPending && widget.pendingText != null
                  ? widget.pendingText
                  : widget.valueText ?? widget.placeholderText,
              enableInteractiveSelection: widget.enableInteractiveSelection,
              textAlign: widget.textAlign,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (widget.isPending)
            Positioned(
              height: 37,
              bottom: 0,
              left: 0,
              right: 0,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                child: Container(color: Colors.black.withOpacity(0)),
              ),
            ),
        ],
      ),
    );
  }

  _animate(bool shouldAnimate) {
    if (shouldAnimate) {
      _controller.repeat(reverse: true);
    } else {
      _controller.reset();
    }
  }
}
