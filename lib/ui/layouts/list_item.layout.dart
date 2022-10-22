import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FastListItemLayout extends StatefulWidget {
  ///
  /// Describes some additional visual aspects of an item.
  ///
  final FastListItemDescriptor? descriptor;

  ///
  /// The padding for the input decoration's container.
  ///
  final EdgeInsets? contentPadding;

  ///
  /// Allow to convert the label to beginning of sentence case.
  ///
  final bool capitalizeLabelText;

  ///
  /// Text that describes an item description.
  ///
  final String? descriptionText;

  ///
  /// Called for each distinct tap.
  ///
  final VoidCallback? onTap;

  ///
  /// Text that describes an item label.
  ///
  final String labelText;

  ///
  /// A widget to display after an item label.
  ///
  final Widget? trailing;

  ///
  /// A widget to display before an item label.
  ///
  final Widget? leading;

  ///
  /// Indicates whether an item is enabled in the user interface.
  ///
  final bool isEnabled;

  ///
  /// Specifies whether an item will have the vertically dense layout.
  ///
  final bool isDense;

  FastListItemLayout({
    Key? key,
    required this.labelText,
    this.capitalizeLabelText = true,
    this.isEnabled = true,
    this.isDense = true,
    this.descriptionText,
    this.contentPadding,
    this.descriptor,
    this.trailing,
    this.leading,
    this.onTap,
  }) : super(key: key);

  @override
  _FastListItemLayoutState createState() => _FastListItemLayoutState();
}

class _FastListItemLayoutState extends State<FastListItemLayout> {
  final _leadingKey = GlobalKey();
  late final Widget? _leading;
  bool _isInitialized = false;
  double? _leadingOffsetX;

  bool get isDense => widget.descriptor?.isDense ?? widget.isDense;

  // Material specifications.
  static const _minLeadingWidth = 40.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isInitialized) {
      _leading = widget.descriptor?.leading ?? widget.leading;
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
      subtitle = FastSecondaryBody(text: widget.descriptionText!);

      if (transform != null) {
        subtitle = Transform(transform: transform, child: subtitle);
      }
    }

    return ThemeHelper.getListTitleTheme(
      context: context,
      child: ListTile(
        trailing: widget.descriptor?.trailing ?? widget.trailing,
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
    final labelText = widget.capitalizeLabelText
        ? toBeginningOfSentenceCase(widget.labelText)!
        : widget.labelText;

    final title = FastBody(text: labelText);

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
