class AppExceptions implements Exception {
  final String _message;
  final String _prefix;

  AppExceptions(this._message, this._prefix);
  @override
  String toString() => "$_prefix$_message";
}

class FetchDataException extends AppExceptions {
  final String message;
  FetchDataException(this.message)
    : super(message, "Error while fetching data");
}

class BadRequestException extends AppExceptions {
  final String message;
  BadRequestException(this.message) : super(message, "Error: bad request");
}

class NotFoundException extends AppExceptions {
  final String message;
  NotFoundException(this.message) : super(message, "Movie not found");
}
