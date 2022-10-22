import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

typedef FastMediaLayoutWidgetBuilder = Widget Function(
  BuildContext context,
  FastMediaType fastMediaType,
  MediaQueryData mediaQueryData,
);

class FastMediaLayoutBuilder extends StatelessWidget {
  final FastMediaLayoutWidgetBuilder builder;

  FastMediaLayoutBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final fastMediaType = _getFastMediaType(mediaQueryData);

    return builder(context, fastMediaType, mediaQueryData);
  }

  FastMediaType _getFastMediaType(MediaQueryData mediaQueryData) {
    final size = mediaQueryData.size;

    if (size.width >= FastMediaBreakpoints.tablet) {
      return FastMediaType.tablet;
    } else if (size.width >= FastMediaBreakpoints.desktop) {
      return FastMediaType.desktop;
    } else if (size.width >= FastMediaBreakpoints.large) {
      return FastMediaType.large;
    } else if (size.width >= FastMediaBreakpoints.xl) {
      return FastMediaType.xl;
    }

    return FastMediaType.handset;
  }
}
