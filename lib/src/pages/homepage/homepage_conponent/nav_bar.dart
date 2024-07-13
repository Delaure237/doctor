

import 'package:doctor/src/pages/homepage/homepage.dart';
import 'package:doctor/src/pages/message_page/message.dart';
import 'package:doctor/src/pages/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../shared_between_pages/constant/constant.dart';
class ExploreBar extends StatefulWidget {
  const ExploreBar({super.key});

  @override
  ExploreBarState createState() => ExploreBarState();


}
class ExploreBarState extends State<ExploreBar> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final kTabPages = <Widget>[
      const HomePage(),
      const SchedulePage(),
      const Message(),
      Container(),


    ];
    final kBottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Iconsax.home_15,), label: ""),
      const BottomNavigationBarItem(icon: Icon(Iconsax.calendar5), label: ""),
      const BottomNavigationBarItem(
          icon: Icon(Iconsax.message_favorite5,), label: ""),
      const BottomNavigationBarItem(icon: Icon(Iconsax.user), label: ""),
    ];
    assert(kTabPages.length == kBottomNavBarItems.length);
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
        bottomNavigationBar: Container(
          child: bottomNavBar,
        )
    );
  }
}