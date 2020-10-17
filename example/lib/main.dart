import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:fastyle_dart_example/pages/colors.dart';
import 'package:fastyle_dart_example/pages/notifications.dart';
import 'package:tbloc_dart/tbloc_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:fastyle_dart_example/data/items.dart';
import 'package:fastyle_dart_example/pages/buttons.dart';
import 'package:fastyle_dart_example/pages/cards.dart';
import 'package:fastyle_dart_example/pages/fields.dart';
import 'package:fastyle_dart_example/pages/lists.dart';
import 'package:fastyle_dart_example/pages/tabs.dart';
import 'package:fastyle_dart_example/pages/typography.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FastApp(
      titleText: 'Fastyle Demo',
      lightTheme: FastTheme.light.indigo,
      darkTheme: FastTheme.dark.indigo,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FastHomePage(
      leading: IconButton(
        onPressed: () {},
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
                  shouldGroupByCategory: true,
                  shouldUseFuzzySearch: true,
                ),
                fullscreenDialog: true,
              ),
            );

            if (response != null) {
              log(response.value);
            }
          },
          icon: Icon(Icons.search),
        ),
      ],
      titleText: 'Fastyle Demo',
      subtitleText: 'Hello stranger! Have a wonderful day! :)',
      children: _buildList(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Settings',
        child: Icon(Icons.settings),
      ),
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
        titleText: 'Dark Mode',
        isChecked: themeBloc.currentState.brightness == Brightness.dark,
        onValueChanged: (bool shouldSwitchToDarkMode) {
          if (shouldSwitchToDarkMode) {
            themeBloc.dispatchEvent(FastThemeBlocEvent.dark());
          } else {
            themeBloc.dispatchEvent(FastThemeBlocEvent.light());
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
        titleText: 'Buttons',
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
        titleText: 'Typography',
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
        titleText: 'Tabs',
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
        titleText: 'Cards',
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
        titleText: 'List',
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
        titleText: 'Fields',
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
        titleText: 'Notifications',
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
        titleText: 'Colors',
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
