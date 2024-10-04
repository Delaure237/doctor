// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:doctor_repository/doctor_repository.dart';
import 'package:flutter/material.dart';
import 'package:doctor/src/pages/shared/constant/constant.dart';
import 'package:appointment_repository/appointment_repository.dart';

class TypeOfAppointment extends StatefulWidget {
  final MyDoctor doctor;
  final Function(AppointmentType) onSelectedType;

  const TypeOfAppointment({
    super.key,
    required this.doctor,
    required this.onSelectedType,
  });

  @override
  State<TypeOfAppointment> createState() => _TypeState();
}

class _TypeState extends State<TypeOfAppointment> {
  AppointmentType selectedAppointmentType = AppointmentType.message;

  @override
  Widget build(BuildContext context) {
    final Map<AppointmentType, String> _imagePath = {
      AppointmentType.message: "lib/asset/images/m.png",
      AppointmentType.videoCall: "lib/asset/images/v.png",
      AppointmentType.audioCall: "lib/asset/images/c.png",
    };

    final Map<AppointmentType, String> _category = {
      AppointmentType.message: "Message",
      AppointmentType.videoCall: "Video Call",
      AppointmentType.audioCall: "Audio Call",
    };

    final Map<AppointmentType, String> _price = {
      AppointmentType.message: "\$${widget.doctor.messageConsultationFee.toStringAsFixed(2)} / consultation",
      AppointmentType.videoCall: "\$${widget.doctor.videoConsultationFee.toStringAsFixed(2)} / consultation",
      AppointmentType.audioCall: "\$${widget.doctor.audioConsultationFee.toStringAsFixed(2)} / consultation",
    };

    const double boxHeight = 70.0; // Hauteur fixe pour tous les champs

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _category.entries.map((entry) {
        final appointmentType = entry.key;
        final isSelected = selectedAppointmentType == appointmentType;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedAppointmentType = appointmentType;
            });
            widget.onSelectedType(appointmentType);
          },
          child: Container(
            height: boxHeight, // Hauteur fixe
            margin: const EdgeInsets.symmetric(vertical: 6), // Espacement
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? primaryColor : Colors.grey, // Change la couleur ici
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  _imagePath[appointmentType]!,
                  width: 30, // Taille réduite de l'image
                  height: 30, // Taille réduite de l'image
                  color: isSelected ? Colors.black : Colors.black,
                ),
                const SizedBox(width: 12), // Espacement entre l'image et le texte
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            entry.value,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.black : Colors.black,
                            ),
                          ),
                          const SizedBox(width: 6), // Espacement avant "Popular"
                          if (appointmentType == AppointmentType.videoCall)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 203, 230, 129),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                "Popular",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4), // Espacement entre titre et prix
                      Text(
                        _price[appointmentType]!,
                        style: TextStyle(
                          color: isSelected ? Colors.black54 : Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Radio(
                  value: appointmentType,
                  groupValue: selectedAppointmentType,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedAppointmentType = value;
                      });
                      widget.onSelectedType(selectedAppointmentType);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
