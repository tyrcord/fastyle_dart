import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc/tbloc.dart';

class FastNavigationSplitViewState extends BlocState {
  final FastItem? item;
  final bool isLoading;
  final bool isLoaded;

  const FastNavigationSplitViewState({
    this.isLoading = false,
    this.isLoaded = false,
    this.item,
  }) : super();

  @override
  FastNavigationSplitViewState clone() => copyWith();

  @override
  FastNavigationSplitViewState copyWith({
    FastItem? item,
    bool? isLoading,
    bool? isLoaded,
  }) {
    return FastNavigationSplitViewState(
      item: item ?? this.item,
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  @override
  FastNavigationSplitViewState merge(
    covariant FastNavigationSplitViewState model,
  ) {
    return copyWith(
      item: model.item,
      isLoading: model.isLoading,
      isLoaded: model.isLoaded,
    );
  }

  @override
  List<Object?> get props => [isLoading, isLoaded, item];
}
