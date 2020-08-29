import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class FastSectionPageController extends StatefulWidget {
  final WidgetBuilder loadingBuilder;
  final WidgetBuilder errorBuilder;
  final WidgetBuilder readyBuilder;
  final Future<bool> loadingFuture;
  final Duration loadingTimeout;

  FastSectionPageController({
    Key key,
    @required this.readyBuilder,
    this.loadingFuture,
    this.loadingBuilder,
    this.errorBuilder,
    this.loadingTimeout,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FastSectionPageControllerState();
}

class _FastSectionPageControllerState extends State<FastSectionPageController> {
  final PublishSubject<SectionPageEvent> eventController =
      PublishSubject<SectionPageEvent>();

  Future<bool> loadingFuture;
  bool hasError = false;
  bool isLoading;
  bool isReady;

  @override
  void initState() {
    isLoading = widget.loadingFuture != null;
    isReady = !isLoading;
    _listenToEvents();
    _listenToLoadingFutureIfNeeded();
    super.initState();
  }

  @override
  void didUpdateWidget(FastSectionPageController oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.loadingFuture != widget.loadingFuture) {
      isLoading = widget.loadingFuture != null;
      isReady = !isLoading;
      _listenToLoadingFutureIfNeeded();
    }
  }

  @override
  void dispose() {
    eventController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: isLoading
          ? _buildLoadingWidget()
          : hasError ? _buildErrorWidget() : widget.readyBuilder,
    );
  }

  WidgetBuilder _buildLoadingWidget() {
    return widget.loadingBuilder ??
        (BuildContext context) => FastThreeBounceIndicator();
  }

  WidgetBuilder _buildErrorWidget() {
    return widget.errorBuilder ?? (BuildContext context) => Container();
  }

  void _listenToLoadingFutureIfNeeded() {
    if (widget.loadingFuture != null) {
      loadingFuture = widget.loadingTimeout != null
          ? widget.loadingFuture.timeout(widget.loadingTimeout)
          : widget.loadingFuture;

      loadingFuture.then((bool isReady) {
        eventController.sink.add(
          isReady ? SectionPageEvent.Ready : SectionPageEvent.Error,
        );
      }).catchError((_) => eventController.sink.add(SectionPageEvent.Error));
    }
  }

  void _listenToEvents() {
    eventController.listen((SectionPageEvent event) {
      if (event == SectionPageEvent.Error) {
        setState(() {
          isLoading = false;
          isReady = false;
          hasError = true;
        });
      } else {
        setState(() {
          isLoading = false;
          isReady = true;
          hasError = false;
        });
      }
    });
  }
}

enum SectionPageEvent {
  Error,
  Ready,
}
