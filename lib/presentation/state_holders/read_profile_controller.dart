import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/read_profile_data.dart';
import 'package:crafty_bay/data/models/read_profile_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  bool _readProfileInProgress = false;
  ReadProfileData _readProfileData = ReadProfileData();
  String _message = '';

  bool get readProfileInProgress => _readProfileInProgress;

  ReadProfileData get readProfileData => _readProfileData;

  String get message => _message;

  Future<bool> readProfile() async {
    _readProfileInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.readProfile);
    _readProfileInProgress = false;
    if (response.isSuccess) {
      _readProfileData =
          ReadProfileModel.fromJson(response.responseJson!).data!;
      update();
      return true;
    } else {
      _message = 'Read profile fetch failed. Try again!';
      update();
      return false;
    }
  }
}
