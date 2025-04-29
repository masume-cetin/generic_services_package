abstract class ApiState<T> {}

class ApiInitial<T> extends ApiState<T> {}

class ApiLoading<T> extends ApiState<T> {}

class ApiSuccess<T> extends ApiState<T> {
  final T data;
  ApiSuccess(this.data);
}
class ApiError<T> extends ApiState<T> {
  final String message;
  ApiError(this.message);
}
