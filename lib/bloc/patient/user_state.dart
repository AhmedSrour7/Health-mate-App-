/// Abstract Class
abstract class UserState {}
////////////////////////////////////////////////////////////////////////////////
/// Initial State
class UserInitial extends UserState {}
////////////////////////////////////////////////////////////////////////////////
/// Change Bottom Navigation Bar State
class UserChangeBottomNavigationBarState extends UserState {}
////////////////////////////////////////////////////////////////////////////////
/// Get Info States
class UserGetInfoLoadingState extends UserState {}
class UserGetInfoSuccessState extends UserState {}
class UserGetInfoErrorState extends UserState {
  String error;
  UserGetInfoErrorState({required this.error});
}
////////////////////////////////////////////////////////////////////////////////
/// Update Info States
class UserModelInfoLoadingState extends UserState {}
class UserModelInfoSuccessState extends UserState {
}
class UserModelInfoErrorState extends UserState {
  String error;
  UserModelInfoErrorState({required this.error});
}
////////////////////////////////////////////////////////////////////////////////
class UserGetHospitalAddressesLoadingState extends UserState {}
class UserGetHospitalAddressesSuccessState extends UserState {
}
class UserGetHospitalAddressesErrorState extends UserState {
  String error;
  UserGetHospitalAddressesErrorState({required this.error});
}

class UserGetPharmacyAddressesLoadingState extends UserState {}
class UserGetPharmacyAddressesSuccessState extends UserState {
}
class UserGetPharmacyAddressesErrorState extends UserState {
  String error;
  UserGetPharmacyAddressesErrorState({required this.error});
}

////////////////////////////////////////////////////////////////////////////////
/// Send Message
class SocialSendMessageSuccessState extends UserState {}
class SocialSendMessageErrorState extends UserState {}
///////////////////////////////////////////////////////////////////////////////
/// Get Message
class SocialGetMessageSuccessState extends UserState {}

/// pick profile image
class UserPickedProfilePhotoLoadingState extends UserState{}
class UserPickedProfilePhotoSuccessState extends UserState{}
class UserPickedProfilePhotoErrorState extends UserState{}

/// upload profile image
class UserUploadProfilePhotoLoadingState extends UserState{}
class UserUploadProfilePhotoSuccessState extends UserState{}
class UserUploadProfilePhotoErrorState extends UserState{}