import 'dart:collection';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

const _kDefaultErrorOptions = FastNotificationCenterOptions(
  leadingIcon: Icon(Icons.cancel),
);

const _kDefaultWarnOptions = FastNotificationCenterOptions(
  leadingIcon: Icon(Icons.report_problem),
);

const _kDefaultInfoOptions = FastNotificationCenterOptions(
  leadingIcon: Icon(Icons.info),
);
const _kDefaultSuccessOptions = FastNotificationCenterOptions(
  leadingIcon: Icon(Icons.done),
);

class FastNotificationCenter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get _context => navigatorKey.currentContext!;
  static const Duration _animationDuration = Duration(milliseconds: 750);
  static const Duration _notificationDuration = Duration(seconds: 2);
  static final ListQueue<Flushbar> _queue = ListQueue<Flushbar>();
  static bool _isShowingNotification = false;
  static const int _maxNotification = 2;

  ///
  /// Displays an error notification.
  ///
  static void error(
    String message, {
    Key? key,
    FastNotificationCenterOptions options = _kDefaultErrorOptions,
  }) {
    _buildNotification(
      message,
      options: _mergeIconColors(
        options,
        ThemeHelper.colors.getRedColor(_context),
      ),
    );
  }

  ///
  /// Displays an warn notification.
  ///
  static void warn(
    String message, {
    Key? key,
    FastNotificationCenterOptions options = _kDefaultWarnOptions,
  }) {
    _buildNotification(
      message,
      options: _mergeIconColors(
        options,
        ThemeHelper.colors.getOrangeColor(_context),
      ),
    );
  }

  ///
  /// Displays an info notification.
  ///
  static void info(
    String message, {
    Key? key,
    FastNotificationCenterOptions options = _kDefaultInfoOptions,
  }) {
    _buildNotification(
      message,
      options: _mergeIconColors(
        options,
        ThemeHelper.colors.getBlueGrayColor(_context),
      ),
    );
  }

  ///
  /// Displays an success notification.
  ///
  static void success(
    String message, {
    Key? key,
    FastNotificationCenterOptions options = _kDefaultSuccessOptions,
  }) {
    _buildNotification(
      message,
      options: _mergeIconColors(
        options,
        ThemeHelper.colors.getGreenColor(_context),
      ),
    );
  }

  static FastNotificationCenterOptions? _mergeIconColors(
    FastNotificationCenterOptions? options,
    Color color,
  ) {
    return options?.copyWith(iconColor: options.iconColor ?? color);
  }

  static void _buildNotification(
    String message, {
    Key? key,
    FastNotificationCenterOptions? options,
  }) {
    _addNotification(
      Flushbar(
        key: key,
        backgroundColor:
            ThemeHelper.colors.getSecondaryBackgroundColor(_context),
        boxShadows: [ThemeHelper.getDefaultBoxShadow(_context)],
        flushbarPosition: FlushbarPosition.TOP,
        animationDuration: _animationDuration,
        messageText: FastBody(text: message),
        duration: _notificationDuration,
        borderRadius: const BorderRadius.all(
          Radius.circular(kFastBorderRadius),
        ),
        icon: _buildIcon(options),
        margin: kFastEdgeInsets8,
        onStatusChanged: _onNotificationStatusChanged,
      ),
    );
  }

  static Widget? _buildIcon(FastNotificationCenterOptions? options) {
    if (options != null && options.leadingIcon != null) {
      return IconTheme.merge(
        data: IconThemeData(
          size: options.iconSize ?? kFastIconSizeMedium,
          color: options.iconColor,
        ),
        child: options.leadingIcon!,
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
    if (_queue.isNotEmpty) {
      _isShowingNotification = true;

      final notification = _queue.removeFirst();

      WidgetsBinding.instance?.addPostFrameCallback((_) {
        notification.show(_context);
      });
    } else {
      _isShowingNotification = false;
    }
  }

  static void _onNotificationStatusChanged(FlushbarStatus? status) {
    if (status == FlushbarStatus.DISMISSED) {
      _nextNotification();
    }
  }
}
