import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class IndicatorsPage extends StatefulWidget {
  @override
  State<IndicatorsPage> createState() => _IndicatorsPageState();
}

class _IndicatorsPageState extends State<IndicatorsPage> {
  double _progress = 0.5;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _progress = 0.75;
      });

      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _progress = 0.25;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final bodyTextStyle = ThemeHelper.texts.getBodyTextStyle(context);
    final palette = ThemeHelper.getPaletteColors(context);

    return FastSectionPage(
      titleText: 'Indicators',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FastTitle(text: 'Progress Bars'),
          kFastSizedBox32,
          FastLinearProgressBarIndicator(
            value: _progress,
            maxValue: 1,
          ),
          kFastSizedBox32,
          FastLinearProgressBarIndicator(
            barColor: palette.green.mid,
            value: _progress,
            maxValue: 1,
          ),
          kFastSizedBox32,
          FastLinearProgressBarIndicator(
            palette: palette.purple,
            value: _progress,
            maxValue: 1,
          ),
          kFastSizedBox32,
          FastLinearProgressBarIndicator(
            backgroundColor: Colors.transparent,
            barColor: palette.mint.mid,
            value: _progress,
            maxValue: 1,
          ),
          kFastSizedBox32,
          FastLinearProgressBarIndicator(
            showProgressLabel: true,
            showAsPercentage: true,
            minBarHeight: 24,
            value: _progress,
            barRadius: 12,
            maxValue: 1,
          ),
          kFastSizedBox32,
          FastLinearProgressBarIndicator(
            progressLabelBuilder: (val) => 'custom $val',
            showProgressLabel: true,
            showAsPercentage: false,
            palette: palette.mint,
            minBarHeight: 24,
            value: _progress,
            barRadius: 12,
            maxValue: 1,
          ),
          kFastSizedBox32,
          FastLinearProgressBarIndicator(
            minBarHeight: 16,
            value: _progress,
            barRadius: 0,
            maxValue: 1,
          ),
          kFastSizedBox32,
          FastLinearProgressBarIndicator(
            palette: palette.indigo,
            minBarHeight: 16,
            value: _progress,
            barRadius: 0,
            maxValue: 1,
          ),
        ],
      ),
    );
  }
}
