
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  bool _getPopularProductInProgress = false;
  ProductModel _productModel = ProductModel();
  String _errorMessage = '';

  bool get getPopularProductInProgress => _getPopularProductInProgress;

  ProductModel get productModel => _productModel;

  String get errorMessage => _errorMessage;

  Future<bool> getPopularProducts() async {
    _getPopularProductInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getProductsByRemarks('popular'));
    _getPopularProductInProgress = false;
    if (response.isSuccess) {
      _productModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'Popular Product fetch failed';
      update();
      return false;
    }
  }
}
