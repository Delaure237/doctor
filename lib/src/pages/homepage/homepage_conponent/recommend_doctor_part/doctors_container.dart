import 'package:flutter/material.dart';

import '../../../../datas/doctor_data.dart';
import '../../../../models/doctor.dart';
import '../../../doctorprofile_page/profile_page.dart';
import 'doctor_cell_view.dart';
// ignore: must_be_immutable
class DoctorContainer extends StatelessWidget {


  List<Doctor> doc = getSpecialistsData();

  DoctorContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        surfaceTintColor: Colors.white,
        child: Container(
            decoration:const  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight:Radius.circular(5),topLeft: Radius.circular(5)),
            ),
            height: 500,

            child:Expanded(
              flex: 1,
              child:  ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context,int index){
                  Doctor  doctor = doc[index];
                  return GestureDetector(
                    child:  DoctorCellView(doctor: doctor),
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage(doctor: doc[index],))
                      );
                    },
                  );
                },
                separatorBuilder: ((BuildContext context ,index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(thickness: 1,),
                )
                ),
                itemCount: doc.length,
              ),
            )


        )

    );


  }

}