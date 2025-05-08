abstract class UiState<T> {}

class UiLoading<T> extends UiState<T> {}

class UiSuccess<T> extends UiState<T> {
  final T data;
  UiSuccess(this.data);
}

class UiError<T> extends UiState<T> {
  final String message;
  UiError(this.message);
}