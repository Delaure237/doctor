// ignore_for_file: unused_local_variable, dead_code, unused_import


import 'package:doctor/src/pages/appointment_page/date_hour_appointment.dart';
import 'package:doctor/src/pages/home/homepage_conponent/nav_bar.dart';
import 'package:doctor/src/pages/shared/widgets/title.dart';
import 'package:doctor_repository/doctor_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import '../appointment_page/apointment.dart';
import '../shared/constant/constant.dart';
import '../shared/widgets/my_button.dart';
class ProfilePage extends StatefulWidget {
  final MyDoctor doctor;
  const ProfilePage({super.key,required this.doctor});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    bool isSelected = false;
    bool isImageExpanded = false;
    final ktabs = <Tab>[
      const  Tab(text: "About",),
      const  Tab(text: "Review",),
      const  Tab(text: "Rating",),
    ];
    final kTabPages = <Widget>[
      SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding),
                child: Column(
                mainAxisAlignment:  MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 12,),
                  Container(
                    height:MediaQuery.of(context).size.height/4,
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: secondaryColor.withOpacity(0.2),

                    ),
                    child: Text(
                    widget.doctor.about
                      , maxLines: 4,
                      style: const TextStyle(
                        fontSize: 12,
                     
                      ),

                    ),
                  ),
                  const SizedBox(height: 12,),
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: secondaryColor,
                      image: const DecorationImage(image: AssetImage(
                          
                          "lib/asset/images/carte-localisation-ville_97886-2805.jpg"),
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                  //const SizedBox(height: 10,),
                  ListTile(
                    minVerticalPadding: 6,
                    title: Title( "Working Time"),
                    subtitle:const  Text(" Mon-Fri , 03:00 PM - 06:00 PM",
                      style: TextStyle(
                          color: Colors.grey, fontSize: 12),),

                  ),

                  MyButton(onTap: () {
                   
               
                     
                       Navigator.push(context, MaterialPageRoute(builder: (context1) => AppointmentInfo(doctor: widget.doctor,)));
                  
                   
                    },text: "Book an Appointment")
                  
                ]
            )
        ),
      ),
      const Center(child: Icon(Icons.emoji_events_rounded,color: primaryColor,),),
      const Center(child: Icon(Icons.emoji_people,color: primaryColor,),)
    ];
    return  DefaultTabController(
        initialIndex: 0,
        length:ktabs.length,
        child: Scaffold(

            body: SafeArea(
                child:CustomScrollView(
                  physics:const  NeverScrollableScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children :[
                           
                             Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: GestureDetector(child: const Icon(CupertinoIcons.back,color: Colors.grey),onTap: (){
                                
                                Navigator.pushAndRemoveUntil(
  context, 
  MaterialPageRoute(builder: (context) => const ExploreBar()), 
  (Route<dynamic> route) => false
);

                                  
                                },),
                              
                            ),
                            const  SizedBox(width: 105,),
                            const  title(text: "Doctor details"),
                          ]
                      ),

                      toolbarHeight: 50,
                      pinned: true,
                      flexibleSpace:Padding(
                        padding: const EdgeInsets.symmetric(horizontal: defaultPadding,vertical: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const  SizedBox(height: 24,),
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isImageExpanded =! isImageExpanded;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(seconds: 1),
                                    height: isImageExpanded ? 200 : 130,

                                  
                                    width: isImageExpanded ? 200 : 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                          image: AssetImage("lib/asset/images/placeholder.png"),
                                          fit: BoxFit.fill),
                                    ),
                                    curve: Curves.fastEaseInToSlowEaseOut,
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ListTile(
                                          minVerticalPadding: 10,
                                        title: Text(
                                          widget.doctor.name, maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                       
                                            ),),
                                        subtitle: Text(
                                          widget.doctor.speciality,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12),),
                                        horizontalTitleGap: 1,
                                        minLeadingWidth: 50,
                                        isThreeLine: true,
                                      ),
                                      ListTile(
                                        title: Text(widget.doctor.place,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              wordSpacing: -1,
                                              letterSpacing: -1),),
                                        subtitle: Text("${widget.doctor.experience.toString()}Year exprerience ",
                                          style: const TextStyle(
                                              color: Color.fromARGB(255, 35, 161, 88),
                                              fontSize: 12),),
                                      ),

                                    ],
                                  )),


                            ]
                        ),
                      ),
                      //  title: Titre(text: widget.doctor.name),
                      bottom: TabBar(
                        splashFactory: InkRipple.splashFactory,

                        splashBorderRadius: BorderRadius.zero,
                        unselectedLabelColor: Colors.grey,
                        indicatorWeight: 2,

                        labelColor: primaryColor,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: primaryColor,
                        tabs: ktabs,
                      ),
                      backgroundColor: Colors.white,
                      //pinned: true,
                      //floating: true,
                      //  snap: true,
                      expandedHeight: 270,
                    ),
                    SliverFillRemaining(
                      child: TabBarView(children: kTabPages),
                    )

                  ],
                )
            )
        )
    );


  }

  // ignore: non_constant_identifier_names
  Widget Title(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: -1,
          fontSize: 18,
          color: primaryColor,
     
      ),
    );
  }
}