import 'package:crafty_bay/data/models/product_data.dart';

class CartListData {
  int? id;
  String? email;
  int? productId;
  String? color;
  String? size;
  String? createdAt;
  String? updatedAt;
  ProductData? productData;
  int? quantity;

  CartListData(
      {this.id,
        this.email,
        this.productId,
        this.color,
        this.size,
        this.createdAt,
        this.quantity,
        this.updatedAt,
        this.productData});

  CartListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    quantity = int.tryParse(json['qty'] ?? 1);
    productData = json['product'] != null ? ProductData.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['product_id'] = productId;
    data['color'] = color;
    data['size'] = size;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['product'] = productData;
    return data;
  }
}