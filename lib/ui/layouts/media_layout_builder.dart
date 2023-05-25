import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:tbloc/tbloc.dart';

typedef FastMediaLayoutWidgetBuilder = Widget Function(
  BuildContext context,
  FastMediaType mediaType,
);

class FastMediaLayoutBuilder extends StatelessWidget {
  final FastMediaLayoutWidgetBuilder builder;

  const FastMediaLayoutBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FastMediaLayoutBloc>(context);

    return BlocBuilderWidget(
      forceBuildWhenInializating: false,
      forceBuildWhenBusy: false,
      buildWhen: buildWhen,
      builder: buildChild,
      bloc: bloc,
    );
  }

  bool buildWhen(
    FastMediaLayoutBlocState previous,
    FastMediaLayoutBlocState next,
  ) {
    return previous.mediaType != next.mediaType;
  }

  Widget buildChild(BuildContext context, FastMediaLayoutBlocState state) {
    return builder(context, state.mediaType);
  }
}
