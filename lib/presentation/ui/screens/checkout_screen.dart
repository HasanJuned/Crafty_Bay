import 'package:crafty_bay/data/models/payment_method.dart';
import 'package:crafty_bay/presentation/state_holders/invoice_create_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<InvoiceCreateController>().createInvoice().then((value) {
        if (mounted) {
          isCompleted = value;
          setState(() {

          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout Screen'),
      ),

      body: GetBuilder<InvoiceCreateController>(
        builder: (invoiceCreateController) {
          if(invoiceCreateController.inProgress){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(!isCompleted){
            return const Center(
              child: Text('Please complete your profile first'),
            );
          }
          return ListView.separated(
              itemCount: invoiceCreateController.invoiceCreateResponseModel?.paymentMethod?.length ?? 0,
              itemBuilder: (context, index){
              final PaymentMethod paymentMethod = invoiceCreateController
                  .invoiceCreateResponseModel!.paymentMethod![index];
              return ListTile(
                leading: Image.network(paymentMethod.logo ?? '', width: 60,),
                title: Text(paymentMethod.name ??''),
                onTap: (){
                  Get.find<InvoiceCreateController>().createInvoice();

                },
              );
          },
          separatorBuilder: (_,__){
                return const Divider();
          },
          );
        }
      ),
    );
  }
}
