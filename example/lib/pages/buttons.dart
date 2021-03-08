import 'dart:developer';

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
            onTap: () {
              log('raised button disabled');
            },
          ),
          FastRaisedButton(
            text: 'raised button disabled',
            onTap: () {
              log('raised button disabled');
            },
            isEnabled: false,
          ),
          FastOutlineButton(
            text: 'Outline button',
            onTap: () {
              log('Outline button');
            },
          ),
          FastOutlineButton(
            text: 'Outline button disabled',
            onTap: () {
              log('Outline button disabled');
            },
            isEnabled: false,
          ),
          FastTextButton(
            text: 'Text button',
            onTap: () {
              log('text button');
            },
          ),
          FastTextButton(
            text: 'Text button disabled',
            onTap: () {
              log('text button disabled');
            },
            isEnabled: false,
          ),
          FastIconButton(
            icon: Icon(Icons.android),
            onTap: () {
              log('icon button');
            },
          ),
          FastIconButton(
            icon: Icon(Icons.android),
            onTap: () {
              log('icon button disabled');
            },
            isEnabled: false,
          ),
        ],
      ),
    );
  }
}
