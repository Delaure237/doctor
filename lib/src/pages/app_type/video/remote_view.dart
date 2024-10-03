import 'package:flutter/material.dart';

class RemoteCallView extends StatefulWidget {
  final String userName;
  final String userImage;

  const RemoteCallView({
    super.key,
    required this.userName,
    required this.userImage,
  });

  @override
  State<RemoteCallView> createState() => _RemoteCallViewState();
}

class _RemoteCallViewState extends State<RemoteCallView> with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
     animationController =AnimationController(vsync: this,duration:  const Duration(seconds: 1))
     ..forward()
     ..repeat(reverse:  true);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212), // Background sombre
      body: Stack(
        children: [
          // Remote video feed (placeholder for now)
          Positioned.fill(
            child: Opacity(
              opacity: 0.4,
              child: Container(
                color: Colors.black87,
              ),
            ),
          ),
          // Centrer l'image et le nom de l'utilisateur
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              AnimatedBuilder(animation: animationController, builder: (context,child){
                 return Container(
                           decoration: ShapeDecoration(
                            shape: const CircleBorder(),
                            color: Colors.white.withOpacity(0.5 )
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0*animationController.value),
                              child: child,
                            ),
                            
                 );
              },
              child: Container(
                height:100,
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: Colors.white,
                  ),
                  child:  ClipOval(
                        child: Image.asset("lib/asset/images/Basile-Njei.jpg"),
                 ),
              ),
              ),
                const SizedBox(height: 20.0),
                // Légende (nom de l'utilisateur)
                Text(
                  widget.userName, // Nom de l'utilisateur
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
