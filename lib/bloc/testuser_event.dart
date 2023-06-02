part of 'testuser_bloc.dart';

abstract class TestuserEvent extends Equatable {
  const TestuserEvent();

  @override
  List<Object> get props => [];
}

class OnUserDataEvent extends TestuserEvent {
  OnUserDataEvent();
}

class OnLogout extends TestuserEvent {
  OnLogout();
}