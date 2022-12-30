import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tbloc_dart/tbloc_dart.dart';
import 'package:tutils_dart/tutils_dart.dart';

class FastApp extends StatefulWidget {
  final Iterable<LocalizationsDelegate>? localizationsDelegates;
  final FastAppLoaderErrorBuilder? errorBuilder;
  final FastAppLoaderBuilder? loaderBuilder;
  final Iterable<Locale> supportedLocales;
  final Duration delayBeforeShowingLoader;
  final IFastErrorReporter? errorReporter;
  final Map<String, WidgetBuilder> routes;
  final bool debugShowCheckedModeBanner;
  final Iterable<FastJob>? loaderJobs;
  final FastThemeBloc? themeBloc;
  final ThemeData? lightTheme;
  final String? initialRoute;
  final ThemeData? darkTheme;
  final String titleText;
  final Locale? locale;
  final Widget? home;

  FastApp({
    Key? key,
    this.delayBeforeShowingLoader = const Duration(seconds: 1),
    this.routes = const <String, WidgetBuilder>{},
    this.supportedLocales = kFastSupportedLocales,
    this.debugShowCheckedModeBanner = false,
    this.titleText = kFastEmptyString,
    this.localizationsDelegates,
    this.errorReporter,
    this.loaderBuilder,
    this.errorBuilder,
    this.initialRoute,
    this.loaderJobs,
    this.lightTheme,
    this.darkTheme,
    this.themeBloc,
    this.locale,
    this.home,
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
            brightness: WidgetsBinding.instance.window.platformBrightness,
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
      child: FastMediaLayoutObserver(
        child: BlocProvider(
          bloc: _themeBloc,
          child: BlocBuilderWidget(
            bloc: _themeBloc,
            waitForData: true,
            builder: (BuildContext context, FastThemeBlocState state) {
              return FastAppErrorReporter(
                reporter: widget.errorReporter,
                child: MaterialApp(
                  debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
                  localizationsDelegates: widget.localizationsDelegates,
                  darkTheme: widget.darkTheme ?? FastTheme.dark.blue,
                  theme: widget.lightTheme ?? FastTheme.light.blue,
                  navigatorKey: FastNotificationCenter.navigatorKey,
                  supportedLocales: widget.supportedLocales,
                  themeMode: state.themeMode,
                  title: widget.titleText,
                  locale: widget.locale,
                  routes: widget.routes,
                  home: FastAppLoader(
                    delayBeforeShowingLoader: widget.delayBeforeShowingLoader,
                    errorReporter: widget.errorReporter,
                    loaderBuilder: widget.loaderBuilder,
                    errorBuilder: widget.errorBuilder,
                    loaderJobs: widget.loaderJobs,
                    appBuilder: _buildHome,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHome(BuildContext context) {
    if (widget.initialRoute != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(
          context,
          widget.initialRoute!,
        );
      });

      return _buildEmptyContainer(context);
    }

    return widget.home ?? _buildEmptyContainer(context);
  }

  Widget _buildEmptyContainer(BuildContext context) {
    final backgroungColor =
        ThemeHelper.colors.getPrimaryBackgroundColor(context);

    return Container(color: backgroungColor);
  }

  void _hideKeyboard() {
    if (isWeb) return;

    if (isIOS || isAndroid) {
      FocusManager.instance.primaryFocus!.unfocus();
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
  }
}
