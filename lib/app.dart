

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleapiapp/bloc/testuser_bloc.dart';
import 'Screens/UserDataScreen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late TestuserBloc testuserBloc;

  @override
  void initState() {
    testuserBloc = TestuserBloc();
    super.initState();
  }

  @override
  void dispose() {
    testuserBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<UserDataBloc>(
        //   create: (context) => imageDataBloc,
        // ),
        BlocProvider<TestuserBloc>(
          create: (context) => testuserBloc,
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserDataScreen(),
      ),
    );
  }
}
