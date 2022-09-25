class parentDataModel {
  String? fullname;
  String? username;
  String? image;
  String? email;
  String? password;
  String? mobile;
  String? dob;
  String? gender;
  List<Children>? children;
  List<dynamic>? gallery;
  List<dynamic>? favourite;
  Address? address;
  String ? id;

  parentDataModel(
      {this.fullname,
        this.username,
        this.image,
        this.email,
        this.password,
        this.mobile,
        this.dob,
        this.gender,
        this.children,
        this.gallery,
        this.address,this.id,this.favourite});

  parentDataModel.fromJson(Map<String, dynamic> json) {
    favourite=json['favourite'];
    fullname = json['fullname'];
    username = json['username'];
    image = json['image'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    dob = json['dob'];
    gender = json['gender'];
    id=json['id'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
    gallery = json['gallery'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favourite']=this.favourite;
    data['fullname'] = this.fullname;
    data['username'] = this.username;
    data['image'] = this.image;
    data['email'] = this.email;
    data['password'] = this.password;
    data['mobile'] = this.mobile;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['id']=this.id;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    data['gallery'] = this.gallery;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class Children {
  String? name;
  String? gender;
  String? image;
  bool? special;
  String? age;

  Children({this.name, this.gender, this.image, this.special,this.age});

  Children.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gender = json['gender'];
    image = json['image'];
    special = json['special'];
    age=json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['special'] = this.special;
    data['age']=age;
    return data;
  }
}

class Address {
  String? city;
  String? address;
  String? lat;
  String? lng;

  Address({this.city, this.address, this.lat, this.lng});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    address = json['address'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}
