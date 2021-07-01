import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter_getx_base/data/remote/api/response/base_error_response.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class NetWorkException implements Exception {
  final String? _message;
  final String? _prefix;
  final String? _statusText;
  final HttpStatus? _status;

  NetWorkException(
      [this._message, this._statusText, this._prefix, this._status]);

  String toString() {
    return "$_prefix(${_status?.code ?? ""}) ${getMessage()}";
  }

  String? getMessage() => _message ?? _statusText;

  factory NetWorkException.fromResponse(Response response) {
    var errorResponse =
        JsonMapper.deserialize<BaseErrorResponse>(response.bodyString);
    var errorMessage = errorResponse?.status?.message;
    var statusText = response.statusText;
    var status = response.status;
    try {
      if (response.status.isForbidden) {
        return ForbiddenException(errorMessage, statusText, status);
      } else if (response.status.connectionError) {
        return ConnectException(errorMessage, statusText, status);
      } else if (response.status.isNotFound) {
        return NotFoundException(errorMessage, statusText, status);
      } else if (response.status.isServerError) {
        return ServerException(errorMessage, statusText, status);
      } else if (response.status.isUnauthorized) {
        return AuthenException(errorMessage, statusText, status);
      }
    } catch (exception) {
      return NetWorkException.fromException(exception as Exception);
    }
    return UnKnownException(errorMessage, response.statusText, status);
  }

  factory NetWorkException.fromException(Exception exception) {
    if (exception is UnauthorizedException) {
      return AuthenException(
        exception.toString(),
        null,
        HttpStatus(HttpStatus.unauthorized),
      );
    } else if (exception is GetHttpException) {
      return ConnectException(exception.toString());
    }
    return UnKnownException(exception.toString());
  }
}

class ConnectException extends NetWorkException {
  ConnectException([String? message, String? statusText, HttpStatus? status])
      : super(message, statusText, "ConnectException:", status);
}

class FetchDataException extends NetWorkException {
  FetchDataException([String? message, String? statusText, HttpStatus? status])
      : super(message, statusText, "FetchDataException: ", status);
}

class BadRequestException extends NetWorkException {
  BadRequestException([String? message, String? statusText, HttpStatus? status])
      : super(message, statusText, "BadRequestException: ", status);
}

class AuthenException extends NetWorkException {
  AuthenException([String? message, String? statusText, HttpStatus? status])
      : super(message, statusText, "AuthenException: ", status);
}

class InvalidInputException extends NetWorkException {
  InvalidInputException(
      [String? message, String? statusText, HttpStatus? status])
      : super(message, statusText, "InvalidInputException: ", status);
}

class ForbiddenException extends NetWorkException {
  ForbiddenException([String? message, String? statusText, HttpStatus? status])
      : super(message, statusText, "ForbiddenException: ", status);
}

class NotFoundException extends NetWorkException {
  NotFoundException([String? message, String? statusText, HttpStatus? status])
      : super(message, statusText, "ForbiddenException: ", status);
}

class ServerException extends NetWorkException {
  ServerException([String? message, String? statusText, HttpStatus? status])
      : super(message, statusText, "ServerException: ", status);
}

class UnKnownException extends NetWorkException {
  UnKnownException([String? message, String? statusText, HttpStatus? status])
      : super(message, statusText, "UnKnownException: ", status);
}
