import 'package:crafty_bay/data/models/create_wish_list_data.dart';

class CreateWishListModel {
  String? msg;
  CreateWishListData? data;

  CreateWishListModel({this.msg, this.data});

  CreateWishListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? CreateWishListData.fromJson(json['data']) : null;
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


