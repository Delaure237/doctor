import 'package:equatable/equatable.dart';



class MyDoctorEntity extends  Equatable {
  final String userId;
  final String name;
  final String firstname;
  final String email;
  final String password;
  final String path;
   final String speciality;
  final int experience;
  final String about;
  final String place;

  const MyDoctorEntity({
      required this.speciality, 
      required this.experience,
      required this.about, 
      required this.place, 
      required this.userId,
      required this.firstname,
      required this.name,
      required this.email,
      required this.password,
      required this.path
  });

  Map<String, Object?> toDocument() {
    return {
       'userId':userId,
       'name':name, 
       'firstname':firstname,
       'email':email, 
       'password': password,
       'path': path,
       'about':about,
       'experience':experience,
       'place':place,
       'speciality':speciality,
    };
  }
  static MyDoctorEntity fromDocument(Map<String,dynamic> doc ){
    return MyDoctorEntity(
      speciality: doc['speciality'],
       experience: doc['experience'], 
       about: doc['about'],
        place: doc['place'],
        userId: doc['userId'],
        firstname: doc['firstname'],
        name: doc['name'], 
        email: doc['email'], 
        password: doc['password'], 
        path: doc['path']
        );
  }
  
  @override

  List<Object?> get props => throw UnimplementedError();
  }