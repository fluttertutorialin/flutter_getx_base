import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter_getx_base/domain/modal/name_model.dart';
import 'package:flutter_getx_base/domain/modal/picture_model.dart';

@jsonSerializable
class UserModel {
  @JsonProperty(name: 'gender')
  String? gender;

  @JsonProperty(name: 'name')
  NameModel? name;

  @JsonProperty(name: 'email')
  String? email;

  @JsonProperty(name: 'phone')
  String? phoneNumber;

  @JsonProperty(name: 'cell')
  String? cellNumber;

  @JsonProperty(name: 'picture')
  PictureModel? pictureModel;

  @JsonProperty(converterParams: {'format': 'MM-dd-yyyy H:m:s'})
  DateTime? lastPromotionDate = DateTime(2008, 05, 13, 22, 33, 44);

  @JsonProperty(converterParams: {'format': 'MM/dd/yyyy'})
  DateTime? hireDate = DateTime(2003, 02, 28);
}
