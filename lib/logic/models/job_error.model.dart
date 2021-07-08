class FastJobError {
  final StackTrace stackTrace;
  final String? debugLabel;
  final dynamic source;

  FastJobError({
    required this.stackTrace,
    required this.source,
    this.debugLabel,
  });
}
