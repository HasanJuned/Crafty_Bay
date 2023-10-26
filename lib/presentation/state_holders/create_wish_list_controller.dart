import 'package:crafty_bay/data/models/create_wish_list_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';
import '../../data/utility/urls.dart';

class CreateWishListController extends GetxController {
  bool _createWishListInProgress = false;
  CreateWishListModel _createWishListModel = CreateWishListModel();
  String _message = '';

  bool get createWishListInProgress => _createWishListInProgress;

  CreateWishListModel get createWishListModel => _createWishListModel;

  String get message => _message;

  Future<bool> createWishList(int id) async {
    _createWishListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.createWishList(id));
    _createWishListInProgress = false;
    if (response.isSuccess) {
      _createWishListModel = CreateWishListModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      _message = 'Failed to add wishlist! Try again';
      update();
      return false;
    }
  }
}
