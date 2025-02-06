/// Base Result class
/// Generik S merepresentasikan tipe data dari nilai kelas Success
sealed class Result<S> {
  const Result();
}

class Success<S> extends Result<S> {
  const Success(this.value);
  final S value;
}

class Failure<S> extends Result<S> {
  const Failure(this.error);
  final String error;
}