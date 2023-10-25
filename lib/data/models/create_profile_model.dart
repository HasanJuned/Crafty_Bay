import 'create_profile_data.dart';

class CreateProfileModel {
  String? msg;
  CreateProfileData? data;

  CreateProfileModel({this.msg, this.data});

  CreateProfileModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? CreateProfileData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

