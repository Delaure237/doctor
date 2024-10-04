import "dart:async";



import "package:flutter/material.dart";

import "../../home/homepage_conponent/nav_bar.dart";
import "../../shared/constant/constant.dart";

 class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  final double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller ;
  late Animation<double> animation1;
  @override
  void initState(){
    super.initState();
    _controller = AnimationController(vsync: this,duration: const Duration(seconds: 3));
    animation1 = Tween<double>(begin: 40 ,end:  20).animate(
      CurvedAnimation(parent: _controller, curve: Curves.fastLinearToSlowEaseIn)
    )..addListener(() {
      setState(() {
        _textOpacity = 1.0;
      });

    });
    _controller.forward();
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });
    Timer( const Duration(seconds: 4), () {
       setState(() {
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ExploreBar()));
       });
     });

  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
     backgroundColor: bgColor,
     body: Stack(
      children: [
        Column(
          children: [
            AnimatedContainer(duration: const Duration(milliseconds: 2000),curve: Curves.fastLinearToSlowEaseIn,
           height: height/_fontSize,
            ),
            AnimatedOpacity(opacity: _textOpacity, duration: const Duration(milliseconds: 1000),
            child: Text(
                      "TheSpecialist",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: animation1.value,
                              fontFamily: "arial-bold"),
                        ),
            )
          ],
        ),
        Center(
          child: AnimatedOpacity(
            opacity: _containerOpacity,
          duration: const Duration(microseconds: 2000),
          curve: Curves.fastLinearToSlowEaseIn,
          child: AnimatedContainer(
            duration: const Duration(microseconds: 2000),
            height: width/_containerSize,
            width: width/_containerSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),

            ),
            child:  const Text(
                          "TheSpecialist",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 24,
                              fontFamily: "arial-bold"),
                        ),
          ),
          ),
        )
      ],
     ),
    );
  }

}
class PageTransition extends PageRouteBuilder {
  final Widget page;
  PageTransition(this.page):super(
    pageBuilder: (context,animation,anotherAnimation) =>page,
    transitionDuration: const Duration(milliseconds: 2000),
    transitionsBuilder: (context,animation ,anotherAnimation,child) {
      animation = CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn);
      return Align(
         alignment: Alignment.bottomCenter,
         child: SizeTransition(
          sizeFactor: animation,
          axisAlignment: 0,
          child: page,
         ),

      );
    }
    );
}