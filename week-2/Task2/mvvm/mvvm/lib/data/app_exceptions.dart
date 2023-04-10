class AppException implements Exception{
  final _message;
  final _prefix;
  AppException([this._message,this._prefix]);
  String toString(){
    return '$_message$_prefix';
  }
}

class FetchDataException extends AppException{
  FetchDataException([String?message]):super(message,'Error During Communication');
}
class BadRequestException extends AppException{
  BadRequestException([String?message]):super(message,'Invalid Request');
}
class UnauthorisedException extends AppException{
  UnauthorisedException([String?message]):super(message,'Unauthorised Request');
}
