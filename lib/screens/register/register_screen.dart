import 'package:anime_list_app/repository/user_repository.dart';
import 'package:anime_list_app/screens/register/register_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Text("Register page"),
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: RegisterForm(),
              )
            ],
          ),
        ),
      ),
    );
  }

}