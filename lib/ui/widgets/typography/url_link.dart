import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

typedef UrlLinkCallback = void Function(String url);

class FastUrlLink extends StatelessWidget {
  final String text;
  final String url;
  final UrlLinkCallback onTap;
  final Color? color;

  const FastUrlLink({
    Key? key,
    required this.onTap,
    required this.text,
    required this.url,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FastLink(
      color: color,
      text: text,
      onTap: () => onTap(url),
    );
  }
}
