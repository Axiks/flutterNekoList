import 'package:anime_list_app/home_screen.dart';
import 'package:anime_list_app/screens/anime_page_screen.dart';
import 'package:anime_list_app/screens/image_view_screen.dart';
import 'package:anime_list_app/screens/login/login_screen.dart';
import 'package:anime_list_app/screens/onboarding/onbording.dart';
import 'package:anime_list_app/screens/register/register_screen.dart';
import 'package:anime_list_app/screens/translate_anime_info_screen.dart';
import 'package:flutter/material.dart';

class RouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff4AA7B2),
      ),
      initialRoute: '/',
      routes: {
        '/':(BuildContext context) => HomeScreen(),
        '/image':(BuildContext context) => ImageViewScreen(),
        '/onbording':(BuildContext context) => Onbording(),
        '/login':(BuildContext context) => LoginScreen(),
        '/register':(BuildContext context) => RegisterScreen(),
      },
      onUnknownRoute: (routeSetting) => _errorRoute(),
      onGenerateRoute: (routeSetting){
        var path = routeSetting.name!.split('/');

        if(path[1] == 'anime') {
          int animeMalID = int.parse(path[2]);
          return MaterialPageRoute(
              builder: (context) => AnimePageScreen(animeMalID)
          );
        }

        if(path[1] == 'translate') {
          return new MaterialPageRoute(builder: (context) => new TranslateAnimeInfoScreen(int.tryParse(path[2]) ?? 0),
              settings: routeSetting);
        }
        return _errorRoute();
      },
    );
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('Error'),
      ),
    );
  });
}