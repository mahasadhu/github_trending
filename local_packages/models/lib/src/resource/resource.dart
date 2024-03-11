sealed class Resource<T> {}

class ResourceError<T> extends Resource<T> {
  final String message;
  final Exception? exception;

  ResourceError(this.message, this.exception);
}

class ResourceSuccess<T> extends Resource<T> {
  final T data;

  ResourceSuccess(this.data);
}