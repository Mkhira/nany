import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:nanny_co/business_layer/use_case/child/add_child_use_case.dart';
import 'package:nanny_co/business_layer/use_case/child/delete_child.dart';
import 'package:nanny_co/business_layer/use_case/child/get_child_use_case.dart';
import 'package:nanny_co/data/model/dto_model/child/add_child.dart';
import 'package:nanny_co/data/model/dto_model/child/child_response.dart';
import 'package:nanny_co/instance.dart';

part 'add_child_state.dart';

class AddChildCubit extends Cubit<AddChildState> {
  AddChildCubit() : super(AddChildInitial());

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  String gander = 'Male';
  String specialNeed = 'Yes';
  File? image;
  final _addChildUseCase = injector.get<AddChildUseCase>();
  final _getChild = injector.get<GetChildUseCase>();
  final _deleteChild = injector.get<DeleteChildUse>();

  getImage(File? file) {
    image = file;
    emit(AddChildGetImage());
  }
  Future<bool> addChild()async{
    try {
     await _addChildUseCase.execute(AddChildModel(image: image!, name: name.text, age: int.parse(age.text), gander: gander, specialNeed: specialNeed));
   return true;
    } on Exception catch (e) {
      return false;
    }
  }
  List<ChildItem>  childList =[];

   getChildList()async{
     childList =await _getChild.execute(null);
     print(childList);
     emit(AddChildGetImage());

   }   Future<bool> deleteChild(String id)async{
     try {
       await _deleteChild.execute(id);
       getChildList();
       emit(AddChildGetImage());

       return true;
     } on Exception catch (e) {
       return false;
     }


   }
}
