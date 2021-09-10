import 'package:anime_list_app/screens/widgets/gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget{
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: "email"
              ),
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.always,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: "password"
              ),
              autovalidateMode: AutovalidateMode.always,
            ),
            SizedBox(
              height: 10,
            ),
            GradientButton(
              width: 150,
              height: 45,
              onPressed: () { print("Register btn press"); },
              text: Text("Register",
                style: TextStyle(
                    color: Colors.white
                ),),
              icon: Icon(Icons.check, color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}