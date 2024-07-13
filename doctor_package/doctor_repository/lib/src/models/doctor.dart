import "package:equatable/equatable.dart";

import "../entities/doctor_entity.dart";

class MyDoctor extends Equatable{
  final String userId;
  
  final String firstname;
  final String name;
  final String email;
  final String password;
  final String path;
  final String speciality;
  final int experience;
  final String about;
  final String place;

  const MyDoctor({
        required this.speciality,
        required this.experience, 
        required this.about, 
        required this.place, 
        required this.userId,
        required this.name,
        required this.firstname,
        required this.email,
        required this.password,
        required this.path
  });
  static const empty = MyDoctor(
    speciality: "", 
    experience: 0, 
    about: "",
    place: "",
    userId: "", 
    firstname: "",
    name: "",
    email: "",
     password: "", 
     path: "",
     );

     MyDoctor copyWith({
       String? password,
       String? path,
       String? email,
       String? name,
       String? firstname,
       String? userId,
       String? speciality,
       String? about,
       String? place,
       int? experience

  }) {
       return MyDoctor(
       userId: userId ?? this.userId,
       name : name?? this.name,
       firstname: firstname ?? this.firstname, 
       email: email?? this.email,
       password: password ?? this.password,
       path: path ?? this.path, 
       speciality: speciality?? this.speciality, 
       experience: experience?? this.experience, 
       about: about?? this.about, 
       place: place?? this.place,
              
        );
  }
  MyDoctorEntity toEntity(){
    return MyDoctorEntity(
      userId: userId, 
      firstname :firstname,
      name: name, 
      email: email, 
      password: password, 
      path:path, 
      speciality: '', 
      experience: 0, 
      about: '', 
      place: ''
      );
  }

static MyDoctor fromEntity(MyDoctorEntity entity){
  return MyDoctor(
         name: entity.name,
         userId: entity.userId,
         firstname: entity.firstname,
         email: entity.email,
         password: entity.password, 
         path: entity.path, 
         experience: entity.experience,
          about: entity.about, 
          speciality: entity.speciality, 
          place: entity.place,
         );
  
}
  @override

  List<Object?> get props => throw UnimplementedError();
  
}