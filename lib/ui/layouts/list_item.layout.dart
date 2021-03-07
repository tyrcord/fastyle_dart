import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastListItemLayout extends StatefulWidget {
  final FastListItemDescriptor? descriptor;
  final EdgeInsets? contentPadding;
  final String? descriptionText;
  final VoidCallback? onTap;
  final String titleText;
  final Widget? trailing;
  final Widget? leading;
  final bool isEnabled;
  final bool? isDense;

  FastListItemLayout({
    Key? key,
    required this.titleText,
    this.descriptionText,
    this.contentPadding,
    this.descriptor,
    this.trailing,
    this.isDense,
    this.leading,
    this.onTap,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  _FastListItemLayoutState createState() => _FastListItemLayoutState();
}

class _FastListItemLayoutState extends State<FastListItemLayout> {
  final _leadingKey = GlobalKey();
  bool _isInitialized = false;
  double? _leadingOffsetX;
  Widget? _leading;

  bool get isDense => widget.isDense ?? widget.descriptor?.isDense ?? true;

  // Material specifications.
  static const _minLeadingWidth = 40.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(_afterLayout);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isInitialized) {
      _leading = widget.leading ?? widget.descriptor?.leading;
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Matrix4? transform;
    Widget? subtitle;

    if (_leadingOffsetX != null) {
      transform = Matrix4.translationValues(-_leadingOffsetX!, 0.0, 0.0);
    }

    if (widget.descriptionText != null) {
      subtitle = FastBody2(text: widget.descriptionText!);

      if (transform != null) {
        subtitle = Transform(transform: transform, child: subtitle);
      }
    }

    return ThemeHelper.getListTitleTheme(
      context: context,
      child: ListTile(
        trailing: widget.trailing ?? widget.descriptor?.trailing,
        contentPadding: widget.contentPadding,
        title: _buildTitle(transform),
        enabled: widget.isEnabled,
        leading: _buildLeading(),
        onTap: widget.onTap,
        subtitle: subtitle,
        dense: isDense,
      ),
    );
  }

  Widget _buildTitle(Matrix4? transform) {
    final title = FastBody(text: widget.titleText);

    return transform != null
        ? Transform(transform: transform, child: title)
        : title;
  }

  Widget? _buildLeading() {
    return _leading != null
        ? Container(key: _leadingKey, child: _leading)
        : null;
  }

  void _afterLayout(_) {
    if (_leading != null && _leadingKey.currentContext != null) {
      final renderBox =
          _leadingKey.currentContext!.findRenderObject() as RenderBox;
      final width = renderBox.size.width;

      if (width < _minLeadingWidth) {
        setState(() => _leadingOffsetX = _minLeadingWidth - width);
      }
    }
  }
}
