class CreateWishListData {
  int? id;
  String? productId;
  String? userId;
  String? createdAt;
  String? updatedAt;

  CreateWishListData({this.id, this.productId, this.userId, this.createdAt, this.updatedAt});

  CreateWishListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}