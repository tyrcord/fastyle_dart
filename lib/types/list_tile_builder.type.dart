import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

typedef FastListItemBuilder<T extends FastItem> = Widget Function(
  BuildContext context,
  T item,
  int index,
);
