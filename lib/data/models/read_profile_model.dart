import 'package:crafty_bay/data/models/read_profile_data.dart';

class ReadProfileModel {
  String? msg;
  ReadProfileData? data;

  ReadProfileModel({this.msg, this.data});

  ReadProfileModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? ReadProfileData.fromJson(json['data']) : null;
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




