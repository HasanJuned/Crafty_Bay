import 'package:crafty_bay/data/models/create_profile_data.dart';
import 'package:crafty_bay/data/models/create_profile_model.dart';
import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class CreateProfileController extends GetxController {
  bool _createProfileInProgress = false;
  CreateProfileData _createProfileData = CreateProfileData();
  String _message = '';

  bool get createProfileInProgress => _createProfileInProgress;
  CreateProfileData get createProfileData => _createProfileData;
  String get message => _message;

  Future<bool> createProfile(String name, String address, String city,
      String state, String postCode, String country, String phone) async {
    _createProfileInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.createProfile, {
      "cus_name": name,
      "cus_add": address,
      "cus_city": city,
      "cus_state": state,
      "cus_postcode": postCode,
      "cus_country": country,
      "cus_phone": phone,
      "cus_fax": phone,
      "ship_name": name,
      "ship_add": address,
      "ship_city": city,
      "ship_state": state,
      "ship_postcode": postCode,
      "ship_country": country,
      "ship_phone": phone,
    });
    _createProfileInProgress = false;
    if (response.isSuccess) {
      _createProfileData = CreateProfileModel.fromJson(response.responseJson ?? {}).data!;
      update();
      return true;
    } else {
      _message = 'Profile creation failed! Try again';
      update();
      return false;
    }
  }
}
