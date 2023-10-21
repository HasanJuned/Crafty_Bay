import 'package:crafty_bay/data/models/category_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  bool _categoryControllerInProgress = false;
  CategoryModel _categoryModel = CategoryModel();
  String _message = '';

  bool get categoryControllerInProgress => _categoryControllerInProgress;

  CategoryModel get categoryModel => _categoryModel;

  String get message => _message;

  Future<bool> getCategory() async {
    _categoryControllerInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getCategoryData);
    _categoryControllerInProgress = false;
    if (response.isSuccess) {
      _categoryModel =
          CategoryModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Failed to load Category Data';
      update();
      return false;
    }
  }
}
