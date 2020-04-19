import 'package:flutter/material.dart';
import 'package:fastyle_dart/fastyle_dart.dart';

class TypographyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FastSectionPage(
      titleText: 'Typography',
      child: ListView(
        children: [
          FastDisplay(
            text: "Display",
          ),
          SizedBox(height: 16.0),
          FastDisplay(
            text: "\$28,000",
            useFontForNumber: true,
          ),
          SizedBox(height: 16.0),
          FastHeadline(
            text: "Headline",
          ),
          SizedBox(height: 16.0),
          FastPlaceHolderHeadline(
            text: "Placeholder Headline",
          ),
          SizedBox(height: 16.0),
          FastSubhead(
            text: "Subhead",
          ),
          SizedBox(height: 16.0),
          FastTitle(
            text: "Title",
          ),
          SizedBox(height: 16.0),
          FastPlaceholderTitle(
            text: "Placeholder Title",
          ),
          SizedBox(height: 16.0),
          FastSubtitle(
            text: "subtitle",
          ),
          SizedBox(height: 16.0),
          FastBody(
            text: "Body 1",
          ),
          SizedBox(height: 16.0),
          FastBody(
            text: "\$28,000",
            useFontForNumber: true,
          ),
          SizedBox(height: 16.0),
          FastPlaceholder(
            text: "Placeholder",
          ),
          SizedBox(height: 16.0),
          FastBody2(
            text: "Body 2",
          ),
          SizedBox(height: 16.0),
          FastButtonLabel(
            text: "Button",
          ),
          SizedBox(height: 16.0),
          FastCaption(
            text: "Caption",
          ),
          SizedBox(height: 16.0),
          FastHelper(
            text: "Helper",
          ),
        ],
      ),
    );
  }
}
