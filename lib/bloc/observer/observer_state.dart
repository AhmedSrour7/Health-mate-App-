/// Abstract Class
abstract class ObserverState {}
////////////////////////////////////////////////////////////////////////////////
/// Initial State
class ObserverInitial extends ObserverState {}
////////////////////////////////////////////////////////////////////////////////
class ObserverGetInfoLoadingState extends ObserverState {}
class ObserverGetInfoSuccessState extends ObserverState {}
class ObserverGetInfoErrorState extends ObserverState {
  String error;
  ObserverGetInfoErrorState({required this.error});
}
////////////////////////////////////////////////////////////////////////////////
class ObserverGetAllPatientLoadingState extends ObserverState {}
class ObserverGetAllPatientSuccessState extends ObserverState {
}
class ObserverGetAllPatientErrorState extends ObserverState {
  String error;
  ObserverGetAllPatientErrorState({required this.error});
}

class ObserverGetPatientDetailsLoadingState extends ObserverState {}
class ObserverGetPatientDetailsSuccessState extends ObserverState {
}
class ObserverGetPatientDetailsErrorState extends ObserverState {
  String error;
  ObserverGetPatientDetailsErrorState({required this.error});
}


/// Send Message
class SocialSendMessageSuccessState extends ObserverState {}
class SocialSendMessageErrorState extends ObserverState {}
///////////////////////////////////////////////////////////////////////////////
/// Get Message
class SocialGetMessageSuccessState extends ObserverState {}


/// pick profile image
class ObserverPickedProfilePhotoLoadingState extends ObserverState{}
class ObserverPickedProfilePhotoSuccessState extends ObserverState{}
class ObserverPickedProfilePhotoErrorState extends ObserverState{}

/// upload profile image
class ObserverUploadProfilePhotoLoadingState extends ObserverState{}
class ObserverUploadProfilePhotoSuccessState extends ObserverState{}
class ObserverUploadProfilePhotoErrorState extends ObserverState{}