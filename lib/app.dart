import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';
import 'package:flutter/material.dart';

class FastApp extends StatefulWidget {
  final String titleText;
  final Widget home;
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  FastApp({
    Key key,
    @required this.home,
    this.titleText,
    this.lightTheme,
    this.darkTheme,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FastAppState();
}

class _FastAppState extends State<FastApp> {
  FastThemeBloc _themeBloc;

  @override
  void initState() {
    _themeBloc = FastThemeBloc(FastThemeBlocState(
      brightness: WidgetsBinding.instance.window.platformBrightness,
      themeMode: ThemeMode.system,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _themeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
          );
        },
      ),
    );
  }
}
