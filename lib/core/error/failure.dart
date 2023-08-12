abstract class Failure {
  final String message;

  Failure({required this.message});
}

class CacheFailure extends Failure {

  CacheFailure({required String message}):super(message:message);

}