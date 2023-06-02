import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:singleapiapp/data/userRepository.dart';
import 'package:singleapiapp/model/userdataResponseModel.dart';


part 'testuser_event.dart';
part 'testuser_state.dart';

class TestuserBloc extends Bloc<TestuserEvent, TestuserState> {
  final UserdataRepository userDataRepository = UserdataRepository();
  TestuserBloc() : super(InitialUserDataState()) {
    on<TestuserEvent>((event, emit) async {
      // TODO: implement event handler
      if(event is OnUserDataEvent){
         emit(UserDataLoading('hsdvhjsdhj'));
         final result = await userDataRepository.getUserData(
      );
      log(result.toString());
      result.fold((l) {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(UserDataFail("UserData failed"));
      }, (r) async {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(UserDataSuccess(r));
      });
      }
      
    });
  }
}
