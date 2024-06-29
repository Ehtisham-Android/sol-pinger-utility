abstract class UiState<T> {}

class OnEmpty<T> extends UiState<T> {}

class OnLoading<T> extends UiState<T> {}

class OnSuccess<T> extends UiState<T> {
  final T result;
  OnSuccess(this.result);
}

class OnError<T> extends UiState<T> {
  final String message;
  OnError(this.message);
}


