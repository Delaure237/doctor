part of 'doctor_auth_bloc.dart';
enum DrAuthenticationStatus{
  authenticated,
  unauthenticated,
  unknow,
}
class DoctorAuthBlocState extends Equatable{
  final DrAuthenticationStatus status;
  final User? doctor;
  const DoctorAuthBlocState._({
    this.status = DrAuthenticationStatus.unknow,
    this.doctor
  }); 
      

  const DoctorAuthBlocState.unknow(): this._();
  const DoctorAuthBlocState.authenticated(User doctor):
  this._(status:DrAuthenticationStatus.authenticated,doctor: doctor);
  const DoctorAuthBlocState .unauthenticated(): 
  this._(status: DrAuthenticationStatus.unauthenticated  );
   @override
  List<Object?> get props => [status,doctor];
}

/*sealed class DoctorAuthBlocState extends Equatable {
  const DoctorAuthBlocState();
  
  @override
  List<Object> get props => [];
}

final class DoctorAuthBlocInitial extends DoctorAuthBlocState {}
*/