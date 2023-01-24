import 'package:fastyle_dart/ui/ui.dart';
import 'package:fastyle_dart_example/pages/buttons.dart';
import 'package:fastyle_dart_example/pages/cards.dart';
import 'package:fastyle_dart_example/pages/colors.dart';
import 'package:fastyle_dart_example/pages/fields.dart';
import 'package:fastyle_dart_example/pages/indicators.dart';
import 'package:fastyle_dart_example/pages/lists.dart';
import 'package:fastyle_dart_example/pages/naviagtion_bar_view.dart';
import 'package:fastyle_dart_example/pages/notifications.dart';
import 'package:fastyle_dart_example/pages/responsive.dart';
import 'package:fastyle_dart_example/pages/split-view.dart';
import 'package:fastyle_dart_example/pages/tabs.dart';
import 'package:fastyle_dart_example/pages/typography.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final AppRoutes = [
  GoRoute(
    path: 'onboarding',
    pageBuilder: (context, state) {
      const slideText1 = 'slide 1';
      const slideText2 = 'slide 2';
      const slide1 = Text(slideText1);
      const slide2 = Text(slideText2);

      return MaterialPage(
        fullscreenDialog: true,
        child: FastOnboardingView(
          slides: [slide1, slide2],
          allowToSkip: true,
        ),
      );
    },
  ),
  GoRoute(
    path: 'buttons',
    builder: (context, state) => ButtonsPage(),
  ),
  GoRoute(
    path: 'typography',
    builder: (context, state) => TypographyPage(),
  ),
  GoRoute(
    path: 'tabs',
    builder: (context, state) => TabsPage(),
  ),
  GoRoute(
    path: 'cards',
    builder: (context, state) => CardsPage(),
  ),
  GoRoute(
    path: 'list',
    builder: (context, state) => ListsPage(),
  ),
  GoRoute(
    path: 'fields',
    builder: (context, state) => FieldsPage(),
  ),
  GoRoute(
    path: 'notifications',
    builder: (context, state) => NotificationsPage(),
  ),
  GoRoute(
    path: 'colors',
    builder: (context, state) => ColorsPage(),
  ),
  GoRoute(
    path: 'page',
    builder: (context, state) => FastSectionPage(
      loadingBuilder: (_) {
        return Text('loading...');
      },
      errorBuilder: (_) {
        return Text('An error occured');
      },
      loadingFuture: Future.delayed(
        const Duration(milliseconds: 2500),
        () => true,
      ),
      loadingTimeout: Duration(milliseconds: 300),
      child: Container(
        child: Text('done'),
      ),
    ),
  ),
  GoRoute(
    path: 'responsive',
    builder: (context, state) => ResponsivePage(),
  ),
  GoRoute(
    path: 'split-view',
    builder: (context, state) => SplitViewPage(),
  ),
  GoRoute(
    path: 'navigation-bar-view',
    builder: (context, state) => NavigationBarViewPage(),
  ),
  GoRoute(
    path: 'indicators',
    builder: (context, state) => IndicatorsPage(),
  ),
];
