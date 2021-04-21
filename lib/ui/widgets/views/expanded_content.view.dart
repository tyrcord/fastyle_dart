import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastExpansionPanel extends StatefulWidget {
  final Duration animationDuration;
  final WidgetBuilder bodyBuilder;
  final IconData headerIcon;
  final String titleText;
  final Color? textColor;
  final bool isExpanded;
  final bool isEnabled;

  const FastExpansionPanel({
    Key? key,
    required this.bodyBuilder,
    this.animationDuration = const Duration(milliseconds: 300),
    this.headerIcon = Icons.expand_more,
    this.titleText = kFastPanelText,
    this.isExpanded = false,
    this.isEnabled = true,
    this.textColor,
  }) : super(key: key);

  @override
  _FastExpansionPanelState createState() => _FastExpansionPanelState();
}

class _FastExpansionPanelState extends State<FastExpansionPanel>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotationController = AnimationController(
    duration: widget.animationDuration,
    vsync: this,
    upperBound: 0.5,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _rotationController,
    curve: Curves.easeInOut,
  );

  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeader(),
        AnimatedCrossFade(
          duration: widget.animationDuration,
          firstChild: Container(),
          secondChild: Builder(builder: widget.bodyBuilder),
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        ),
      ],
    );
  }

  Widget _buildHeader() {
    final textColor = widget.textColor ??
        ThemeHelper.texts.getButtonTextStyle(context).color!;
    final color = widget.isEnabled ? textColor : textColor.withAlpha(155);

    return GestureDetector(
      onTap: () {
        if (widget.isEnabled && !_rotationController.isAnimating) {
          setState(() {
            if (isExpanded) {
              _rotationController.reverse();
            } else {
              _rotationController.forward();
            }

            isExpanded = !isExpanded;
          });
        }
      },
      behavior: HitTestBehavior.opaque,
      child: FastButtonLayout(
        child: Stack(
          children: [
            Container(
              constraints: BoxConstraints(minHeight: kFastIconSizeMedium),
              child: Center(
                child: FastButtonLabel(
                  text: widget.titleText,
                  textColor: color,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: RotationTransition(
                turns: _animation,
                child: Icon(
                  widget.headerIcon,
                  size: kFastIconSizeMedium,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
