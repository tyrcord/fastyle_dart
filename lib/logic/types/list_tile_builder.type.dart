// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fastyle_dart/fastyle_dart.dart';

typedef FastListItemBuilder<T extends FastItem> = Widget Function(
  BuildContext context,
  T item,
  int index,
);
