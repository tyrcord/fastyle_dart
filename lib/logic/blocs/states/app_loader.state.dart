import 'package:tbloc_dart/tbloc_dart.dart';

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
  FastAppLoaderBlocState clone() {
    return FastAppLoaderBlocState(
      isLoading: isLoading,
      isLoaded: isLoaded,
      progress: progress,
      error: error,
    );
  }

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
  FastAppLoaderBlocState merge(covariant FastAppLoaderBlocState state) {
    return copyWith(
      isLoading: state.isLoading,
      isLoaded: state.isLoaded,
      progress: state.progress,
      error: state.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, isLoaded, progress, error];
}
