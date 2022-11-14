



import 'dart:io';

class AddChildModel{

  File image;
  String name;
  int age;
  String gander;
  String specialNeed;
  String? id;

  AddChildModel({required this.image,required  this.name,required this.age,required this.gander,required this.specialNeed,this.id});

  @override
  String toString() {
    return 'AddChildModel{image: $image, name: $name, age: $age, gander: $gander, specialNeed: $specialNeed}';
  }
}