class HospitalModel {
  int? pageSize;
  int? pageIndex;
  int? count;
  List<Data>? data;

  HospitalModel({this.pageSize, this.pageIndex, this.count, this.data});

  HospitalModel.fromJson(Map<String, dynamic> json) {
    pageSize = json['pageSize'];
    pageIndex = json['pageIndex'];
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageSize'] = this.pageSize;
    data['pageIndex'] = this.pageIndex;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? street;
  String? region;
  String? city;
  String? country;
  String? hotline;
  String? type;
  String? location;

  Data(
      {this.name,
        this.street,
        this.region,
        this.city,
        this.country,
        this.hotline,
        this.type,
        this.location});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    street = json['street'];
    region = json['region'];
    city = json['city'];
    country = json['country'];
    hotline = json['hotline'];
    type = json['type'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['street'] = this.street;
    data['region'] = this.region;
    data['city'] = this.city;
    data['country'] = this.country;
    data['hotline'] = this.hotline;
    data['type'] = this.type;
    data['location'] = this.location;
    return data;
  }
}
