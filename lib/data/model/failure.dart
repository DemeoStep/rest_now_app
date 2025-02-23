import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:rest_now_app/app/localization/generated/l10n.dart';

abstract class Failure implements Exception {
  final String? message;
  final int? statusCode;

  Failure({this.message, this.statusCode});
}

class ServerFailure extends Failure {
  ServerFailure({super.message, super.statusCode});
}

class AppFailure extends Failure {
  final Exception? exception;

  AppFailure({this.exception, super.message, super.statusCode});
}

class StorageFailure extends Failure {
  StorageFailure();
}

extension FailureExtension on Failure {
  String getLocalizedMessage(BuildContext context) {
    switch (this) {
      case ServerFailure _:
        return S.of(context).serverError;
      case AppFailure _:
        return _getAppErrorMessage(context);
      case StorageFailure _:
        return S.of(context).storageError;
      default:
        return S.of(context).unknownError;
    }
  }

  String _getAppErrorMessage(BuildContext context) {
    final e = (this as AppFailure).exception;
    if (e != null && e is ClientException) {
      return S.of(context).networkError;
    }

    switch ((this as AppFailure).statusCode) {
      case 404:
        return S.of(context).networkError;
      default:
        return S.of(context).serverError;
    }
  }
}
