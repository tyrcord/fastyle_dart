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
            text: 'Display',
          ),
          kFastSizedBox16,
          FastDisplay(
            text: '\$28,000',
            useFontForNumber: true,
          ),
          kFastSizedBox16,
          FastHeadline(
            text: 'Headline',
          ),
          kFastSizedBox16,
          FastPlaceHolderHeadline(
            text: 'Placeholder Headline',
          ),
          kFastSizedBox16,
          FastSubhead(
            text: 'Subhead',
          ),
          kFastSizedBox16,
          FastTitle(
            text: 'Title',
          ),
          kFastSizedBox16,
          FastPlaceholderTitle(
            text: 'Placeholder Title',
          ),
          kFastSizedBox16,
          FastSubtitle(
            text: 'subtitle',
          ),
          kFastSizedBox16,
          FastBody(
            text: 'Body 1',
          ),
          kFastSizedBox16,
          FastBody(
            text: '\$28,000',
            useFontForNumber: true,
          ),
          kFastSizedBox16,
          FastPlaceholder(
            text: 'Placeholder',
          ),
          kFastSizedBox16,
          FastBody2(
            text: 'Body 2',
          ),
          kFastSizedBox16,
          FastButtonLabel(
            text: 'Button',
          ),
          kFastSizedBox16,
          FastCaption(
            text: 'Caption',
          ),
          kFastSizedBox16,
          FastHelper(
            text: 'Helper',
          ),
        ],
      ),
    );
  }
}
