import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/product_list_controller.dart';
import '../widgets/category_card_widget.dart';

class ProductListScreen extends StatefulWidget {
  final int categoryId;
  const ProductListScreen({Key? key, required this.categoryId}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductListController>().getProductByCategory(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Product List',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ProductListController>(
          builder: (productListController) {
            if(productListController.productListControllerInProgress){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return GridView.builder(
                itemCount: productListController.productModel.data?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 0.85),
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: ProductCard(
                      productData: productListController.productModel.data![index],
                    ),
                  );
                });
          }
        ),
      ),
    );
  }
}
