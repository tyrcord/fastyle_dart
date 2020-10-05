import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastListItemLayout extends StatefulWidget {
  final FastListItemDescriptor descriptor;
  final EdgeInsets contentPadding;
  final String descriptionText;
  final VoidCallback onTap;
  final String titleText;
  final Widget trailing;
  final Widget leading;
  final bool isEnabled;
  final bool isDense;

  FastListItemLayout({
    Key key,
    @required this.titleText,
    bool isEnabled = true,
    this.descriptionText,
    this.contentPadding,
    this.descriptor,
    this.trailing,
    this.isDense,
    this.leading,
    this.onTap,
  })  : this.isEnabled = isEnabled ?? true,
        assert(titleText != null),
        super(key: key);

  @override
  _FastListItemLayoutState createState() => _FastListItemLayoutState();
}

class _FastListItemLayoutState extends State<FastListItemLayout> {
  GlobalKey _leadingKey = GlobalKey();
  bool _isInitialized = false;
  double _leadingOffsetX;
  Widget _leading;

  // Material specifications.
  static const double _minLeadingWidth = 40.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
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
    final title = FastBody(text: widget.titleText);
    Matrix4 transform;
    Widget subtitle;

    if (_leadingOffsetX != null) {
      transform = Matrix4.translationValues(-_leadingOffsetX, 0.0, 0.0);
    }

    if (widget.descriptionText != null) {
      subtitle = FastBody2(text: widget.descriptionText);

      if (transform != null) {
        subtitle = Transform(transform: transform, child: subtitle);
      }
    }

    return ThemeHelper.getListTitleTheme(
      context: context,
      child: ListTile(
        contentPadding: widget.contentPadding,
        dense: widget.isDense ?? widget.descriptor?.isDense ?? true,
        enabled: widget.isEnabled,
        leading: _leading != null
            ? Container(key: _leadingKey, child: _leading)
            : null,
        title: transform != null
            ? Transform(transform: transform, child: title)
            : title,
        subtitle: subtitle,
        trailing: widget.trailing ?? widget.descriptor?.trailing,
        onTap: widget.onTap,
      ),
    );
  }

  _afterLayout(_) {
    if (_leading != null &&
        _leadingKey != null &&
        _leadingKey.currentContext != null) {
      final RenderBox renderBox = _leadingKey.currentContext.findRenderObject();
      final width = renderBox.size.width;

      if (width < _minLeadingWidth) {
        setState(() => _leadingOffsetX = _minLeadingWidth - width);
      }
    }
  }
}
