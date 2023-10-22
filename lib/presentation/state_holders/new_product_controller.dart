
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class NewProductController extends GetxController {
  bool _getNewProductInProgress = false;
  ProductModel _productModel = ProductModel();
  String _errorMessage = '';

  bool get getNewProductInProgress => _getNewProductInProgress;

  ProductModel get productModel => _productModel;

  String get errorMessage => _errorMessage;

  Future<bool> getNewProducts() async {
    _getNewProductInProgress = true;
    update();

    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.getProductsByRemarks('new'));
    _getNewProductInProgress = false;
    if (response.isSuccess) {
      _productModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'New Product fetch failed';
      update();
      return false;
    }
  }
}
