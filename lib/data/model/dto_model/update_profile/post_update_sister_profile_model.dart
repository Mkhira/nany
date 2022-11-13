import 'dart:io';



class PostUpdateSisterProfileModel {
  PostUpdateSisterProfileModel({
    this.image,
    this.fullName,
    this.userName,
     this.email,
     this.phone,
    this.dob,
    this.cityId,
    this.gender,
    this.lat,
    this.lng,
    this.address,
    this.sitterType,
    this.courseName,
    this.universityName,
    this.educationCity,
    this.totalExperience,
    this.specialNeeds,
    this.idType,
    this.idNumber,
    this.lessonsType,
    this.minPrice,
    this.maxPrice,
    this.noOfChildren,
  });
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
   String? courseName;
   String? universityName;
   int? educationCity;
   int? totalExperience;
   String? specialNeeds;
   String? idType;
   String? idNumber;
   String? minPrice;
   String? maxPrice;
   int? lessonsType;
   String? noOfChildren;
   String? sitterType;

  @override
  String toString() {
    return 'PostUpdateSisterProfileModel{fullName: $fullName, userName: $userName, email: $email, phone: $phone, dob: $dob, image: $image, cityId: $cityId, gender: $gender, lat: $lat, lng: $lng, address: $address, courseName: $courseName, universityName: $universityName, educationCity: $educationCity, totalExperience: $totalExperience, specialNeeds: $specialNeeds, idType: $idType, idNumber: $idNumber, minPrice: $minPrice, maxPrice: $maxPrice, lessonsType: $lessonsType, noOfChildren: $noOfChildren, sitterType: $sitterType}';
  }
}
