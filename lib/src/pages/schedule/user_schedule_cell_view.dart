// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:appointment_repository/appointment_repository.dart';

import 'package:doctor/src/pages/schedule/widgets/button.dart';
import 'package:doctor/src/pages/shared/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/utils.dart';

class ScheduleCellView extends StatelessWidget {
  final String name;
  final String speciality;
  final String date;
  final String time;
  final String urlPath;
  final  AppointmentStatus status; // Nouveau paramètre pour le statut

  const ScheduleCellView({
    super.key, 
    required this.name, 
    required this.date, 
    required this.time, 
    required this.urlPath, 
    required this.speciality, 
    required this.status // Ajouter le statut ici
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
            blurRadius: 7,
            offset: Offset(0, 1.5),
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height / 3.5,
      width: double.infinity,
      child: Column(
        children: [
          ListTile(
            title: Text(name),
            subtitle: Text(speciality),
            trailing: const CircleAvatar(
              
              backgroundImage: AssetImage(""), // Mettre l'URL de l'image si besoin
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
                      const Icon(Iconsax.calendar5, color: primaryIconColor, size: 16),
                      Text(date, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.clock5, color: primaryIconColor, size: 16),
                      Text(time, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle, 
                        color: getStatusColor(status), // Change la couleur en fonction du statut
                        size: 16,
                      ),
                      Text(
                        getStatusText(status), 
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Button(color: unfocusColor, text: "Cancel", textColor: Colors.black),
              Button(color: primaryColor, text: "Reschedule", textColor: bgColor),
            ],
          ),
        ],
      ),
    );
  }

  
  }

