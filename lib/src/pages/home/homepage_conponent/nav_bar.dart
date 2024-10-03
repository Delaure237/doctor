import 'package:doctor/src/pages/app_type/chat/chatsPage.dart';
import 'package:doctor/src/pages/MedicPos/home.dart';
import 'package:doctor/src/pages/report/report.dart';
import 'package:doctor/src/pages/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../shared/constant/constant.dart';
import '../homepage.dart';

class ExploreBar extends StatefulWidget {
  const ExploreBar({super.key});

  @override
  ExploreBarState createState() => ExploreBarState();
}

class ExploreBarState extends State<ExploreBar> {
  int currentIndex = 0;






  @override
  Widget build(BuildContext context) {
    // Définir les pages en fonction du rôle de l'utilisateur
    final kTabPages = <Widget>[
      const HomePage(),
      const SchedulePage(),
      const ChatPage(),
      const Report(),
  const MedicPos(), // Ajouter MedicPos seulement pour les patients
    ];

    final kBottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Iconsax.home_15), label: ""),
      const BottomNavigationBarItem(icon: Icon(Iconsax.calendar5), label: ""),
      const BottomNavigationBarItem(icon: Icon(Iconsax.message_favorite5), label: ""),
      const BottomNavigationBarItem(icon: Icon(Iconsax.document5), label: ""),

        const BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: ""), // Ajouter l'icône de MedicPos
    ];

    //assert(kTabPages.length == kBottomNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedItemColor: primaryColor,
      items: kBottomNavBarItems,
      currentIndex: currentIndex,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
    );

    return Scaffold(
      body: kTabPages[currentIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
