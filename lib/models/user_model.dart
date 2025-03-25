class UserModel {
  String? gender;
  String? bod;
  String? bloodType;
  Doctor? doctor;
  Observer? observer;
  List<History>? history;
  String? email;
  Address? address;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? userName;
  String? pictureUrl;
  String? deviceToken;

  UserModel(
      {this.gender,
      this.bod,
      this.bloodType,
      this.doctor,
      this.observer,
      this.history,
      this.email,
      this.address,
      this.phoneNumber,
      this.firstName,
      this.lastName,
      this.userName,
      this.deviceToken,
      this.pictureUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    bod = json['bod'];
    bloodType = json['bloodType'];
    deviceToken = json['deviceToken'];

    doctor =
        json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    observer = json['observer'] != null
        ? new Observer.fromJson(json['observer'])
        : null;
    if (json['history'] != null) {
      history = <History>[];
      json['history'].forEach((v) {
        history!.add(new History.fromJson(v));
      });
    }
    email = json['email'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    phoneNumber = json['phoneNumber'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    pictureUrl = json['pictureUrl'];
  }
}

class Doctor {
  String? specialist;
  String? email;
  Address? address;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? userName;
  String? pictureUrl;
  String? deviceToken;

  Doctor(
      {this.specialist,
      this.email,
      this.address,
      this.phoneNumber,
      this.firstName,
      this.lastName,
      this.userName,
      this.deviceToken,
      this.pictureUrl});

  Doctor.fromJson(Map<String, dynamic> json) {
    specialist = json['specialist'];
    email = json['email'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    phoneNumber = json['phoneNumber'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    deviceToken = json['deviceToken'];

    pictureUrl = json['pictureUrl'];
  }
}

class Address {
  String? street;
  String? region;
  String? city;
  String? country;

  Address({this.street, this.region, this.city, this.country});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    region = json['region'];
    city = json['city'];
    country = json['country'];
  }
}

class Observer {
  String? email;
  Address? address;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? userName;
  String? pictureUrl;
  String? deviceToken;

  Observer(
      {this.email,
      this.address,
      this.phoneNumber,
      this.firstName,
      this.lastName,
      this.deviceToken,
      this.userName,
      this.pictureUrl});

  Observer.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    phoneNumber = json['phoneNumber'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    deviceToken = json['deviceToken'];

    pictureUrl = json['pictureUrl'];
  }
}

class History {
  dynamic heartRate;
  dynamic temperature;
  dynamic oxygen;
  dynamic ecg;
  String? measureDate;

  History(
      {this.heartRate,
      this.temperature,
      this.oxygen,
      this.ecg,
      this.measureDate});

  History.fromJson(Map<String, dynamic> json) {
    heartRate = json['heartRate'];
    temperature = json['temperature'];
    oxygen = json['oxygen'];
    ecg = json['ecg'] ??
        [
          72.34,
          84,
          32,
          45,
        ];
    measureDate = json['measureDate'];
  }
}
