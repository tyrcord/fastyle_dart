import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FastSectionPage(
      titleText: 'Cards',
      isViewScrollable: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FastCard(
            titleText: 'Empty Card',
          ),
          SizedBox(height: 16.0),
          FastCard(
            titleText: 'French',
            child: FastBody2(text: 'Bonjour le monde !'),
          ),
          SizedBox(height: 16.0),
          FastCard(
            titleText: 'English',
            child: FastBody2(text: 'Hello World!'),
            headerActions: <Widget>[
              FastIconButton(
                onTap: () {
                  _showPopup(context, 'Thanks!');
                },
                icon: Icon(
                  Icons.favorite,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          FastCard(
            titleText: 'Spanish',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FastBody2(text: 'Hola!'),
                FastBody2(text: 'Hola!'),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          FastCard(
            titleText: 'English',
            child: FastBody(text: 'With Shadow ;)'),
            headerActions: <Widget>[
              FastIconButton(
                onTap: () {},
                icon: Icon(
                  Icons.favorite,
                ),
              ),
            ],
            footerActions: <Widget>[
              FastTextButton(
                text: 'cancel',
                onTap: () {},
                padding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
              FastTextButton(
                text: 'Valid',
                onTap: () {},
                emphasis: FastButtonEmphasis.high,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          FastCard(
            titleText: 'English',
            headerActions: <Widget>[
              FastIconButton(
                onTap: () {},
                icon: Icon(
                  Icons.favorite,
                ),
              ),
            ],
            footerActions: <Widget>[
              FastTextButton(
                text: 'cancel',
                onTap: () {},
                padding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
              FastTextButton(
                text: 'Valid',
                onTap: () {},
                emphasis: FastButtonEmphasis.high,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showPopup(BuildContext context, String message) async {
    return showFastAlertDialog(
      context: context,
      titleText: 'Action',
      messageText: message,
      onCancel: () {
        Navigator.pop(context);
      },
      onValid: () {
        Navigator.pop(context);
      },
    );
  }
}
