// ignore: file_names
// ignore_for_file: constant_identifier_names

import 'dart:developer';

import '../api/httpmanager.dart';
import '../model/userdataResponseModel.dart';
import 'package:dartz/dartz.dart';

enum T { Result, Error }

class UserDataSource {
  UserDataResponseModel? authenticatedUser;

  Future<Either<Error, UserDataResponseModel>> getUserData() async {
    String path = "https://dummy.restapiexample.com/api/v1/employees";
    final result = await httpManager.get(
      url: path,
    );
    if (result != null) {
      log("result  $result");
      return Right(UserDataResponseModel.fromJson(result));
    } else {
      log("error ${result.containsKey("error").toString()}");
      return Left(Error.fromJson(result['error']));
    }
  }
}