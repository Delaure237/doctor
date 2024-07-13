

import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:doctor/src/datas/doctor_data.dart';
import 'package:doctor/src/models/doctor.dart';
import 'package:doctor/src/pages/schedule/doctor_schedule_cell_view.dart';
import 'package:doctor/src/pages/shared_between_pages/constant/constant.dart';
import 'package:doctor/src/pages/shared_between_pages/widgets/appbar.dart';
import 'package:flutter/material.dart';


class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> with SingleTickerProviderStateMixin{
  late TabController _tabcontroller ;
  
  List<Doctor> doc = getSpecialistsData();
  @override
  void initState(){
    super.initState();
    _tabcontroller = TabController(length: 3, vsync: this);
  }
  @override
  void dispose(){
    _tabcontroller.dispose();
    super.dispose();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context, "Schedule"),
      body:   SafeArea(
        child: Padding(
          padding: const  EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Stack(
              children: [
                DefaultTabController(
                  
                  length: 3, child: 
                Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: SegmentedTabControl(
                  controller: _tabcontroller,
                    indicatorDecoration:
                        const BoxDecoration(color: primaryColor),
                    tabPadding: const EdgeInsets.all(defaultPadding),
                    selectedTabTextColor: bgColor,
                    tabTextColor: primaryColor,
                    height: KToolbarHeight,
                    barDecoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(26,0, 0, 0), // Couleur de l'ombre et son opacité
                            blurRadius: 7, // Flou de l'ombre
                            offset: Offset(0,1.5), // Décalage de l'ombre par rapport au container
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[400],
                        border: Border.all(
                        
                        style: BorderStyle.none,
                      )
                     ),
          
                    tabs: const [
                      SegmentTab(
                        textColor: primaryTextColor,
                        label: "Upcoming",
          
                        ),
                         SegmentTab(
                        label: "Completed",
                        textColor: primaryTextColor
                        
                        
                        ),
                         SegmentTab(
                        label: "Canceled",
                        textColor: primaryTextColor
                        
                        )
                    ]
                    ),
                ),
                ),
               
                  Padding(padding: const EdgeInsets.only(top: 80,),
                 child: TabBarView(
                    controller:_tabcontroller,
                  physics:  const BouncingScrollPhysics(),
                  children: [
                   
                      
                      Column(
                        children: [
                            Expanded(
                              child: ListView.separated(
                                reverse: true,
                               // padding: const EdgeInsets.symmetric(vertical:defaultPadding),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: ((context, index) {
                                        Doctor  doctor = doc[index];
                                       return ScheduleCellView(doctor: doctor,
                                        );
                                        
                                } 
                               
                              ),
                              separatorBuilder: (context,index)=>
                               const SizedBox(height: 12,), 
                              itemCount: doc.length,
                              
                              
                              ),
                            )
                      
                            ]
                            
                    ),
 

                      Container(color: Colors.red,),
                        Container(color: Colors.yellow,)
                         
                         
                         
                         
                 ]),
                 ),
               
          
          
              ]
            ),
        ),
      ),
      
    );
  }
}