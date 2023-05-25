import 'package:tbloc/tbloc.dart';

class FastAppLoaderBlocState extends BlocState {
  final double progress;
  final bool isLoading;
  final bool isLoaded;

  const FastAppLoaderBlocState({
    this.isLoading = false,
    this.isLoaded = false,
    this.progress = 0,
    dynamic error,
  }) : super(error: error);

  @override
  FastAppLoaderBlocState clone() => copyWith();

  @override
  FastAppLoaderBlocState copyWith({
    double? progress,
    bool? isLoading,
    bool? isLoaded,
    dynamic error,
  }) {
    return FastAppLoaderBlocState(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      progress: progress ?? this.progress,
      error: error,
    );
  }

  @override
  FastAppLoaderBlocState merge(covariant FastAppLoaderBlocState model) {
    return copyWith(
      isLoading: model.isLoading,
      isLoaded: model.isLoaded,
      progress: model.progress,
      error: model.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, isLoaded, progress, error];
}
