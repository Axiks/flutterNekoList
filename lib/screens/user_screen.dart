import 'package:anime_list_app/block/anime/anime_block.dart';
import 'package:anime_list_app/block/anime/anime_event.dart';
import 'package:anime_list_app/block/anime/anime_states.dart';
import 'package:anime_list_app/block/anime_favorite_check.dart';
import 'package:anime_list_app/block/authentication_bloc/authentication_bloc.dart';
import 'package:anime_list_app/block/authentication_bloc/authentication_event.dart';
import 'package:anime_list_app/block/authentication_bloc/authentication_state.dart';
import 'package:anime_list_app/models/anime.dart';
import 'package:anime_list_app/models/data.dart';
import 'package:anime_list_app/repository/user_repository.dart';
import 'package:anime_list_app/screens/login/login_screen.dart';
import 'package:anime_list_app/screens/register/register_screen.dart';
import 'package:anime_list_app/screens/widgets/gradient_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    UserRepository _userRepository = new UserRepository();

    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
              create: (BuildContext context) => AuthenticationBloc(userRepository: _userRepository),
          ),
          BlocProvider<AnimeBlock>(
            create: (BuildContext context) => AnimeBlock(AnimeInitial()),
          ),
          BlocProvider<AnimeFavoriteCheck>(
            create: (BuildContext context) => AnimeFavoriteCheck(false),
          ),
        ],
        child:  SingleChildScrollView(
          child: _SelectorWidget(),
        )
      ),
    );
  }
}

class _SelectorWidget extends StatelessWidget {
  const _SelectorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationEvent _authenticationEvent = AuthenticationStarted();
    context.read<AuthenticationBloc>().add(_authenticationEvent);

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if(state is AuthenticationInitial){
          return Center(child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text("Authentication Initial..."),
          ));
        }
        else if(state is AuthenticationSuccess){
          User _user = state.firebaseUser;
          return Center(child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: ProfileWidget(_user),
          ));
        }
        else{
          return Center(child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: LoginProposition(),
          ));
        }
      }
    );
  }
}

class LoginProposition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: CachedNetworkImage(
            imageUrl: "https://carbonmade-media.accelerator.net/33275348;1200x624.gif",
            placeholder: (context, url) => Center(child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey)
            )),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text("To take full advantage of the program, please log in"),
        SizedBox(
          height: 10,
        ),
        GradientButton(
          width: 150,
          height: 45,
          onPressed: () {
            print("Login btn press");
            Navigator.push(context, MaterialPageRoute(builder: (_){
              return LoginScreen();
            }
            ));
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
        Text("or"),
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
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final User _user;
  ProfileWidget(this._user);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GradientButton(
          width: 150,
          height: 45,
          onPressed: () {
            print("LogOut btn press");
            AuthenticationEvent _authenticationEvent = AuthenticationLoggedOut();
            context.read<AuthenticationBloc>().add(_authenticationEvent);
          },
          text: Text("Log out",
            style: TextStyle(
                color: Colors.white
            ),),
          icon: Icon(Icons.arrow_forward, color: Colors.white,),
        ),
        Stack(
          fit: StackFit.loose,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 64.0,
                horizontal: 8.0
              ),
              // child: ClipRRect(
              //     borderRadius: BorderRadius.circular(25),
              //     child: CachedNetworkImage(
              //       imageUrl: adrian.coverPicture,
              //       fit: BoxFit.cover,
              //     )
              // ),
            ),
            // Positioned(
            //     child: Container(
            //       child: CircleAvatar(
            //           radius: 64,
            //           backgroundImage: NetworkImage(adrian.mainPicture)
            //       ),
            //     ),
            // )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            _user.email.toString(),
            style: new TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Center(
          child: Text(
            "user_id: " + _user.uid.toString(),
            style: new TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          child: SizedBox(
            height: 10,
          ),
        ),
        Container(
          child: Text(
            "Favorite Anime",
            style: new TextStyle(
                fontSize: 21.0
            ),
          ),
        ),
        //AnimesWidget(adrian.favoriteAnime)
      ],
    );
    //return AnimesWidget(animes: animes);
  }
}

class AnimesWidget extends StatelessWidget {
  final List<Anime> animes;
  const AnimesWidget(this.animes, {Key? key}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeBlock, AnimeState>(
    builder: (context, state) {
      if(state is AnimeInitial){
        return Center(
            child: Text("Loading")
        );
      }else if(state is AnimeSuccessFalse){
        return Text("Помилка отримання даних");
      }else if(state is AnimeSuccessTrue){
        return Text("Success");
      }else{
        return Center(
            child: Text("Какая то лєва подія: " + state.toString())
        );
      }
    });
  }
}