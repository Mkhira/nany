import 'dart:io';

import 'package:nanny_co/data/model/dto_model/update_profile/post_update_parent.dart';

class ParentUpdateModel {
  final PostUpdateParentModel postUpdateParentModel;
  final File? image;

  ParentUpdateModel({required this.postUpdateParentModel, required this.image});
}
