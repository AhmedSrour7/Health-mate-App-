class AllPatientModel {
  String? firstName;
  String? lastName;
  String? userName;
  String? pictureUrl;
  String? email;
  String? deviceToken;
  String? phoneNumber;

  AllPatientModel(
      {this.firstName,
      this.lastName,
      this.userName,
      this.pictureUrl,
      this.deviceToken,
      this.email,
      this.phoneNumber});

  AllPatientModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    pictureUrl = json['pictureUrl'];
    deviceToken = json['deviceToken'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }
}
