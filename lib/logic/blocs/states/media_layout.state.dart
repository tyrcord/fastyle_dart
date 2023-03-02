import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

class FastMediaLayoutBlocState extends BlocState {
  final FastMediaType mediaType;
  final bool isLoading;
  final bool isLoaded;

  const FastMediaLayoutBlocState({
    this.mediaType = FastMediaType.handset,
    this.isLoading = false,
    this.isLoaded = false,
  }) : super();

  @override
  FastMediaLayoutBlocState clone() {
    return FastMediaLayoutBlocState(
      isLoading: isLoading,
      isLoaded: isLoaded,
      mediaType: mediaType,
    );
  }

  @override
  FastMediaLayoutBlocState copyWith({
    FastMediaType? mediaType,
    bool? isLoading,
    bool? isLoaded,
  }) {
    return FastMediaLayoutBlocState(
      mediaType: mediaType ?? this.mediaType,
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  @override
  FastMediaLayoutBlocState merge(covariant FastMediaLayoutBlocState model) {
    return copyWith(
      mediaType: model.mediaType,
      isLoading: model.isLoading,
      isLoaded: model.isLoaded,
    );
  }

  @override
  List<Object?> get props => [isLoading, isLoaded, mediaType];
}
