
class AddressesModel {
  final String name;
  final String street;
  final String type;

  AddressesModel(
      {required this.name, required this.street, required this.type});

  factory AddressesModel.fromjson(json) {
    return AddressesModel(
      name: json['name'],
      street: json['street'],
      type: json['type'],
    );
  }
}
