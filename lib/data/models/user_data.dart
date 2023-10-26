class UserData {
  int? id;
  String? email;
  String? otp;
  String? createdAt;
  String? updatedAt;

  UserData({this.id, this.email, this.otp, this.createdAt, this.updatedAt});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    otp = json['otp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['otp'] = otp;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}