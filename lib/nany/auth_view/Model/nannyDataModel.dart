class nannyDataModel {
  String? fullname;
  String? username;
  String? image;
  String? email;
  String? password;
  String? mobile;
  String? dob;
  String? gender;
  int? price;
  String? type;
  String? experience;
  bool? special;
  int? children;
  String? nic;
  int? earnings;
  double? minRange;
  double? maxRange;
  List<dynamic>? gallery;
  Address? address;
  Education? education;
  List<Availability>? availability;
  Account? account;
  List<TransactionHistory>? transactionHistory;
  String?id;

  nannyDataModel(
      {this.fullname,
        this.id,
        this.username,
        this.image,
        this.email,
        this.password,
        this.mobile,
        this.dob,
        this.gender,
        this.price,
        this.type,
        this.experience,
        this.special,
        this.children,
        this.nic,
        this.earnings,
        this.gallery,
        this.address,
        this.education,
        this.availability,
        this.account,
        this.transactionHistory,this.maxRange,this.minRange});

  nannyDataModel.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    id=json['id'];
    username = json['username'];
    image = json['image'];
    minRange=json['min_range'];
    maxRange=json['max_range'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    dob = json['dob'];
    gender = json['gender'];
    price = json['price'];
    type = json['type'];
    experience = json['experience'];
    special = json['special'];
    children = json['children'];
    nic = json['nic'];
    earnings = json['earnings'];
    gallery = json['gallery'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    education = json['education'] != null
        ? new Education.fromJson(json['education'])
        : null;
    if (json['availability'] != null) {
      availability = <Availability>[];
      json['availability'].forEach((v) {
        availability!.add(new Availability.fromJson(v));
      });
    }
    account =
    json['account'] != null ? new Account.fromJson(json['account']) : null;
    if (json['transactionHistory'] != null) {
      transactionHistory = <TransactionHistory>[];
      json['transactionHistory'].forEach((v) {
        transactionHistory!.add(new TransactionHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['id']=this.id;
    data['username'] = this.username;
    data['image'] = this.image;
    data['email'] = this.email;
    data['password'] = this.password;
    data['mobile'] = this.mobile;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['price'] = this.price;
    data['type'] = this.type;
    data['experience'] = this.experience;
    data['special'] = this.special;
    data['min_range']=this.minRange;
    data['max_range']=this.maxRange;
    data['children'] = this.children;
    data['nic'] = this.nic;
    data['earnings'] = this.earnings;
    data['gallery'] = this.gallery;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.education != null) {
      data['education'] = this.education!.toJson();
    }
    if (this.availability != null) {
      data['availability'] = this.availability!.map((v) => v.toJson()).toList();
    }
    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }
    if (this.transactionHistory != null) {
      data['transactionHistory'] =
          this.transactionHistory!.map((v) => v.toJson()).toList();
    }
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

class Education {
  String? course;
  String? university;
  String? city;

  Education({this.course, this.university, this.city});

  Education.fromJson(Map<String, dynamic> json) {
    course = json['course'];
    university = json['university'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course'] = this.course;
    data['university'] = this.university;
    data['city'] = this.city;
    return data;
  }
}

class Availability {
  String? date;
  String? startTime;
  String? endTime;
  bool? booked;

  Availability({this.date, this.startTime, this.endTime, this.booked});

  Availability.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    booked = json['booked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['booked'] = this.booked;
    return data;
  }
}

class Account {
  String? name;
  String? number;
  String? irfc;

  Account({this.name, this.number, this.irfc});

  Account.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
    irfc = json['irfc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['number'] = this.number;
    data['irfc'] = this.irfc;
    return data;
  }
}

class TransactionHistory {
  String? bookingId;
  int? price;

  TransactionHistory({this.bookingId, this.price});

  TransactionHistory.fromJson(Map<String, dynamic> json) {
    bookingId = json['bookingId'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingId'] = this.bookingId;
    data['price'] = this.price;
    return data;
  }
}
