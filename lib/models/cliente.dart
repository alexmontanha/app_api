class Cliente {
  late Address? address;
  late int? age;
  late String? firstName;
  late String? lastName;
  late List<PhoneNumber>? phoneNumber;

  Cliente(
      {this.address,
      this.age,
      this.firstName,
      this.lastName,
      this.phoneNumber});

  fromJson(Map<String, dynamic> json) {
    address = new Address()..fromJson(json['address']);
    age = json['age'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    if (json['phoneNumber'] != null) {
      phoneNumber = <PhoneNumber>[];
      json['phoneNumber'].forEach((v) {
        phoneNumber?.add(new PhoneNumber()..fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = address?.toJson();
    data['age'] = this.age;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    if (this.phoneNumber != null) {
      data['phoneNumber'] = phoneNumber?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  late String? city;
  late String? postalCode;
  late String? state;
  late String? streetAddress;

  Address({this.city, this.postalCode, this.state, this.streetAddress});

  fromJson(Map<String, dynamic> json) {
    city = json['city'];
    postalCode = json['postalCode'];
    state = json['state'];
    streetAddress = json['streetAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['postalCode'] = this.postalCode;
    data['state'] = this.state;
    data['streetAddress'] = this.streetAddress;
    return data;
  }
}

class PhoneNumber {
  late String? number;
  late String? type;

  PhoneNumber({this.number, this.type});

  fromJson(Map<String, dynamic> json) {
    number = json['number'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['type'] = this.type;
    return data;
  }
}
