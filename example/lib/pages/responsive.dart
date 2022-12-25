import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class ResponsivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FastMediaLayoutBuilder(builder: ((context, mediaType) {
      Widget content;

      if (mediaType <= FastMediaType.tablet) {
        content = buildColumnView(context, mediaType);
      } else {
        content = buildGridView(context, mediaType);
      }

      return FastSectionPage(
        titleText: 'Responsive (${mediaType.name})',
        child: Container(child: content),
        isViewScrollable: true,
      );
    }));
  }

  Widget buildColumnView(BuildContext context, FastMediaType mediaType) {
    return Column(
      children: buildBoxes(context, true),
    );
  }

  Widget buildGridView(BuildContext context, FastMediaType mediaType) {
    var spacing = ThemeHelper.spacing.getSpacing(context);
    var size = MediaQuery.of(context).size;

    final columnCount = mediaType.index;
    final double itemHeight = (size.height - kToolbarHeight) / columnCount;
    final double itemWidth = size.width / columnCount;

    return GridView.count(
      crossAxisCount: mediaType.index,
      childAspectRatio: (itemWidth / itemHeight),
      children: buildBoxes(context, false),
      shrinkWrap: true,
      mainAxisSpacing: spacing,
      crossAxisSpacing: spacing,
      padding: const EdgeInsets.all(0),
    );
  }

  List<Widget> buildBoxes(BuildContext context, bool hasSpacing) {
    var count = List<int>.filled(50, 0);
    var i = 0;

    return count.map((e) {
      return buildBox(context, ++i, hasSpacing);
    }).toList();
  }

  Widget buildBox(BuildContext context, int index, bool hasSpacing) {
    final palette = ThemeHelper.getPaletteColors(context);
    final spacing = hasSpacing ? ThemeHelper.spacing.getSpacing(context) : 0.0;

    return Container(
      color: palette.blue.mid,
      child: Center(
        child: FastBody(text: index.toString()),
      ),
      height: 64,
      margin: EdgeInsets.only(bottom: spacing),
    );
  }
}
