import 'package:flutter/material.dart';
import '../medecine_detail_page.dart';
import 'medecine_models.dart'; // Assurez-vous que le modèle Medecine est importé

class MedecineCard extends StatelessWidget {
  final Medecine medecine;


  const MedecineCard({super.key, required this.medecine});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  MedecineDetailPage(path: medecine.urlPath, name: medecine.medecineName,)));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image de médicament (remplacer avec une vraie URL si nécessaire)
            Container(
              width: MediaQuery.of(context).size.width*0.7,
              margin:  const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color:  const Color.fromARGB(255, 196, 25, 25), // Placeholder
                borderRadius: BorderRadius.circular(14)
              ),
              height: 120,
              child: Image.asset(medecine.urlPath,fit: BoxFit.cover,scale: 1,),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(medecine.medecineName, style: const TextStyle(fontWeight: FontWeight.bold)),

            ),
                  Text(medecine.description, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal,color: Colors.grey[400])),
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 2),
              child:

            Row(

      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [


                  Text("${medecine.price} \$", style: const TextStyle(color: Colors.green)),

                Row(
              mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,

                        ),


                        child: const Center(child: Text("-", style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold))),
                    ),
                    const Text("2",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                      Container(
             padding:  const EdgeInsets.all(0),
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,

                        ),


                        child: const Center(child: Text("+",style:  TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                    ),
                  ],
                )
              ],
            ),
             )
          ],
        ),
      ),
    );
  }
}
