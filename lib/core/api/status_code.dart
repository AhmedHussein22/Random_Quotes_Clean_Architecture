class StatusCode {
  static const int ok = 200;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int confilct = 409;
  static const int internalServerError = 500;
}

class RequestType {
  static const String get = 'get';
  static const String post = 'post';
  static const String put = 'put';
  static const String delete = 'delete';
}
