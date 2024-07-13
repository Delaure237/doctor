import 'package:doctor_repository/doctor_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

import '../entities/appointment_entity.dart';

class MyAppointment extends Equatable{
  final String userId;
  final String date;
  final String hour;
  final String type;
  final String doctorId;
  final String doctorName;
  final String patientName;
  final String payementId;
  final String doctorSpeciality;
  final String payMethodName;

 const MyAppointment(
   {
    required this.doctorSpeciality,
    required this.userId, 
    required this.date, 
    required this.hour, 
    required this.type, 
    required this.doctorId, 
    required this.doctorName, 
    required this.patientName, 
    required this.payementId, 
    required this.payMethodName,
    });
    static const empty = MyAppointment(
      doctorSpeciality: "",
      userId: "",
      date: "", 
      hour: "", 
      type: "", 
      doctorId: "", 
      doctorName: "",
       patientName: "", 
       payementId: "", 
       payMethodName: ""
       );
       MyAppointment copyWith({
        String ? userId,
         String? date,
         String? hour,
         String? type,
         String? doctorId,
         String?doctorName,
         String? patientName,
         String? payementId,
         String? doctorSpeciality,
         String? payMethodName,
       }){
        return MyAppointment(
          doctorSpeciality: doctorSpeciality??this.doctorSpeciality,
          userId:          userId ??this.userId, 
          date:            date ??this.date, 
          hour:            hour??this.hour, 
          type:            type ??this.type, 
          doctorId:        doctorId ??this.doctorId, 
          doctorName:      doctorName ??this.doctorName, 
          patientName:     patientName ??this.patientName, 
          payementId:      payementId  ??this.payementId, 
          payMethodName:   payMethodName ??this.payMethodName,
          );
       }
MyAppointmentEntity toEntity(){

return MyAppointmentEntity(
  doctorSpeciality: doctorSpeciality,
  userId: userId, 
  date: date, 
  hour: hour, 
  type: type,  
  doctorId: doctorId, 
  doctorName: doctorName, 
  patientName: patientName, 
  payementId: payementId, 
  payMethodName: payMethodName
);
 }
 MyAppointment fromEntity(MyAppointmentEntity entity,MyDoctorEntity drEntity,MyUserEntity userEntity){
   return MyAppointment(
    doctorSpeciality: drEntity.speciality,
     userId: userEntity.userId, 
     date: entity.date, 
     hour: entity.hour,
      type: entity.type, 
      doctorId: drEntity.userId,
       doctorName: drEntity.firstname, 
       patientName: userEntity.fullname, 
       payementId: entity.payementId, 
       payMethodName: entity.payMethodName
       );
 }
    
      @override
     
      List<Object?> get props => throw UnimplementedError();
    }
