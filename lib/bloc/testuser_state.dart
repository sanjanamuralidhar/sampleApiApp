part of 'testuser_bloc.dart';

abstract class TestuserState extends Equatable {
  const TestuserState();
  
  @override
  List<Object> get props => [];
}
class InitialUserDataState extends TestuserState {}

class UserDataLoading extends TestuserState {
  final String message;
  UserDataLoading(this.message);
}

class UserDataFail extends TestuserState {
  final String message;

  UserDataFail(this.message);
}

class UserDataSuccess extends TestuserState {
  final UserDataResponseModel result;

  UserDataSuccess(this.result);
}

class LogoutLoading extends TestuserState {}

class LogoutFail extends TestuserState {
  final String message;

  LogoutFail(this.message);
}

class LogoutSuccess extends TestuserState {}
