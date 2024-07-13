

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:doctor/src/pages/shared_between_pages/constant/constant.dart';
import 'package:doctor/src/pages/shared_between_pages/widgets/appbar.dart';
import 'package:doctor/src/pages/userprofile_page/widgets/row_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:user_repository/user_repository.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}


  final userCollection = FirebaseFirestore.instance.collection("user");
/*Future fetchUserData()  async {
  MyUser user =MyUser.empty;
   try {
     await userCollection
     .doc(user.userId)
     .get().then((map) => {
        "name":map["fullname"],
        "email":map["email"]
     });
     
   
     
   } catch (e) {
log(e.toString());
   }
  }*/
  Stream<MyUserEntity> fetchUserData(String userId) {
  
  return FirebaseFirestore.instance
      .collection('user')
      .doc(userId)
      .snapshots()
      .map((snapshot) => MyUserEntity.fromDocument(snapshot.data()!));
}
 // MyUserEntity user = MyUserEntity.fromDocument(data)
  


    

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        appBar: Header(context, ""),
         body: StreamBuilder<MyUserEntity>(
        stream: fetchUserData("eUspSFyH5XVuKGDFkxjc9iLJr203"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  const  Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return  const  Center(child: Text('--'));
          }

          final user = snapshot.data!;
           return SafeArea(
            
             child: SingleChildScrollView(
               child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 Container(
                  margin: const EdgeInsets.only(top: 0),
                    height:MediaQuery.of(context).size.height*0.3,
                    child: Stack(
                     alignment: AlignmentDirectional.topCenter,
                       children: [
                             Container(
                             // margin: const EdgeInsets.all(0),
                              color:primaryColor,
                      height: MediaQuery.of(context).size.height*0.2,
                      width: double.infinity,
                           
                            ),
                            
                    
                               const  Expanded(
                      flex: 1,
                      child:  Positioned(
                       top: 70,
                       // bottom: 40,
                         child:   Hero(
                          tag: "profile",
                           child: CircleAvatar(
                                     backgroundImage: AssetImage("lib/asset/images/Basile-Njei.jpg"),
                                    radius: 80,
                                  ),
                         ),
                       ),
                    ),
                        
                       ],
                    ),
                  ),
                
                  Padding(padding: const EdgeInsets.symmetric(horizontal: defaultPadding,vertical:5),
                    child: Column(
                      children: [
                        Text(user.fullname,style: GoogleFonts.poppins(textStyle: const TextStyle(fontWeight: FontWeight.w600)),),
                           Text(user.email),
                       
                          Column(
                          children: [
                            ProfilField(leading: Iconsax.edit, title: "Edit profile",trailing: const Icon(CupertinoIcons.chevron_right),onTap: (){},),
                            ProfilField(leading: Iconsax.translate5, title: "Language",trailing: const Icon(CupertinoIcons.chevron_right),onTap: (){}),
                            ProfilField(leading: Iconsax.notification5, title: "Notification",trailing:const Icon(CupertinoIcons.chevron_right),onTap: (){}),
                            ProfilField(leading: Iconsax.lock5, title: "Security",trailing: const  Icon(CupertinoIcons.chevron_right),onTap: (){}),
                            ProfilField(leading: Iconsax.security4, title: "Terms & privacy",trailing: const Icon(CupertinoIcons.chevron_right),onTap: (){}),
                            ProfilField(leading: Iconsax.moon5, title: "Dark Mode",trailing: CupertinoSwitch(value: true, onChanged: (val){}),onTap: (){}),
                            GestureDetector(
                              onTap: (){
                               
                               },
                              child: const ProfilField(leading: Iconsax.logout_15, title: "LogOut",
                              
                                
                              ),
                            ),
                          ],
                         ),
                         IconButton(onPressed: (){
                          context.read<SignInBloc>().add(const SignOutRequired());
                         }, icon:const  Icon(Icons.login_rounded))
                      ],
                    )
                    )
                  
                ],
               ),
             )
             );
           }
         )
      
    );
  }
}