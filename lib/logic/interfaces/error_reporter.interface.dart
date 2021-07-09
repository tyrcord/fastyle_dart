abstract class IFastErrorReporter {
  Future<void> recordError(
    dynamic error,
    StackTrace stackTrace, {
    String? reason,
  });

  Future<void> setCustomKey(String key, dynamic value);
}
