import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastThreeBounceIndicator extends StatelessWidget {
  final Color? color;

  FastThreeBounceIndicator({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(
        color: color ?? ThemeHelper.colors.getPrimaryColor(context),
        size: kFastIconSizeSmall,
      ),
    );
  }
}
