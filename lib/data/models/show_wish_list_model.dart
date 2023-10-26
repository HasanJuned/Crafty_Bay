import 'package:crafty_bay/data/models/show_wish_list_data.dart';

class ShowWishListModel {
  String? msg;
  List<ShowWishListData>? data;

  ShowWishListModel({this.msg, this.data});

  ShowWishListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <ShowWishListData>[];
      json['data'].forEach((v) {
        data!.add(ShowWishListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


