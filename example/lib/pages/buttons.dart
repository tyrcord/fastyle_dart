import 'package:flutter/material.dart';
import 'package:fastyle_dart/fastyle_dart.dart';

class ButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FastSectionPage(
      titleText: 'Buttons',
      isViewScrollable: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FastRaisedButton(
            text: 'raised button',
            onTap: () {},
          ),
          FastRaisedButton(
            text: 'raised button disabled',
            onTap: () {},
            isEnabled: false,
          ),
          FastOutlineButton(
            text: 'Outline button',
            onTap: () {},
          ),
          FastOutlineButton(
            text: 'Outline button disabled',
            onTap: () {},
            isEnabled: false,
          ),
          FastTextButton(
            text: 'Text button',
            onTap: () {},
          ),
          FastTextButton(
            text: 'Text button disabled',
            onTap: () {},
            isEnabled: false,
          ),
          FastIconButton(
            icon: Icon(Icons.android),
            onTap: () {},
          ),
          FastIconButton(
            icon: Icon(Icons.android),
            onTap: () {},
            isEnabled: false,
          ),
        ],
      ),
    );
  }
}
