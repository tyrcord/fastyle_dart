import 'dart:io';

import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';
import 'package:flutter/services.dart';

const _kSupportedLocales = const <Locale>[Locale('en', 'US')];

class FastApp extends StatefulWidget {
  final Iterable<LocalizationsDelegate> localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final FastThemeBloc themeBloc;
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final String titleText;
  final Locale locale;
  final Widget home;

  FastApp({
    Key key,
    @required this.home,
    Iterable<Locale> supportedLocales = _kSupportedLocales,
    this.localizationsDelegates,
    this.lightTheme,
    this.darkTheme,
    this.themeBloc,
    this.titleText,
    this.locale,
  })  : assert(home != null),
        this.supportedLocales = supportedLocales ?? _kSupportedLocales,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _FastAppState();
}

class _FastAppState extends State<FastApp> {
  FastThemeBloc _themeBloc;

  @override
  void initState() {
    _themeBloc = widget.themeBloc ??
        FastThemeBloc(
          initialState: FastThemeBlocState(
            brightness: WidgetsBinding.instance.window.platformBrightness,
            themeMode: ThemeMode.system,
          ),
        );

    super.initState();
  }

  @override
  void dispose() {
    _themeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Platform.isIOS || Platform.isAndroid) {
          FocusManager.instance.primaryFocus.unfocus();
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        }
      },
      child: BlocProvider(
        bloc: _themeBloc,
        child: BlocBuilderWidget(
          bloc: _themeBloc,
          builder: (context, FastThemeBlocState state) {
            return MaterialApp(
              navigatorKey: FastNotificationCenter.navigatorKey,
              title: widget.titleText,
              theme: widget.lightTheme,
              darkTheme: widget.darkTheme,
              themeMode: state.themeMode,
              home: widget.home,
              localizationsDelegates: widget.localizationsDelegates,
              supportedLocales: widget.supportedLocales,
              locale: widget.locale,
            );
          },
        ),
      ),
    );
  }
}
