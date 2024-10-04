// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';

import '../entities/user_entity.dart';

class MyUser extends Equatable {
  final String userId;
  final String fullname;
  final String email;
  final String password;
  //final String path;

  const MyUser({
        required this.userId,
        required this.fullname,
        required this.email,
        required this.password,
        //required this.path
  });

  static const empty = MyUser(
       userId: "", 
       fullname: "",
       email: "",
       password: "", 
    //   path: "",
    );

  MyUser copyWith({
       String? password,
     String ? userId,
       String? email,
       String? fullname,
   
  }) {
       return MyUser(
       userId: userId ?? this.userId,
       fullname: fullname ?? this.fullname, 
       email: email?? this.email,
       password: password ?? this.password
      // path: path ?? this.path       
        );
  }

  MyUserEntity toEntity(){
    return MyUserEntity(
      userId: userId, 
      fullname: fullname, 
      email: email, 
      password: password
     // path:path
      );
  }

static MyUser fromEntity(MyUserEntity entity){
  return MyUser(
         userId: entity.userId,
         fullname: entity.fullname,
         email: entity.email,
         password: entity.password
  );
       //  path: entity.path
  
} @override 
 List<Object?> get props => [userId,fullname,email,password];
}