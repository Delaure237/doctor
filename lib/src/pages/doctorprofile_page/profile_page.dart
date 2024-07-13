// ignore_for_file: unused_local_variable, dead_code


import 'package:doctor/src/models/doctor.dart';
import 'package:doctor/src/pages/appointment_page/date_hour_appointment.dart';
import 'package:doctor/src/pages/homepage/homepage_conponent/nav_bar.dart';
import 'package:doctor/src/pages/shared_between_pages/widgets/title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import '../appointment_page/apointment.dart';
import '../shared_between_pages/constant/constant.dart';
import '../shared_between_pages/widgets/my_button.dart';
class ProfilePage extends StatefulWidget {
  final Doctor doctor;
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
                    child: const Text(
                      """ 

    Lorem ipsum dolor sit amet consectetur adipisicing elit. Beatae corporis asperiores facilis est itaque ipsam quam tempora. Eaque, consequuntur aspernatur adipisci explicabo cupiditate doloribus consequatur ipsa facere reprehenderit, nesciunt laboriosam.
    Ducimus impedit, dolorum expedita blanditiis aperiam, nulla temporibus maiores corporis aut repudiandae veritatis iure voluptate dicta id cumque rerum natus delectus deserunt quod esse enim illo libero? Atque, expedita iusto.
    Hic, aliquam nostrum placeat voluptate voluptatem facere, quo beatae, vero necessitatibus earum reiciendis ipsam consequatur cum iusto corporis nihil eius ad suscipit! Illo corrupti in, dolor aperiam nam nulla id.
    Quibusdam architecto corrupti neque obcaecati ad amet rem hic impedit similique error minus odit incidunt accusamus saepe, tempore cum delectus iusto odio? Consectetur laudantium natus quis sed incidunt adipisci labore!
    Deserunt nisi ducimus in necessitatibus nulla eveniet voluptatum blanditiis explicabo? Deleniti temporibus sint dolores cumque reprehenderit illo eaque sunt! Soluta natus fugit fugiat, cumque ducimus et mollitia. Nesciunt, vero blanditiis!
    Lorem ipsum dolor sit amet consectetur adipisicing elit. Beatae corporis asperiores facilis est itaque ipsam quam tempora. Eaque, consequuntur aspernatur adipisci explicabo cupiditate doloribus consequatur ipsa facere reprehenderit, nesciunt laboriosam.
    Ducimus impedit, dolorum expedita blanditiis aperiam, nulla temporibus maiores corporis aut repudiandae veritatis iure voluptate dicta id cumque rerum natus delectus deserunt quod esse enim illo libero? Atque, expedita iusto.
    Hic, aliquam nostrum placeat voluptate voluptatem facere, quo beatae, vero necessitatibus earum reiciendis ipsam consequatur cum iusto corporis nihil eius ad suscipit! Illo corrupti in, dolor aperiam nam nulla id.
    Quibusdam architecto corrupti neque obcaecati ad amet rem hic impedit similique error minus odit incidunt accusamus saepe, tempore cum delectus iusto odio? Consectetur laudantium natus quis sed incidunt adipisci labore!
    Deserunt nisi ducimus in necessitatibus nulla eveniet voluptatum blanditiis explicabo? Deleniti temporibus sint dolores cumque reprehenderit illo eaque sunt! Soluta natus fugit fugiat, cumque ducimus et mollitia. Nesciunt, vero blanditiis!
                       """
                      , maxLines: 6,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "arial"
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
                    subtitle:const  Text("Mon-Fri,03:00 PM - 06:00PM",
                      style: TextStyle(
                          color: Colors.grey, fontSize: 12),),

                  ),

                  MyButton(onTap: () {
                   
                    setState(() {
                     
                       Navigator.push(context, MaterialPageRoute(builder: (ctx2) =>const  AppointmentInfo()));
                  },
                   );
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
                                
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExploreBar()));
                                  
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
                                      image: DecorationImage(
                                          image: AssetImage(widget.doctor.path),
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

                                        title: Text(
                                          widget.doctor.name, maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              wordSpacing: -1,
                                              letterSpacing: -1),),
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
                                        title: Text(widget.doctor.name,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              wordSpacing: -1,
                                              letterSpacing: -1),),
                                        subtitle: Text(widget.doctor.speciality,
                                          style: const TextStyle(
                                              color: Colors.grey,
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
          fontFamily: "arial"
      ),
    );
  }
}