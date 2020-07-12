import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FusexThreeBounceIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = ThemeHelper.colors.getPrimaryColor(context);

    return Center(
      child: SpinKitThreeBounce(color: primaryColor, size: kFastIconSize),
    );
  }
}
