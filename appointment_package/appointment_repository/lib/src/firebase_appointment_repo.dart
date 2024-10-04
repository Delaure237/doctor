import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../appointment_repository.dart';


class FirebaseAppointmentRepo extends AppointmentRepository {
  final appointmentCollection = FirebaseFirestore.instance.collection("appointments");

 

  // Créer un rendez-vous
  @override
  Future<void> createAppointment(Appointment appointment) async {
    try {
      log('Creating appointment with ID: ${appointment.id}');
      await appointmentCollection.doc(appointment.id).set(appointment.toEntity().toDocument());
      log('Appointment created successfully');
    } catch (e) {
      log('Error creating appointment: $e');
      rethrow;
    }
  }

  // Obtenir tous les rendez-vous
  @override
  Future<List<Appointment>> getAllAppointment() async {
    try {
      log('Fetching all appointments');
      final querySnapshot = await appointmentCollection.get();
      final appointments = querySnapshot.docs.map((e) => Appointment.fromEntity(AppointmentEntity.fromDocument(e.data()))).toList();
      log('Appointments fetched: ${appointments.length}');
      return appointments;
    } catch (e) {
      log('Error fetching all appointments: $e');
      rethrow;
    }
  }

  // Obtenir les rendez-vous pour un médecin
  @override
  Future<List<Appointment>> getDoctorAppointment(String doctorId) async {
    try {
      log('Fetching appointments for doctor ID: $doctorId');
      final querySnapshot = await appointmentCollection.where("doctorId", isEqualTo: doctorId).get();
      final appointments = querySnapshot.docs.map((e) => Appointment.fromEntity(AppointmentEntity.fromDocument(e.data()))).toList();
      log('Doctor appointments fetched: ${appointments.length}');
      return appointments;
    } catch (e) {
      log('Error fetching doctor appointments: $e');
      rethrow;
    }
  }

  // Obtenir les rendez-vous pour un patient
  @override
Stream<List<Appointment>> getAppointmentsForPatient(String patientId) {
  try {
    log('Listening to appointments for patient ID: $patientId');
    return appointmentCollection
        .where('patientId', isEqualTo: patientId)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) {
        log("No appointments found for user ID: $patientId");
      } else {
        log("Documents found: ${snapshot.docs.length}");
        for (var doc in snapshot.docs) {
          log("Document data: ${doc.data()}");
        }
      }
      return snapshot.docs
          .map((doc) => Appointment.fromEntity(AppointmentEntity.fromDocument(doc.data())))
          .toList();
    });
  } catch (e) {
    log('Error fetching patient appointments stream: $e');
    return Stream.error(e);
  }
}


  @override
 Stream<List<Appointment>> getAppointmentsForDoctor(String doctorId) {
  try {
    log('Listening to appointments for doctor ID: $doctorId');
    return appointmentCollection
        .where('doctorId', isEqualTo: doctorId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Appointment.fromEntity(AppointmentEntity.fromDocument(doc.data())))
          .toList();
    });
  } catch (e) {
    log('Error fetching doctor appointments stream: $e');
    return Stream.error(e);
  }
}


  
}
