import 'package:anime_list_app/block/login_bloc/login_bloc.dart';
import 'package:anime_list_app/repository/user_repository.dart';
import 'package:anime_list_app/screens/login/login_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();

  // const LoginScreen({Key? key, required UserRepository userRepository}) : _userRepository = userRepository,
  // super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
      ),
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepository: _userRepository),
        child: Container(
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Text("Login page"),
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: LoginForm(userRepository: _userRepository,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}