import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

typedef FastListItemBuilder = Widget Function(
  BuildContext context,
  FastItem item,
  int index,
);
