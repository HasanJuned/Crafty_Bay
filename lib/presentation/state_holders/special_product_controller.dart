
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class SpecialProductController extends GetxController {
  bool _getSpecialProductInProgress = false;
  ProductModel _productModel = ProductModel();
  String _errorMessage = '';

  bool get getSpecialProductInProgress => _getSpecialProductInProgress;

  ProductModel get productModel => _productModel;

  String get errorMessage => _errorMessage;

  Future<bool> getSpecialProducts() async {
    _getSpecialProductInProgress = true;
    update();

    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.getProductsByRemarks('special'));
    _getSpecialProductInProgress = false;
    if (response.isSuccess) {
      _productModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'Special Product fetch failed';
      update();
      return false;
    }
  }
}
