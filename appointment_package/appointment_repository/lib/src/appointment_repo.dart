 
 
 import '../appointment_repository.dart';

abstract class AppointmentRepository {

  Future<void> createAppointment(Appointment appointment);

  Future<List<Appointment>> getAllAppointment();

    Future<List<Appointment>> getDoctorAppointment(String doctorId);

  Stream<List<Appointment>> getAppointmentsForPatient(String patientId);

     Stream<List<Appointment>> getAppointmentsForDoctor(String doctorId);


 }