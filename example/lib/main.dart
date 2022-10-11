import 'dart:developer';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:fastyle_dart_example/data/items.dart';
import 'package:fastyle_dart_example/pages/buttons.dart';
import 'package:fastyle_dart_example/pages/cards.dart';
import 'package:fastyle_dart_example/pages/colors.dart';
import 'package:fastyle_dart_example/pages/fields.dart';
import 'package:fastyle_dart_example/pages/lists.dart';
import 'package:fastyle_dart_example/pages/notifications.dart';
import 'package:fastyle_dart_example/pages/tabs.dart';
import 'package:fastyle_dart_example/pages/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

class DummyLoaderJob extends FastJob {
  @override
  Future<void> initialize(
    BuildContext context, {
    IFastErrorReporter? errorReporter,
  }) {
    return Future.delayed(const Duration(milliseconds: 500));
  }
}

class DummyCrashLoaderJob extends FastJob {
  @override
  Future<void> initialize(
    BuildContext context, {
    IFastErrorReporter? errorReporter,
  }) async {
    await Future.delayed(const Duration(milliseconds: 250));
    throw ErrorDescription('Demo');
  }
}

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;

  runApp(MyApp());
}

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
      errorBuilder: (context, error) {
        final palette = ThemeHelper.getPaletteColors(context);

        return Center(
          child: FastBody(
            textColor: palette.red.mid,
            text: 'Oops! An error occured while launching the app',
          ),
        );
      },
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
    final palette = ThemeHelper.getPaletteColors(context);

    return FastHomePage(
      leading: FastIconButton(
        onTap: () {
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
        iconColor: palette.whiteColor,
        iconSize: kFastIconSizeMedium,
      ),
      actions: [
        FastIconButton(
          onTap: () async {
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
          iconColor: palette.whiteColor,
          iconSize: kFastIconSizeMedium,
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
    final palette = ThemeHelper.getPaletteColors(context);

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
          backgroundColor: palette.purple.mid,
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
          backgroundColor: palette.green.mid,
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
          backgroundColor: palette.blue.mid,
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
          backgroundColor: palette.pink.mid,
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
          backgroundColor: palette.indigo.mid,
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
          backgroundColor: palette.teal.mid,
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
          backgroundColor: palette.orange.mid,
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
          backgroundColor: palette.red.mid,
        ),
        labelText: 'Colors',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ColorsPage()),
          );
        },
      ),
      FastNavigationListItem(
        leading: FastRoundedIcon(
          iconData: Icons.description,
          backgroundColor: palette.brown.mid,
        ),
        labelText: 'Page',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FastSectionPage(
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
          );
        },
      ),
    ];
  }
}
