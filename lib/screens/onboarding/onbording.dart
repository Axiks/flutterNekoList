import 'package:anime_list_app/screens/onboarding/content_model.dart';
import 'package:flutter/material.dart';

class Onbording extends StatefulWidget{
  @override
  _OnbordingState createState() => _OnbordingState();

}

class _OnbordingState extends State<Onbording>{
  int currentIndex = 0;
  PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: contents.length,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (_,i){
          return Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: <Widget>[
                // Positioned(
                //   child: Text(
                //     "Skip",
                //     style: TextStyle(
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold,
                //         color: Theme.of(context).primaryColor
                //     ),
                //   ),
                //   top: 10,
                // ),
                Expanded(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      // FlatButton(
                      //   child: Text(
                      //     "Skip",
                      //     style: TextStyle(
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.bold,
                      //         color: Theme.of(context).primaryColor
                      //     ),
                      //   ),
                      //   onPressed: () {
                      //       Navigator.pushNamed(context, '/');
                      //   },
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image(
                            height: 200,
                            image: NetworkImage(contents[i].image)
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        contents[i].title,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        contents[i].discription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey
                        ),
                      ),
                    ],
                  ),
                  flex: 75,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            contents.length,
                                (index) => buildDot(index, context),
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        margin: EdgeInsets.all(40),
                        width: double.infinity,
                        child: FlatButton(
                          child: Text(
                              currentIndex == contents.length - 1 ? "Get started" : "Next"),
                          onPressed: () {
                            if (currentIndex == contents.length - 1) {
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) => Navigator.pushNamed(context, '/'),
                              //   ),
                              // );
                              Navigator.pushNamed(context, '/login');
                            }
                            _controller.nextPage(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.bounceIn,
                            );
                          },
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      )
                    ],
                  ),
                  flex: 25,
                ),
              ],
            ),
          );
        }
      ),
    );
  }
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}