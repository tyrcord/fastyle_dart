import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';
import 'package:flutter/services.dart';

class FastApp extends StatefulWidget {
  final Iterable<LocalizationsDelegate>? localizationsDelegates;
  final FastAppLoaderErrorBuilder? errorBuilder;
  final FastAppLoaderBuilder? loaderBuilder;
  final Iterable<Locale> supportedLocales;
  final Duration delayBeforeShowingLoader;
  final bool debugShowCheckedModeBanner;
  final Iterable<FastJob>? loaderJobs;
  final FastThemeBloc? themeBloc;
  final ThemeData? lightTheme;
  final ThemeData? darkTheme;
  final String titleText;
  final Locale? locale;
  final Widget home;

  FastApp({
    Key? key,
    required this.home,
    this.delayBeforeShowingLoader = const Duration(seconds: 1),
    this.supportedLocales = kFastSupportedLocales,
    this.debugShowCheckedModeBanner = false,
    this.titleText = kFastEmptyString,
    this.localizationsDelegates,
    this.loaderBuilder,
    this.errorBuilder,
    this.loaderJobs,
    this.lightTheme,
    this.darkTheme,
    this.themeBloc,
    this.locale,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FastAppState();
}

class _FastAppState extends State<FastApp> {
  late FastThemeBloc _themeBloc;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();

    _themeBloc = widget.themeBloc ??
        FastThemeBloc(
          initialState: FastThemeBlocState(
            brightness: WidgetsBinding.instance!.window.platformBrightness,
            themeMode: ThemeMode.system,
          ),
        );

    super.initState();
  }

  @override
  void dispose() {
    _themeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _hideKeyboard,
      child: BlocProvider(
        bloc: _themeBloc,
        child: BlocBuilderWidget(
          bloc: _themeBloc,
          waitForData: true,
          builder: (context, FastThemeBlocState state) {
            return MaterialApp(
              debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
              localizationsDelegates: widget.localizationsDelegates,
              darkTheme: widget.darkTheme ?? FastTheme.dark.blue,
              theme: widget.lightTheme ?? FastTheme.light.blue,
              navigatorKey: FastNotificationCenter.navigatorKey,
              supportedLocales: widget.supportedLocales,
              themeMode: state.themeMode,
              title: widget.titleText,
              locale: widget.locale,
              home: FastAppLoader(
                delayBeforeShowingLoader: widget.delayBeforeShowingLoader,
                appBuilder: (context) => widget.home,
                loaderBuilder: widget.loaderBuilder,
                errorBuilder: widget.errorBuilder,
                loaderJobs: widget.loaderJobs,
              ),
            );
          },
        ),
      ),
    );
  }

  void _hideKeyboard() {
    if (kIsWeb) return;

    if (Platform.isIOS || Platform.isAndroid) {
      FocusManager.instance.primaryFocus!.unfocus();
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
  }
}
