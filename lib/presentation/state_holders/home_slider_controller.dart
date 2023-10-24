import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/slider_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController{

  bool _getHomeSliderInProgress = false;
  SliderModel _sliderModel = SliderModel();
  String _message = '';

  bool get getHomeSliderInProgress => _getHomeSliderInProgress;
  SliderModel get sliderModel => _sliderModel;
  String get message => _message;

  Future<bool> getHomeSliders() async{
    _getHomeSliderInProgress = true;
    update();

    final NetworkResponse response =  await NetworkCaller().getRequest(Urls.getHomeSlider);
    _getHomeSliderInProgress = false;
    if(response.isSuccess){
      _sliderModel = SliderModel.fromJson(response.responseJson!);
      update();
      return true;
    } else{
      _message = 'Home Slider Data Fetch Failed';
      update();
      return false;
    }

  }




}