

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleapiapp/bloc/testuser_bloc.dart';

import '../widget/cardcard.dart';
import '../widget/indicator.dart';

class UserDataScreen extends StatelessWidget {
  const UserDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TestuserBloc>(context).add(OnUserDataEvent());
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Column(
                children: [
                  BlocBuilder<TestuserBloc, TestuserState>(
                    builder: (context, state) {
                      debugPrint(state.toString());
                      if (state is UserDataSuccess) {
                        print('heloooooooooooo');
                        if (state.result.data == null) {
                          return _buildPlaceHold("No items to show");
                        }
                        return CartCard(
                          userData: state.result.data,
                        );
                      }
                      if (state is UserDataLoading) {
                        return Indicator();
                      }
                      if (state is UserDataFail) {
                        return _buildPlaceHold(state.message);
                      }
                      return _buildPlaceHold("Something went wrong!");
                    },
                  ),
                ],
              )
            ],
          )),
    );
  }

  Widget _buildPlaceHold(String label) => Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Text(label),
            )),
          ],
        ),
      );
}
