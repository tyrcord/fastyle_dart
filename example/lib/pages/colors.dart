import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class ColorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final palette = ThemeHelper.getPaletteColors(context);

    return FastSectionPage(
      titleText: 'Colors',
      isViewScrollable: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildScheme('Gray', palette.gray),
          buildScheme('Blue', palette.blue),
          buildScheme('Blue Gray', palette.blueGray),
          buildScheme('Teal', palette.teal),
          buildScheme('Indigo', palette.indigo),
          buildScheme('Purple', palette.purple),
          buildScheme('Mint', palette.mint),
          buildScheme('Green', palette.green),
          buildScheme('Pink', palette.pink),
          buildScheme('Red', palette.red),
          buildScheme('Orange', palette.orange),
          buildScheme('Yellow', palette.yellow),
          buildScheme('Brown', palette.brown),
        ],
      ),
    );
  }

  Widget buildScheme(String title, FastPaletteScheme scheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FastTitle(text: title),
        kFastSizedBox16,
        buildColors(scheme),
        kFastSizedBox32,
      ],
    );
  }

  Widget buildColors(FastPaletteScheme scheme) {
    const separator = SizedBox(width: 3);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildColor('Lightest', scheme.lightest),
        separator,
        buildColor('Lighter', scheme.lighter),
        separator,
        buildColor('Light', scheme.light),
        separator,
        buildColor('Mid', scheme.mid),
        separator,
        buildColor('Dark', scheme.dark),
        separator,
        buildColor('Darker', scheme.darker),
        separator,
        buildColor('Darkest', scheme.darkest),
      ],
    );
  }

  Widget buildColor(String title, Color color) {
    return Container(
      constraints: BoxConstraints(minWidth: 54),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FastSubtitle(
            text: title,
            fontSize: 13,
          ),
          kFastSizedBox8,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: color,
            ),
            width: 40,
            height: 40,
          ),
          kFastSizedBox32,
          FastBody(
            text: 'Hex:',
            fontSize: 14,
          ),
          FastBody2(
            text: _toHex(color),
            fontSize: 13,
            enableInteractiveSelection: true,
          ),
          kFastSizedBox8,
          FastBody(
            text: 'Sample',
            fontSize: 14,
            textColor: color,
          ),
        ],
      ),
    );
  }

  String _toHex(Color color, {bool showSign = true, bool showAlpha = false}) {
    return '${showSign ? '#' : ''}'
        '${showAlpha ? _toRadixString(color.alpha) : ''}'
        '${_toRadixString(color.red)}'
        '${_toRadixString(color.green)}'
        '${_toRadixString(color.blue)}';
  }

  String _toRadixString(int number) {
    return number.toRadixString(16).toUpperCase().padLeft(2, '0');
  }
}
