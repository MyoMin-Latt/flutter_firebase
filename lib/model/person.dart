// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Person {
  String? id;
  String? name;
  String? phone1;
  String? phone2;
  String? no;
  String? street;
  String? housing;
  String? condo;
  String? township;
  String? city;
  String? createDate;
  String? modifiedDate;
  String? email;
  String? latitude;
  String? longitude;
  Person(
    this.id,
    this.name,
    this.phone1,
    this.phone2,
    this.no,
    this.street,
    this.housing,
    this.condo,
    this.township,
    this.city,
    this.createDate,
    this.modifiedDate,
    this.email,
    this.latitude,
    this.longitude,
  );

  Person copyWith({
    String? id,
    String? name,
    String? phone1,
    String? phone2,
    String? no,
    String? street,
    String? housing,
    String? condo,
    String? township,
    String? city,
    String? createDate,
    String? modifiedDate,
    String? email,
    String? latitude,
    String? longitude,
  }) {
    return Person(
      id ?? this.id,
      name ?? this.name,
      phone1 ?? this.phone1,
      phone2 ?? this.phone2,
      no ?? this.no,
      street ?? this.street,
      housing ?? this.housing,
      condo ?? this.condo,
      township ?? this.township,
      city ?? this.city,
      createDate ?? this.createDate,
      modifiedDate ?? this.modifiedDate,
      email ?? this.email,
      latitude ?? this.latitude,
      longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone1': phone1,
      'phone2': phone2,
      'no': no,
      'street': street,
      'housing': housing,
      'condo': condo,
      'township': township,
      'city': city,
      'createDate': createDate,
      'modifiedDate': modifiedDate,
      'email': email,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      map['id'] != null ? map['id'] as String : null,
      map['name'] != null ? map['name'] as String : null,
      map['phone1'] != null ? map['phone1'] as String : null,
      map['phone2'] != null ? map['phone2'] as String : null,
      map['no'] != null ? map['no'] as String : null,
      map['street'] != null ? map['street'] as String : null,
      map['housing'] != null ? map['housing'] as String : null,
      map['condo'] != null ? map['condo'] as String : null,
      map['township'] != null ? map['township'] as String : null,
      map['city'] != null ? map['city'] as String : null,
      map['createDate'] != null ? map['createDate'] as String : null,
      map['modifiedDate'] != null ? map['modifiedDate'] as String : null,
      map['email'] != null ? map['email'] as String : null,
      map['latitude'] != null ? map['latitude'] as String : null,
      map['longitude'] != null ? map['longitude'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) =>
      Person.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Person(id: $id, name: $name, phone1: $phone1, phone2: $phone2, no: $no, street: $street, housing: $housing, condo: $condo, township: $township, city: $city, createDate: $createDate, modifiedDate: $modifiedDate, email: $email, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(covariant Person other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phone1 == phone1 &&
        other.phone2 == phone2 &&
        other.no == no &&
        other.street == street &&
        other.housing == housing &&
        other.condo == condo &&
        other.township == township &&
        other.city == city &&
        other.createDate == createDate &&
        other.modifiedDate == modifiedDate &&
        other.email == email &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone1.hashCode ^
        phone2.hashCode ^
        no.hashCode ^
        street.hashCode ^
        housing.hashCode ^
        condo.hashCode ^
        township.hashCode ^
        city.hashCode ^
        createDate.hashCode ^
        modifiedDate.hashCode ^
        email.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
