

import 'package:equatable/equatable.dart';

class MyUserEntity extends  Equatable {
  final String userId;
  final String fullname;
  final String email;
  final String password;
  final String path;

  const MyUserEntity({
      required this.userId,
      required this.fullname,
      required this.email,
      required this.password,
      required this.path
  });

  Map<String, Object?> toDocument() {
    return {
       'userId':userId,
       'fullname':fullname, 
       'email':email, 
       'password': password,
       'path': path,
    };
  }
  static MyUserEntity fromDocument(Map<String ,dynamic> doc) {
    return MyUserEntity(
      userId: doc['userId'], 
      fullname: doc['fullname'], 
      email: doc['email'], 
      password: doc['password'], 
      path: doc['path'],
      );
  }
  @override
   List<Object> get props => [userId,fullname,email,password,path];

}