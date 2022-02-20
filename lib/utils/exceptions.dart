import 'package:flutter/foundation.dart';

class GenericException implements Exception {
  final String? errorType;
  final String? errorMsg;

  GenericException({this.errorType, this.errorMsg});

  String getMessage() {
    return "$errorType: $errorMsg";
  }
}

class NullEmptyException extends GenericException {
  NullEmptyException({@required String? errorType, @required String? errorMsg})
      : super(errorType: errorType, errorMsg: errorMsg);
}

class InvalidChoiceException extends GenericException {
  InvalidChoiceException(
      {@required String? errorType, @required String? errorMsg})
      : super(errorType: errorType, errorMsg: errorMsg);
}

class UnknownException extends GenericException {
  UnknownException({@required String? errorType, @required String? errorMsg})
      : super(errorType: errorType, errorMsg: errorMsg);
}
