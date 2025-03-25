/// Abstract Class
abstract class DoctorState {}
////////////////////////////////////////////////////////////////////////////////
/// Initial State
class DoctorInitial extends DoctorState {}
////////////////////////////////////////////////////////////////////////////////
class DoctorGetInfoLoadingState extends DoctorState {}
class DoctorGetInfoSuccessState extends DoctorState {}
class DoctorGetInfoErrorState extends DoctorState {
  String error;
  DoctorGetInfoErrorState({required this.error});
}
////////////////////////////////////////////////////////////////////////////////
class DoctorGetAllPatientLoadingState extends DoctorState {}
class DoctorGetAllPatientSuccessState extends DoctorState {
}
class DoctorGetAllPatientErrorState extends DoctorState {
  String error;
  DoctorGetAllPatientErrorState({required this.error});
}

class DoctorGetPatientDetailsLoadingState extends DoctorState {}
class DoctorGetPatientDetailsSuccessState extends DoctorState {
}
class DoctorGetPatientDetailsErrorState extends DoctorState {
  String error;
  DoctorGetPatientDetailsErrorState({required this.error});
}


/// Send Message
class SocialSendMessageSuccessState extends DoctorState {}
class SocialSendMessageErrorState extends DoctorState {}
///////////////////////////////////////////////////////////////////////////////
/// Get Message
class SocialGetMessageSuccessState extends DoctorState {}

/// pick profile image
class DoctorPickedProfilePhotoLoadingState extends DoctorState{}
class DoctorPickedProfilePhotoSuccessState extends DoctorState{}
class DoctorPickedProfilePhotoErrorState extends DoctorState{}

/// upload profile image
class DoctorUploadProfilePhotoLoadingState extends DoctorState{}
class DoctorUploadProfilePhotoSuccessState extends DoctorState{}
class DoctorUploadProfilePhotoErrorState extends DoctorState{}
