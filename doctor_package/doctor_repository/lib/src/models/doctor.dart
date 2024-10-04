import 'package:doctor_repository/doctor_repository.dart';
import 'package:equatable/equatable.dart';

class MyDoctor extends Equatable {
  final String userId;
  final String dob;
  final String firstname;
  final String name;
  final String email;
  final String password;
  final String path;
  final String speciality;
  final int experience;
  final String about;
  final String place;

  // Nouveaux champs pour les tarifs de consultation
  final double messageConsultationFee;
  final double videoConsultationFee;
  final double audioConsultationFee;

  // Nouveau champ pour le portefeuille
  final double wallet;

  const MyDoctor({
    required this.dob,
    required this.speciality,
    required this.experience,
    required this.about,
    required this.place,
    required this.userId,
    required this.name,
    required this.firstname,
    required this.email,
    required this.password,
    required this.path,
    required this.audioConsultationFee,
    required this.videoConsultationFee,
    required this.messageConsultationFee,
    required this.wallet,
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
    dob: '',
    messageConsultationFee: 0.0,
    videoConsultationFee: 0.0,
    audioConsultationFee: 0.0,
    wallet: 0.0,
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
    int? experience,
    String? dob,
    double? messageConsultationFee,
    double? videoConsultationFee,
    double? audioConsultationFee,
    double? wallet,
  }) {
    return MyDoctor(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      firstname: firstname ?? this.firstname,
      email: email ?? this.email,
      password: password ?? this.password,
      path: path ?? this.path,
      speciality: speciality ?? this.speciality,
      experience: experience ?? this.experience,
      about: about ?? this.about,
      place: place ?? this.place,
      dob: dob ?? this.dob,
      messageConsultationFee: messageConsultationFee ?? this.messageConsultationFee,
      videoConsultationFee: videoConsultationFee ?? this.videoConsultationFee,
      audioConsultationFee: audioConsultationFee ?? this.audioConsultationFee,
      wallet: wallet ?? this.wallet,
    );
  }

  MyDoctorEntity toEntity() {
    return MyDoctorEntity(
      userId: userId,
      firstname: firstname,
      name: name,
      email: email,
      password: password,
      path: path,
      speciality: speciality,
      experience: experience,
      about: about,
      place: place,
      dob: dob,
      messageConsultationFee: messageConsultationFee,
      videoConsultationFee: videoConsultationFee,
      audioConsultationFee: audioConsultationFee,
      wallet: wallet,
    );
  }

  static MyDoctor fromEntity(MyDoctorEntity entity) {
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
      dob: entity.dob,
      messageConsultationFee: entity.messageConsultationFee,
      videoConsultationFee: entity.videoConsultationFee,
      audioConsultationFee: entity.audioConsultationFee,
      wallet: entity.wallet,
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
