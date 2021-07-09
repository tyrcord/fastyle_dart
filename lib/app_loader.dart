import 'dart:async';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

import 'package:flutter/material.dart';

typedef FastAppLoaderBuilder = Widget Function(
  BuildContext context,
  double progress,
);

typedef FastAppLoaderErrorBuilder = Widget Function(
  BuildContext context,
  dynamic error,
);

class FastAppLoader extends StatefulWidget {
  final FastAppLoaderErrorBuilder? errorBuilder;
  final FastAppLoaderBuilder? loaderBuilder;
  final IFastErrorReporter? errorReporter;
  final Duration delayBeforeShowingLoader;
  final Iterable<FastJob>? loaderJobs;
  final WidgetBuilder appBuilder;

  const FastAppLoader({
    Key? key,
    required this.appBuilder,
    this.delayBeforeShowingLoader = const Duration(seconds: 1),
    this.loaderBuilder,
    this.errorReporter,
    this.errorBuilder,
    this.loaderJobs,
  }) : super(key: key);

  @override
  _FastAppLoaderState createState() => _FastAppLoaderState();
}

class _FastAppLoaderState extends State<FastAppLoader> {
  final _bloc = FastAppLoaderBloc();
  late final Timer _delayTimer;
  bool _isInitializing = false;
  bool _isInitialized = false;
  bool _canShowLoader = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isInitialized && !_isInitializing) {
      _isInitializing = true;
      _bloc.addEvent(FastAppLoaderBlocEvent.init(
        context,
        errorReporter: widget.errorReporter,
        jobs: widget.loaderJobs,
      ));

      _delayTimer = Timer(widget.delayBeforeShowingLoader, () {
        if (_bloc.currentState.isLoading) {
          setState(() => _canShowLoader = true);
        }
      });

      _isInitializing = false;
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _bloc,
      child: BlocBuilderWidget(
        bloc: _bloc,
        waitForData: true,
        builder: (BuildContext context, FastAppLoaderBlocState state) {
          if (state.isLoading) {
            if (widget.loaderBuilder != null && _canShowLoader) {
              return FastSectionPage(
                child: Builder(builder: (BuildContext context) {
                  return widget.loaderBuilder!(context, state.progress);
                }),
              );
            }
          } else if (state.isLoaded) {
            _delayTimer.cancel();

            return Builder(builder: widget.appBuilder);
          } else if (state.hasError && widget.errorBuilder != null) {
            _delayTimer.cancel();

            return FastSectionPage(
              child: Builder(builder: (BuildContext context) {
                return widget.errorBuilder!(context, state.error);
              }),
            );
          }

          return FastSectionPage();
        },
      ),
    );
  }
}
