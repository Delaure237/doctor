import 'package:equatable/equatable.dart';
import '../enum/enum.dart';
import 'package:flutter/material.dart';

class AppointmentEntity extends Equatable {
  final String doctorName;
  final String patientName;
  final String id;
  final String patientId;
  final String doctorId;
  final DateTime date; // Date du rendez-vous
  final TimeOfDay time; // Heure du rendez-vous
  final AppointmentType type;
  final PaymentMethod paymentMethod;
  final AppointmentStatus status;
  final String speciality;
  final String? notes;

  const AppointmentEntity({
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.date,
    required this.time,
    required this.type,
    required this.paymentMethod,
    required this.status,
    this.notes,
    required this.doctorName,
    required this.patientName,
    required this.speciality,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'patientId': patientId,
      'doctorId': doctorId,
      'date': date.toIso8601String(),
      'time': '${time.hour}:${time.minute}', // Stocke l'heure sous forme de chaîne
      'type': type.toString().split('.').last,
      'paymentMethod': paymentMethod.toString().split('.').last,
      'status': status.toString().split('.').last,
      'notes': notes,
      'doctorName': doctorName,
      'patientName': patientName,
      'speciality': speciality,
    };
  }

  static AppointmentEntity fromDocument(Map<String, dynamic> doc) {
    final timeParts = doc['time'].split(':');
    final time = TimeOfDay(
      hour: int.parse(timeParts[0]),
      minute: int.parse(timeParts[1]),
    );

    return AppointmentEntity(
      id: doc['id'],
      patientId: doc['patientId'],
      doctorId: doc['doctorId'],
      date: DateTime.parse(doc['date']),
      time: time, // Utilisation de TimeOfDay pour l'heure
      type: AppointmentType.values.firstWhere((e) => e.toString().split('.').last == doc['type']),
      paymentMethod: PaymentMethod.values.firstWhere((e) => e.toString().split('.').last == doc['paymentMethod']),
      status: AppointmentStatus.values.firstWhere((e) => e.toString().split('.').last == doc['status']),
      notes: doc['notes'],
      doctorName: doc['doctorName'],
      patientName: doc['patientName'],
      speciality: doc['speciality'],
    );
  }

  @override
  List<Object?> get props => [id, patientId, doctorId, date, time, type, paymentMethod, status, notes, patientName, doctorName, speciality];
}
