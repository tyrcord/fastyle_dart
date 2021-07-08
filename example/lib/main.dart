import 'dart:developer';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:fastyle_dart_example/pages/colors.dart';
import 'package:fastyle_dart_example/pages/notifications.dart';
import 'package:tbloc_dart/tbloc_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fastyle_dart_example/data/items.dart';
import 'package:fastyle_dart_example/pages/buttons.dart';
import 'package:fastyle_dart_example/pages/cards.dart';
import 'package:fastyle_dart_example/pages/fields.dart';
import 'package:fastyle_dart_example/pages/lists.dart';
import 'package:fastyle_dart_example/pages/tabs.dart';
import 'package:fastyle_dart_example/pages/typography.dart';

class DummyLoaderJob extends FastJob {
  @override
  Future<void> initialize(
    BuildContext context, {
    Map<String, dynamic>? details,
  }) {
    return Future.delayed(Duration(milliseconds: 500));
  }
}

class DummyCrashLoaderJob extends FastJob {
  @override
  Future<void> initialize(
    BuildContext context, {
    Map<String, dynamic>? details,
  }) async {
    await Future.delayed(Duration(milliseconds: 250));
    throw ErrorDescription('Demo');
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FastApp(
      titleText: 'Fastyle Demo',
      lightTheme: FastTheme.light.blue,
      darkTheme: FastTheme.dark.blue,
      home: MyHomePage(),
      loaderJobs: [
        DummyLoaderJob(),
        DummyLoaderJob(),
        DummyLoaderJob(),
        // DummyCrashLoaderJob(),
        DummyLoaderJob(),
      ],
      errorBuilder: (context, error) => Center(
        child: FastBody(
          textColor: ThemeHelper.colors.getRedColor(context),
          text: 'Oops! An error occured while launching the app',
        ),
      ),
      loaderBuilder: (context, progress) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FastProgressBarIndicator(
              showProgressLabel: true,
              value: progress,
            ),
            kFastSizedBox16,
            FastBody(text: 'Please wait while the application is loading...'),
          ],
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FastHomePage(
      leading: IconButton(
        onPressed: () {
          const slideText1 = 'slide 1';
          const slideText2 = 'slide 2';
          const homeText = 'Home';
          const slide1 = Text(slideText1);
          const slide2 = Text(slideText2);
          final home = FastHomePage(
            children: [Text(homeText)],
          );

          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => FastWelcomeView(
                homeBuilder: (_) => home,
                slides: [slide1, slide2],
                allowToSkip: true,
              ),
              fullscreenDialog: true,
            ),
          );
        },
        icon: Icon(Icons.account_circle),
      ),
      actions: [
        IconButton(
          onPressed: () async {
            final response = await Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => FastSearchPage(
                  items: demoItems,
                  categories: demoCategories,
                  groupByCategory: true,
                  useFuzzySearch: true,
                ),
                fullscreenDialog: true,
              ),
            );

            if (response != null) {
              log(response.value.toString());
            }
          },
          icon: Icon(Icons.search),
        ),
      ],
      titleText: 'Fastyle Demo',
      subtitleText: 'Hello stranger! Have a wonderful day! :)',
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Settings',
        child: Icon(Icons.settings),
      ),
      children: _buildList(context),
    );
  }

  List<Widget> _buildList(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return [
      FastListHeader(
        categoryText: 'options',
        captionText: 'Favorites',
      ),
      FastToggleListItem(
        leading: const Icon(Icons.brightness_2),
        labelText: 'Dark Mode',
        isChecked: themeBloc.currentState.brightness == Brightness.dark,
        onValueChanged: (bool shouldSwitchToDarkMode) {
          if (shouldSwitchToDarkMode) {
            themeBloc.addEvent(FastThemeBlocEvent.dark());
          } else {
            themeBloc.addEvent(FastThemeBlocEvent.light());
          }
        },
      ),
      FastListHeader(
        categoryText: 'ui categories',
      ),
      FastNavigationListItem(
        leading: FastRoundedIcon(
          iconData: Icons.radio_button_checked,
          backgroundColor: ThemeHelper.colors.getPurpleColor(context),
        ),
        labelText: 'Buttons',
        descriptionText: 'Raised, icon buttons',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ButtonsPage()),
          );
        },
      ),
      FastNavigationListItem(
        leading: FastRoundedIcon(
          iconData: Icons.text_fields,
          backgroundColor: ThemeHelper.colors.getGreenColor(context),
        ),
        labelText: 'Typography',
        descriptionText: 'Title, subhead...',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TypographyPage()),
          );
        },
      ),
      FastNavigationListItem(
        leading: FastRoundedIcon(
          iconData: Icons.table_chart,
          backgroundColor: ThemeHelper.colors.getBlueColor(context),
        ),
        labelText: 'Tabs',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TabsPage()),
          );
        },
      ),
      FastNavigationListItem(
        leading: FastRoundedIcon(
          iconData: Icons.view_agenda,
          backgroundColor: ThemeHelper.colors.getPinkColor(context),
        ),
        labelText: 'Cards',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CardsPage()),
          );
        },
      ),
      FastNavigationListItem(
        leading: FastRoundedIcon(
          iconData: Icons.view_list,
          backgroundColor: ThemeHelper.colors.getIndigoColor(context),
        ),
        labelText: 'List',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListsPage()),
          );
        },
      ),
      FastNavigationListItem(
        leading: FastRoundedIcon(
          iconData: Icons.edit,
          backgroundColor: ThemeHelper.colors.getTealColor(context),
        ),
        labelText: 'Fields',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FieldsPage()),
          );
        },
      ),
      FastNavigationListItem(
        leading: FastRoundedIcon(
          iconData: Icons.message,
          backgroundColor: ThemeHelper.colors.getOrangeColor(context),
        ),
        labelText: 'Notifications',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationsPage()),
          );
        },
      ),
      FastNavigationListItem(
        leading: FastRoundedIcon(
          iconData: Icons.colorize,
          backgroundColor: ThemeHelper.colors.getRedColor(context),
        ),
        labelText: 'Colors',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ColorsPage()),
          );
        },
      ),
    ];
  }
}
