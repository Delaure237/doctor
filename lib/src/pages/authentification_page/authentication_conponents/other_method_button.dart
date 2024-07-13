
import 'package:doctor/src/pages/shared_between_pages/constant/constant.dart';
import 'package:flutter/material.dart';


class OtherMethodButton extends StatelessWidget {
  final String name;
  final Widget lead;
  final Function  onPressed;
  const OtherMethodButton({super.key, required this.name, required this.lead, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  
       Container(
        //padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity*0.9,
                  height: KToolbarHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(
                      color: Colors.grey,
                    )
                  ),
                 
                    child: GestureDetector(
                      onTap: (){
                        onPressed;
                      },
                    
                      
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            lead,
                           //const SizedBox(width: 12,),
                            Text(name,style: const TextStyle(fontSize: 18,fontFamily: "arial"),),
                          ],),
                        ),
                          
                         
                        
                        ),
                      
                
                  
                 
    );
  }
}