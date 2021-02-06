class ServerException implements Exception {
  final message;

  ServerException([this.message]);

  @override
  String toString() {
    return "ServerError ${message?? ""}";
  }
}

///
/// This exception is the eqavalent exception for 429 error code.
///
class ServerTooManyRequestsException implements ServerException {
  final message;

  ServerTooManyRequestsException([this.message]);

  @override
  String toString() {
    return "ServerTooManyRequestsException ${message?? ""}";
  }
}



///
/// This exception occure when the server return unecxpected error code.
///
class ServerUnexpectedException implements ServerException {
  final message;

  ServerUnexpectedException([this.message]);

  @override
  String toString() {
    ///
    /// The expresstion [message?? ""] means that 
    /// if message is null, return the empty string(""),
    /// otherwise return the message himself.
    /// 
    return "ServerUnexpectedException ${message?? ""}";
  }
}
