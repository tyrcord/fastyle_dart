import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastExpansionPanel extends StatefulWidget {
  final Duration animationDuration;
  final WidgetBuilder bodyBuilder;
  final GestureTapCallback? onTap;
  final Color? titleTextColor;
  final IconData headerIcon;
  final String titleText;
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
    this.titleTextColor,
    this.onTap,
  }) : super(key: key);

  @override
  FastExpansionPanelState createState() => FastExpansionPanelState();
}

class FastExpansionPanelState extends State<FastExpansionPanel>
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
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildInteractiveHeader(context),
          AnimatedCrossFade(
            duration: widget.animationDuration,
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              padding: const EdgeInsets.only(top: 16),
              child: Builder(builder: widget.bodyBuilder),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        ],
      ),
    );
  }

  Widget _buildInteractiveHeader(BuildContext context) {
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

            if (widget.onTap != null) {
              widget.onTap!();
            }
          });
        }
      },
      behavior: HitTestBehavior.opaque,
      child: _buildHeader(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final textColor = widget.titleTextColor ??
        ThemeHelper.texts.getButtonTextStyle(context).color!;
    final color =
        widget.isEnabled ? textColor : textColor.withAlpha(kDisabledAlpha);

    return Container(
      constraints: const BoxConstraints(minHeight: 40.0, minWidth: 44.0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            constraints: const BoxConstraints(minHeight: kFastIconSizeMedium),
            child: Center(
              child: FastButtonLabel(text: widget.titleText, textColor: color),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: _buildHeaderIcon(color),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderIcon(Color color) {
    return RotationTransition(
      turns: _animation,
      child: Icon(
        widget.headerIcon,
        size: kFastIconSizeMedium,
        color: color,
      ),
    );
  }
}
