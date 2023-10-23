import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/product_details.dart';
import 'package:crafty_bay/data/models/product_details_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _getProductDetailsInProgress = false;
  ProductDetails _productDetails = ProductDetails();
  String _errorMessage = '';
  List<String> _availableColors = [];
  List<String> _availableSizes = [];

  bool get getProductDetailsInProgress => _getProductDetailsInProgress;

  ProductDetails get productDetails => _productDetails;

  String get errorMessage => _errorMessage;

  List<String> get availableColors => _availableColors;
  List<String> get availableSizes => _availableSizes;

  Future<bool> getProductDetails(int id) async {
    _getProductDetailsInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getProductDetails(id));
    _getProductDetailsInProgress = false;

    if (response.isSuccess) {
      _productDetails =
          ProductDetailsModel.fromJson(response.responseJson ?? {}).data!.first;
      convertStringToColor(productDetails.color ?? '');
      convertStringToSizes(productDetails.size ?? '');
      update();
      return true;
    } else {
      _errorMessage = 'Product details fetch failed. Try again!';
      update();
      return false;
    }
  }

  void convertStringToColor(String color) {
    final List<String> splitedColors = color.split(',');
    for (String c in splitedColors) {
      if (c.isNotEmpty) {
        _availableColors.add(c);
      }
    }
  }

  void convertStringToSizes(String sizes) {
    _availableSizes = sizes.split(',');

  }
}
