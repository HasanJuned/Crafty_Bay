import 'dart:math';

import 'package:crafty_bay/data/models/invoice_create_response_model.dart';
import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class InvoiceCreateController extends GetxController {
  bool _inProgress = false;
  InvoiceCreateResponseModel _invoiceCreateResponseModel = InvoiceCreateResponseModel();
  String _message = '';

  bool get inProgress => _inProgress;
  InvoiceCreateData? get invoiceCreateResponseModel => _invoiceCreateResponseModel.data?.first;

  String get message => _message;

  Future<bool> createInvoice() async {
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.createInvoice);
    _inProgress = false;
    if (response.isSuccess && response.responseJson!['msg'] == 'success') {
      _invoiceCreateResponseModel = InvoiceCreateResponseModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      _message = 'Invoice creation failed! Try again';
      update();
      return false;
    }
  }
}
