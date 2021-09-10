import 'package:anime_list_app/block/login_bloc/login_bloc.dart';
import 'package:anime_list_app/block/login_bloc/login_event.dart';
import 'package:anime_list_app/block/login_bloc/login_state.dart';
import 'package:anime_list_app/repository/user_repository.dart';
import 'package:anime_list_app/screens/register/register_screen.dart';
import 'package:anime_list_app/screens/widgets/gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget{
  final UserRepository _userRepository;

  const LoginForm({Key? key, required UserRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //_loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChange);
    _passwordController.addListener(_onPasswordChange);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {

        if(state.isFailure) {
          print("failure");
          Scaffold.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Login Failure"),
                  Icon(
                      Icons.error,
                    color: Colors.white,
                  )
                ],
              ),
              backgroundColor: Color(0xffffae88),
            ),
            );
        }

        if(state.isSubmitting) {
          print("isSubmitting");
          Scaffold.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Logging..."),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                ],
              ),
            backgroundColor: Color(0xffffae88),
          ),
          );
        }

        if(state.isSuccess) {
          print("success");
          Scaffold.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Login success"),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                ],
              ),
              backgroundColor: Color(0xffffae88),
            ),
            );
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
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
                    autocorrect: false,
                    validator: (_){
                      print('Valid email: ' + state.isEmailValid.toString());
                      return !state.isEmailValid ? 'Invalid Email' : null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        labelText: "password"
                    ),
                    autovalidateMode: AutovalidateMode.always,
                    obscureText: true,
                    autocorrect: false,
                    validator: (_){
                      print('Valid password: ' + state.isPasswordValid.toString());
                      return !state.isPasswordValid ? 'Invalid Password' : null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GradientButton(
                    width: 150,
                    height: 45,
                    onPressed: () {
                      print("Login btn press");
                      _onFormSubmitted();
                      },
                    text: Text("Login",
                      style: TextStyle(
                          color: Colors.white
                      ),),
                    icon: Icon(Icons.check, color: Colors.white,),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GradientButton(
                    width: 150,
                    height: 45,
                    onPressed: () {
                      print("Register btn press");
                      Navigator.push(context, MaterialPageRoute(builder: (_){
                        return RegisterScreen();
                      }
                      ));
                    },
                    text: Text("Register",
                      style: TextStyle(
                          color: Colors.white
                      ),),
                    icon: Icon(Icons.arrow_forward, color: Colors.white,),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChange(){
    LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);
    _loginBloc.add(
      LoginEmailChange(email: _emailController.text)
    );
  }

  void _onPasswordChange() {
    LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);
    _loginBloc.add(
        LoginPasswordChange(password: _passwordController.text)
    );
  }

  void _onFormSubmitted() {
    LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);
    _loginBloc.add(
      LoginWithCredentialsPressed(email: _emailController.text, password: _passwordController.text)
    );
  }

}