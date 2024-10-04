
// ignore_for_file: unused_field

import 'package:doctor/src/pages/shared/constant/constant.dart';
import 'package:doctor/src/pages/shared/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';



import '../shared/widgets/appbar.dart';
class Payement extends StatefulWidget {
  const Payement({super.key});

  @override
  State<Payement> createState() => _PayementState();
}

class _PayementState extends State<Payement> {
  final TextEditingController _paypalController = TextEditingController();
  final TextEditingController _cardnumberController = TextEditingController();
 // final TextEditingController _applepayController = TextEditingController();
    int selectedIndex = 0;
    final List<String> _path = [
     "lib/asset/images/icons8-paypal.svg",
     "lib/asset/images/icons8-mastercard.svg",
     "lib/asset/images/icons8-apple-pay.svg"
    ];
    final String privateKey =  "pk_test_51Q0mHqCUVI3fULzdEMeIgLlJnIykQbN4nQQvRpbUdYKRz4WfZVhpKcYX8iBbXe9PIMltv6xmcVthnECyNUPHd8pV00jVaKuzrK";
     final String    publicKey = "pk_test_51Q0mHqCUVI3fULzdEMeIgLlJnIykQbN4nQQvRpbUdYKRz4WfZVhpKcYX8iBbXe9PIMltv6xmcVthnECyNUPHd8pV00jVaKuzrK";
final List<String> _text = [
 "Paypal",
 "Master card",
 "Apple pay"
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context, "Appointment",[]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
              //  crossAxisAlignment: CrossAxisAlignment.center,
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                
                   Row(
                    mainAxisSize: MainAxisSize.max,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                       //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                     Expanded(child:title("Message")),
                        Expanded(child: title("25\$")),
                      ],
                     ),
                  const SizedBox(height: 12,),
                  
                      Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Expanded(child: title("taxe")),
                       Expanded(child: title("0\$"))
                      ],
                     ),
                  const SizedBox(height: 12,),
                   
                     Row(
                      children: [
                      Expanded(child: title("Total")),
                        Expanded(child: title("25\$")),
                      ],
                     ),
                      const  Divider(),
                   
              ],),
            
       
          SizedBox(
            height: 300,
             child: ListView.separated(
              separatorBuilder: (context1,index){
               return const SizedBox(height: 12,);
              },
              itemCount: 3,
              itemBuilder: (context1 ,index) => Container(
              
              
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    color: bgColor,
                  borderRadius: BorderRadius.circular(12),
                
                boxShadow: [
         BoxShadow(
        color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre et son opacité
        spreadRadius: 1, // Étendue de l'ombre
        blurRadius: 7, // Flou de l'ombre
          offset: const Offset(0, 1), // Décalage de l'ombre par rapport au container
         ),
         ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: defaultPadding ),
                  child: ListTile(
                    minLeadingWidth: defaultPadding,
                    leading: SvgPicture.asset(_path[index],height: 40,),
                    title: Text(_text[index],style: GoogleFonts.poppins(textStyle:const TextStyle(
                      fontWeight: FontWeight.w400,
                    )),),
                    trailing: const Icon(CupertinoIcons.forward),
                  ),
                )
              )
              ),
           ),

           
             
             
                     
                
              
                MyButton(onTap: (){}, text: "Make payementt"),
            
          
          ],
        ),
    
     
       
       
      
            
     
        )
          )
        
      

    );
  }
}
Widget title(String text){
  return Text(
     text,
     style: GoogleFonts.poppins(
      fontWeight : FontWeight.w300,
      fontSize:18,
      color :Colors.grey,
     ),
  );
}