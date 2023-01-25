import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

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
                context,
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
                context,
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
                context,
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
                context,
                'success message',
                options: FastNotificationCenterOptions(
                  leadingIcon: Icon(Icons.check),
                ),
              );
            },
            shouldTrottleTime: true,
          ),
        ],
      ),
    );
  }
}
