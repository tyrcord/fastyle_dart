import 'dart:collection';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastNotificationCenter {
  static BuildContext get _context => navigatorKey.currentContext;
  static const _animationDuration = Duration(milliseconds: 750);
  static const _notificationDuration = Duration(seconds: 2);
  static final _queue = ListQueue<Flushbar>();
  static bool _isShowingNotification = false;
  static const _maxNotification = 2;

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void error(
    String message, {
    FastNotificationCenterOptions options,
  }) {
    final context = navigatorKey.currentContext;

    _buildNotification(
      message,
      options: _mergeIconColors(
        options,
        ThemeHelper.colors.getRedColor(context),
      ),
    );
  }

  static void warn(
    String message, {
    FastNotificationCenterOptions options,
  }) {
    _buildNotification(
      message,
      options: _mergeIconColors(
        options,
        ThemeHelper.colors.getOrangeColor(_context),
      ),
    );
  }

  static void info(
    String message, {
    FastNotificationCenterOptions options,
  }) {
    _buildNotification(
      message,
      options: _mergeIconColors(
        options,
        ThemeHelper.colors.getBlueGrayColor(_context),
      ),
    );
  }

  static void success(
    String message, {
    FastNotificationCenterOptions options,
  }) {
    _buildNotification(
      message,
      options: _mergeIconColors(
        options,
        ThemeHelper.colors.getGreenColor(_context),
      ),
    );
  }

  static FastNotificationCenterOptions _mergeIconColors(
    FastNotificationCenterOptions options,
    Color color,
  ) {
    return options?.copyWith(iconColor: options?.iconColor ?? color);
  }

  static void _buildNotification(
    String message, {
    FastNotificationCenterOptions options,
  }) {
    _addNotification(
      Flushbar(
        margin: kFastEdgeInsets16,
        borderRadius: kFastBorderRadius,
        messageText: FastBody(text: message),
        duration: _notificationDuration,
        icon: _buildIcon(options),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: ThemeHelper.colors.getBackGroundColor(_context),
        animationDuration: _animationDuration,
        boxShadows: [ThemeHelper.getDefaultBoxShadow(_context)],
      ),
    );
  }

  static Widget _buildIcon(FastNotificationCenterOptions options) {
    if (options != null && options.leadingIcon != null) {
      return IconTheme.merge(
        data: IconThemeData(
          size: options?.iconSize ?? kFastIconSizeMedium,
          color: options?.iconColor,
        ),
        child: options?.leadingIcon,
      );
    }

    return null;
  }

  static void _addNotification(Flushbar notification) {
    if (_queue.length == _maxNotification) {
      _queue.removeFirst();
    }

    _queue.addLast(notification);

    if (!_isShowingNotification) {
      _nextNotification();
    }
  }

  static void _nextNotification() {
    if (_queue.length > 0) {
      _isShowingNotification = true;

      final notification = _queue.removeFirst();

      notification.onStatusChanged = _onNotificationStatusChanged;
      notification.show(_context);
    } else {
      _isShowingNotification = false;
    }
  }

  static void _onNotificationStatusChanged(FlushbarStatus status) {
    if (status == FlushbarStatus.DISMISSED) {
      _nextNotification();
    }
  }
}
