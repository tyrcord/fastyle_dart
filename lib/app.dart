import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';
import 'package:flutter/material.dart';

class FastApp extends StatefulWidget {
  final String titleText;
  final Widget home;
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final Iterable<LocalizationsDelegate> localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final Locale locale;
  final FastThemeBloc themeBloc;

  FastApp({
    Key key,
    @required this.home,
    this.titleText,
    this.lightTheme,
    this.darkTheme,
    this.localizationsDelegates,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.locale,
    this.themeBloc,
  }) : super(key: key);

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
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: BlocProvider(
        bloc: _themeBloc,
        child: BlocBuilderWidget(
          bloc: _themeBloc,
          builder: (context, FastThemeBlocState state) {
            return MaterialApp(
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
