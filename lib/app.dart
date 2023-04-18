import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:t_helpers/helpers.dart';
import 'package:tbloc/tbloc.dart';

class FastApp extends StatefulWidget {
  final Iterable<LocalizationsDelegate>? localizationsDelegates;
  final GlobalKey<NavigatorState>? rootNavigatorKey;
  final FastAppLoaderErrorBuilder? errorBuilder;
  final FastAppLoaderBuilder? loaderBuilder;
  final Iterable<Locale> supportedLocales;
  final Duration delayBeforeShowingLoader;
  final IFastErrorReporter? errorReporter;
  final bool debugShowCheckedModeBanner;
  final Iterable<FastJob>? loaderJobs;
  final FastThemeBloc? themeBloc;
  final List<RouteBase> routes;
  final ThemeData? lightTheme;
  final String? initialRoute;
  final ThemeData? darkTheme;
  final String titleText;
  final Locale? locale;
  final Widget? home;

  const FastApp({
    super.key,
    this.routes = const <GoRoute>[],
    this.delayBeforeShowingLoader = const Duration(seconds: 1),
    this.supportedLocales = kFastSupportedLocales,
    this.debugShowCheckedModeBanner = false,
    this.titleText = kFastEmptyString,
    this.localizationsDelegates,
    this.rootNavigatorKey,
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
  });

  @override
  State<StatefulWidget> createState() => _FastAppState();
}

class _FastAppState extends State<FastApp> {
  late final GlobalKey<NavigatorState> _rootNavigatorKey;
  late final FastThemeBloc _themeBloc;
  late final GoRouter _router;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    _rootNavigatorKey = widget.rootNavigatorKey ?? GlobalKey<NavigatorState>();
    _router = _createRouter();
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
                child: _buildAppLoader(context, state.themeMode),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAppLoader(BuildContext context, ThemeMode? themeMode) {
    return FastAppLoader(
      appBuilder: (BuildContext context) => buildApp(context, themeMode),
      debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
      delayBeforeShowingLoader: widget.delayBeforeShowingLoader,
      localizationsDelegates: widget.localizationsDelegates,
      supportedLocales: widget.supportedLocales,
      errorReporter: widget.errorReporter,
      loaderBuilder: widget.loaderBuilder,
      errorBuilder: widget.errorBuilder,
      loaderJobs: widget.loaderJobs,
      lightTheme: widget.lightTheme,
      darkTheme: widget.darkTheme,
      locale: widget.locale,
    );
  }

  Widget buildApp(BuildContext context, ThemeMode? themeMode) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
      localizationsDelegates: widget.localizationsDelegates,
      darkTheme: widget.darkTheme ?? FastTheme.dark.blue,
      theme: widget.lightTheme ?? FastTheme.light.blue,
      supportedLocales: widget.supportedLocales,
      title: widget.titleText,
      locale: widget.locale,
      routerConfig: _router,
      themeMode: themeMode,
    );
  }

  Widget buildHome(BuildContext context) {
    if (widget.initialRoute != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(widget.initialRoute!);
      });

      return buildEmptyContainer(context);
    }

    return widget.home ?? buildEmptyContainer(context);
  }

  Widget buildEmptyContainer(BuildContext context) {
    final backgroungColor =
        ThemeHelper.colors.getPrimaryBackgroundColor(context);

    return Container(color: backgroungColor);
  }

  GoRouter _createRouter() {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => buildHome(context),
          routes: widget.routes,
        ),
      ],
    );
  }

  void _hideKeyboard() {
    if (isWeb) return;

    if (isIOS || isAndroid) {
      FocusManager.instance.primaryFocus?.unfocus();
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
  }
}
