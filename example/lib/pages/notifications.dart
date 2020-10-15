import 'package:flutter/material.dart';
import 'package:fastyle_dart/fastyle_dart.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FastSectionPage(
      titleText: 'Notifications',
      isViewScrollable: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FastRaisedButton(
            text: 'info button',
            onTap: () {
              FastNotificationCenter.info(
                'info message',
                options: FastNotificationCenterOptions(
                  leadingIcon: Icon(Icons.message),
                ),
              );
            },
          ),
          FastRaisedButton(
            text: 'error button',
            onTap: () {
              FastNotificationCenter.error(
                'error message',
                options: FastNotificationCenterOptions(
                  leadingIcon: Icon(Icons.bug_report),
                ),
              );
            },
          ),
          FastRaisedButton(
            text: 'warn button',
            onTap: () {
              FastNotificationCenter.warn(
                'warn message',
                options: FastNotificationCenterOptions(
                  leadingIcon: Icon(Icons.warning),
                ),
              );
            },
          ),
          FastRaisedButton(
            text: 'success button',
            onTap: () {
              FastNotificationCenter.success(
                'success message',
                options: FastNotificationCenterOptions(
                  leadingIcon: Icon(Icons.check),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
