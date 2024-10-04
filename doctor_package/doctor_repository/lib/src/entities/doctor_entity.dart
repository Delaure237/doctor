import 'package:equatable/equatable.dart';

class MyDoctorEntity extends Equatable {
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
  final String dob;

  // Nouveaux champs pour les tarifs de consultation
  final double messageConsultationFee;
  final double videoConsultationFee;
  final double audioConsultationFee;

  // Nouveau champ pour le portefeuille
  final double wallet;

  const MyDoctorEntity({
    required this.dob,
    required this.speciality,
    required this.experience,
    required this.about,
    required this.place,
    required this.userId,
    required this.firstname,
    required this.name,
    required this.email,
    required this.password,
    required this.path,
    required this.messageConsultationFee,
    required this.videoConsultationFee,
    required this.audioConsultationFee,
    required this.wallet,
  });

  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'name': name,
      'firstname': firstname,
      'email': email,
      'password': password,
      'path': path,
      'about': about,
      'experience': experience,
      'place': place,
      'speciality': speciality,
      'dob': dob,
      'messageConsultationFee': messageConsultationFee,
      'videoConsultationFee': videoConsultationFee,
      'audioConsultationFee': audioConsultationFee,
      'wallet': wallet,
    };
  }

  static MyDoctorEntity fromDocument(Map<String, dynamic> doc) {
    return MyDoctorEntity(
      dob: doc['dob'] ?? '',
      speciality: doc['speciality'] ?? '',
      experience: doc['experience'] ?? 0,
      about: doc['about'] ?? '',
      place: doc['place'] ?? '',
      userId: doc['userId'] ?? '',
      firstname: doc['firstname'] ?? '',
      name: doc['name'] ?? '',
      email: doc['email'] ?? '',
      password: doc['password'] ?? '',
      path: doc['path'] ?? '',
      messageConsultationFee: doc['messageConsultationFee'] ?? 0.0,
      videoConsultationFee: doc['videoConsultationFee'] ?? 0.0,
      audioConsultationFee: doc['audioConsultationFee'] ?? 0.0,
      wallet: doc['wallet'] ?? 0.0,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        dob,
        firstname,
        name,
        email,
        password,
        path,
        speciality,
        experience,
        about,
        place,
        messageConsultationFee,
        videoConsultationFee,
        audioConsultationFee,
        wallet,
      ];
}
