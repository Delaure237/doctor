import 'package:equatable/equatable.dart';

class MyAppointmentEntity extends Equatable{
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

 const MyAppointmentEntity(
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

     Map<String, Object?> toDocument() {
    return {
        'userId':userId,
       'date':date, 
       'hour':hour,
       'doctorId':doctorId, 
       'payementId': payementId,
       'payMethodName': payMethodName,
       'doctorSpeciality':doctorSpeciality,
       'doctorName':doctorName,
       'type':type,
       'patientName':patientName,
    };
     }
      static MyAppointmentEntity fromDocument(Map<String,dynamic> doc ){
       return MyAppointmentEntity(
      doctorSpeciality: doc['doctorSpeciality'], 
     userId: doc['userId'], 
     date: doc['date'], 
     hour: doc['hour'],
     type: doc['type'], 
     doctorId: doc['doctorId'], 
     doctorName: doc['doctorName'],
     patientName: doc['patientName'], 
    payementId: doc['payementId'], 
    payMethodName: doc['payMethodName']
       );
      }
      
        @override
       
        List<Object?> get props => [];

    
}

     
