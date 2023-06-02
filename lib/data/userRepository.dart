
import 'package:dartz/dartz.dart';
import 'package:singleapiapp/data/userSource.dart';
import 'package:singleapiapp/model/userdataResponseModel.dart';

class UserdataRepository {
  final UserDataSource _userDataSource = UserDataSource();

  Future<Either<Error, UserDataResponseModel>> getUserData() async {
    return _userDataSource.getUserData();
  }
}
