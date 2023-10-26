import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/review_product_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';
import '../../data/utility/urls.dart';

class ReviewProductController extends GetxController {
  bool _reviewProductInProgress = false;
  ReviewProductModel _reviewProductModel = ReviewProductModel();
  String _message = '';

  bool get reviewProductInProgress => _reviewProductInProgress;
  ReviewProductModel get reviewProductModel => _reviewProductModel;
  String get message => _message;

  Future<bool> createProductReview(
      String reviewDescription, int productId, String rating) async {
    _reviewProductInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().postRequest(
      Urls.createProductReview,
      {
        "description": reviewDescription,
        "product_id": productId,
        "rating": int.tryParse(rating)
      },
    );
    _reviewProductInProgress = false;
    if (response.isSuccess) {
      _reviewProductModel = ReviewProductModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      _message = 'Review failed! Try again';
      update();
      return false;
    }
  }
}
