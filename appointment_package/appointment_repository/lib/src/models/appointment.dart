// ignore_for_file: depend_on_referenced_packages, prefer_interpolation_to_compose_strings

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../enum/enum.dart';
import '../entities/appointment_entity.dart';

class Appointment extends Equatable {
  final String id;
  final String doctorName;
  final String patientName;
  final String patientId;
  final String doctorId;
  final String speciality;
  final DateTime date; // Date du rendez-vous
  final TimeOfDay time; // Heure du rendez-vous
  final AppointmentType type;
  final PaymentMethod paymentMethod;
  final AppointmentStatus status;
  final String? notes;

  const Appointment({
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.speciality,
    required this.date,
    required this.time,
    required this.type,
    required this.paymentMethod,
    required this.status,
    this.notes,
    required this.doctorName,
    required this.patientName,
  });

  // Getter pour une instance de rendez-vous vide
  static final empty = Appointment(
    id: '',
    patientId: '',
    doctorId: '',
    speciality: '',
    date: DateTime.now(),
    time: const TimeOfDay(hour: 0, minute: 0),
    type: AppointmentType.unknow,
    paymentMethod: PaymentMethod.unknow,
    status: AppointmentStatus.unknow,
    notes: '',
    doctorName: '',
    patientName: '',
  );

  Appointment copyWith({
    String? id,
    String? patientId,
    String? doctorId,
    DateTime? date,
    TimeOfDay? time,
    String? speciality,
    AppointmentType? type,
    PaymentMethod? paymentMethod,
    AppointmentStatus? status,
    String? notes,
    String? doctorName,
    String? patientName,
  }) {
    return Appointment(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      doctorId: doctorId ?? this.doctorId,
      date: date ?? this.date,
      time: time ?? this.time,
      type: type ?? this.type,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      doctorName: doctorName ?? this.doctorName,
      patientName: patientName ?? this.patientName,
      speciality: speciality ?? this.speciality,
    );
  }

  AppointmentEntity toEntity() {
    return AppointmentEntity(
      id: id,
      patientId: patientId,
      doctorId: doctorId,
      date: date,
      time: time,
      type: type,
      paymentMethod: paymentMethod,
      status: status,
      notes: notes,
      doctorName: doctorName,
      patientName: patientName,
      speciality: speciality,
    );
  }

  static Appointment fromEntity(AppointmentEntity entity) {
    return Appointment(
      id: entity.id,
      patientId: entity.patientId,
      doctorId: entity.doctorId,
      date: entity.date,
      time: entity.time,
      type: entity.type,
      paymentMethod: entity.paymentMethod,
      status: entity.status,
      notes: entity.notes,
      doctorName: entity.doctorName,
      patientName: entity.patientName,
      speciality: entity.speciality,
    );
  }

  @override
  List<Object?> get props => [id, patientId, doctorId, date, time, type, paymentMethod, status, notes, doctorName, patientName, speciality];
}

// Méthodes de formatage des dates et heures
String formatTime(TimeOfDay time) {
  return time.hour.toString().padLeft(2, '0') + ':' + time.minute.toString().padLeft(2, '0');
}

String formatDate(DateTime date) {
  return date.toIso8601String(); // Utilisation du format ISO 8601
}
