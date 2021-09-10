import 'package:anime_list_app/block/simple_bloc_observer.dart';
import 'package:anime_list_app/repository/user_repository.dart';
import 'package:anime_list_app/route_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'block/authentication_bloc/authentication_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(App());
}

class App extends StatefulWidget{
  @override
    _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong(snapshot.toString());
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          // final UserRepository userRepository = UserRepository();
          // return BlocProvider(create: (context) => AuthenticationBloc(
          //       userRepository: userRepository
          //   ),
          //   child: RouteWidget(userRepository: userRepository),
          //   );
          return RouteWidget();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}

class Loading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text("Loading///")),
      ),
    );
  }
}

class SomethingWentWrong extends StatelessWidget{
  final String _error;
  const SomethingWentWrong(this._error, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: Center(child: Text("Error !\n" + _error)),
    ));
  }
}

