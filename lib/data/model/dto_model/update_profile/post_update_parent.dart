import 'package:json_annotation/json_annotation.dart';

part 'post_update_parent.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PostUpdateParentModel {
   String? fullName;
   String? userName;
   String? email;
   String? phone;
   String? dob;
   String? image;
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

  factory PostUpdateParentModel.fromJson(Map<String, dynamic> json) => _$PostUpdateParentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostUpdateParentModelToJson(this);
}
