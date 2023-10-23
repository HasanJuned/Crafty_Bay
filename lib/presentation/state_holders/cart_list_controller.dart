import 'package:crafty_bay/data/models/cart_list_data.dart';
import 'package:crafty_bay/data/models/product_details_model.dart';
import 'package:get/get.dart';

import '../../data/models/cart_list_model.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class CartListController extends GetxController {
  bool _getCartListInProgress = false;
  CartListModel _cartListModel = CartListModel();
  ProductDetailsModel _productDetailsModel = ProductDetailsModel();
  String _message = '';
  double _totalPrice = 0;

  bool get getCartListInProgress => _getCartListInProgress;

  CartListModel get cartListModel => _cartListModel;
  ProductDetailsModel get productDetailsModel => _productDetailsModel;

  String get message => _message;

  double get totalPrice => _totalPrice;

  Future<bool> getCartList() async {
    _getCartListInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getCartList);
    _getCartListInProgress = false;
    if (response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.responseJson!);
      _productDetailsModel = ProductDetailsModel.fromJson(response.responseJson!);
      _calculateTotalPrice();
      update();
      return true;
    } else {
      _message = 'Get cart list failed! Try again';
      update();
      return false;
    }
  }

  void changeItem(int cartId, int noOfItems) {
    print(noOfItems);
    _cartListModel.data
        ?.firstWhere((element) => element.id == cartId)
        .numberOfItems = noOfItems;
    _calculateTotalPrice();
  }

  void _calculateTotalPrice() {
    _totalPrice = 0;
    for (CartListData data in _cartListModel.data ?? []) {
      _totalPrice += ((data.numberOfItems ?? 1) * (double.tryParse(data.productData?.price ?? '0') ?? 0));
    }
    update();
  }
}
