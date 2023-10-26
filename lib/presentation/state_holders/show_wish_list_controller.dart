import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/show_wish_list_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';
import '../../data/utility/urls.dart';

class ShowWishListController extends GetxController {
  bool _showWishListInProgress = false;
  ShowWishListModel _showWishListModel = ShowWishListModel();
  String _message = '';

  bool get showWishListInProgress => _showWishListInProgress;
  ShowWishListModel get showWishListModel => _showWishListModel;
  String get message => _message;

  Future<bool> showWishList() async {
    _showWishListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.showWishList);
    _showWishListInProgress = false;
    if (response.isSuccess) {
      _showWishListModel = ShowWishListModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      _message = 'Wishlist fetch failed! Try again';
      update();
      return false;
    }
  }

  Future<bool> removeFromWishlist(int id) async {
    _showWishListInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.removeFromCart(id));
    _showWishListInProgress = false;
    if (response.isSuccess) {
      _showWishListModel.data?.removeWhere((element) => element.productId == id);
      update();
      return true;
    } else {
      _message = 'Wishlist deletion failed! Try again';
      update();
      return false;
    }
  }
}
