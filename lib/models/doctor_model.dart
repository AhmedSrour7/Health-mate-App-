class DoctorModel {
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

  DoctorModel(
      {this.gender,
        this.bod,
        this.bloodType,
        this.doctor,
        this.deviceToken,

        this.observer,
        this.history,
        this.email,
        this.address,
        this.phoneNumber,
        this.firstName,
        this.lastName,
        this.userName,
        this.pictureUrl});

  DoctorModel.fromJson(Map<String, dynamic> json) {
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
    deviceToken = json['deviceToken'];

    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    phoneNumber = json['phoneNumber'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['region'] = this.region;
    data['city'] = this.city;
    data['country'] = this.country;
    return data;
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
    deviceToken = json['deviceToken'];

    lastName = json['lastName'];
    userName = json['userName'];
    pictureUrl = json['pictureUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['phoneNumber'] = this.phoneNumber;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['userName'] = this.userName;
    data['pictureUrl'] = this.pictureUrl;
    return data;
  }
}

class History {
  dynamic heartRate;
  dynamic temperature;
  dynamic oxygen;
  String? ecg;
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
    ecg = json['ecg'];
    measureDate = json['measureDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['heartRate'] = this.heartRate;
    data['temperature'] = this.temperature;
    data['oxygen'] = this.oxygen;
    data['ecg'] = this.ecg;
    data['measureDate'] = this.measureDate;
    return data;
  }
}
