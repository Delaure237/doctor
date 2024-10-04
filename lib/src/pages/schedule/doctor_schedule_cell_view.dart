import 'package:appointment_repository/appointment_repository.dart';
import 'package:doctor/src/pages/schedule/widgets/button.dart';
import 'package:doctor/src/pages/schedule/widgets/utils.dart';
import 'package:doctor/src/pages/shared/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DrScheduleCellView extends StatelessWidget {
  final String name;
  final String date;
  final String time;
  final String urlPath;
  final AppointmentStatus status;
  final VoidCallback onConfirm; 

  const DrScheduleCellView({
    super.key,
    required this.name,
    required this.date,
    required this.time,
    required this.urlPath,
    required this.status,
    required this.onConfirm
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(26, 0, 0, 0), 
            blurRadius: 7, // Flou de l'ombre
            offset: Offset(0, 1.5), // Décalage de l'ombre par rapport au container
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height / 3.5,
      width: double.infinity,
      child: Column(
        children: [
          ListTile(
            title: Text(name),
            trailing: const CircleAvatar(
         
              backgroundImage: AssetImage(""),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                  
                    children: [
                      const Icon(Iconsax.calendar5, color: primaryIconColor, size: 18),
                    const  SizedBox(width:7),
                      Text(date.toString(), style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.clock5, color: primaryIconColor, size: 18),
                      const  SizedBox(width:7),
                      Text(time.toString(), style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.circle, color: getStatusColor(status), size: 18),
                      Text(getStatusText(status), style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Button(color: unfocusColor, text: "Cancel", textColor: Colors.black),
              Button(
                color: primaryColor,
                text: "Confirm",
                textColor: bgColor,
                onTap: onConfirm, // Fonction qui change le statut
              ),
            ],
          ),
        ],
      ),
    );
  }
}
