import 'package:projeto_sti3/src/shared/interface/base_exception.dart';

class ConnectionInvalidException extends BaseException {
  ConnectionInvalidException(super.message);
}

class LocalDatabaseException extends BaseException {
  LocalDatabaseException(super.message);
}

class ServerErrorException extends BaseException {
  ServerErrorException(super.message);
}
