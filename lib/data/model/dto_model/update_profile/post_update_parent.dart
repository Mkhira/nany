import 'dart:io';

// part 'post_update_parent.g.dart';

class PostUpdateParentModel {
  String? fullName;
  String? userName;
  String? email;
  String? phone;
  String? dob;
  File? image;
  int? cityId;
  String? gender;
  String? lat;
  String? lng;
  String? address;

  PostUpdateParentModel(
      {this.fullName,
      this.userName,
      this.email,
      this.phone,
      this.dob,
      this.image,
      this.cityId,
      this.gender,
      this.lat,
      this.lng,
      this.address});

  @override
  String toString() {
    return 'PostUpdateParentModel{fullName: $fullName, userName: $userName, email: $email, phone: $phone, dob: $dob, image: $image, cityId: $cityId, gender: $gender, lat: $lat, lng: $lng, address: $address}';
  }

// factory PostUpdateParentModel.fromJson(Map<String, dynamic> json) => _$PostUpdateParentModelFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$PostUpdateParentModelToJson(this);
}
