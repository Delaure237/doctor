import 'package:flutter/material.dart';
import 'package:doctor_repository/doctor_repository.dart'; // Assurez-vous que le chemin est correct

class DoctorCellView extends StatelessWidget {
  final MyDoctor doctor;

  const DoctorCellView({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
        
            borderRadius: BorderRadius.circular(5),
            image: const DecorationImage(
              image: AssetImage("lib/asset/images/placeholder.png"), // Remplacez par l'image correcte
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          doctor.name,
          style: const TextStyle(
            wordSpacing: -1,
            letterSpacing: -0.7,
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,

          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              doctor.speciality,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        trailing: Column(
          children: [
            const SizedBox(height: 15),
            Wrap(
              children: [
                const Icon(Icons.star_rate_rounded, color: Color.fromARGB(255, 236, 218, 49), size: 16),
                Text(
                  "${doctor.experience}", // Utilisez experience comme note
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
         /*   Text(
              "${doctor.place} km away", // Utilisez place comme distance
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
