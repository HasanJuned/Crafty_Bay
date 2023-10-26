import 'package:crafty_bay/data/models/review_product_data.dart';

class ReviewProductModel {
  String? msg;
  ReviewProductData? data;

  ReviewProductModel({this.msg, this.data});

  ReviewProductModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? ReviewProductData.fromJson(json['data']) : null;
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

