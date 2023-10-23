import 'package:crafty_bay/data/models/category_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  bool _productListControllerInProgress = false;
  ProductModel _productModel = ProductModel();
  String _message = '';

  bool get productListControllerInProgress => _productListControllerInProgress;

  ProductModel get productModel => _productModel;

  String get message => _message;

  Future<bool> getProductByCategory(int categoryId) async {
    _productListControllerInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller()
        .getRequest(Urls.getProductCategoryById(categoryId));
    _productListControllerInProgress = false;
    if (response.isSuccess) {
      _productModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Failed to load Category Data';
      update();
      return false;
    }
  }

  void setProducts(ProductModel productModel) {
    _productModel = productModel;
    update();
  }
}
