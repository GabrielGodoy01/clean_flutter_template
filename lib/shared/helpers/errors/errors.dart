import 'package:clean_flutter_template/generated/l10n.dart';

class Failure implements Exception {
  final String message;

  Failure({required this.message});
}

class EntityError extends Failure {
  EntityError({required String message})
      : super(message: S.current.entityErrorMessage('', message));
}

class EmptyList extends Failure {
  EmptyList() : super(message: S.current.emptyListErrorMessage);
}

class ErrorRequest extends Failure {
  ErrorRequest({required String message})
      : super(message: S.current.requestErrorMessage('', message));
}

class NoItemsFound extends Failure {
  NoItemsFound({required String message})
      : super(message: S.current.noItemsFoundErrorMessage('', message));
}
