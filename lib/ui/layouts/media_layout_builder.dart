import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

typedef FastMediaLayoutWidgetBuilder = Widget Function(
  BuildContext context,
  FastMediaType mediaType,
);

class FastMediaLayoutBuilder extends StatelessWidget {
  final FastMediaLayoutWidgetBuilder builder;

  FastMediaLayoutBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FastMediaLayoutBloc>(context);

    return BlocBuilderWidget(
      bloc: bloc,
      builder: ((BuildContext context, FastMediaLayoutBlocState state) {
        return builder(context, state.mediaType);
      }),
    );
  }
}
