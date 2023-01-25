import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

typedef FastListItemBuilder<T extends FastItem> = Widget Function(
  BuildContext context,
  T item,
  int index,
);
