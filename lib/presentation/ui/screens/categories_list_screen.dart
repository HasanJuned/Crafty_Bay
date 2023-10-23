import 'package:crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/category_card_widget.dart';

class CategoriesListScreen extends StatefulWidget {
  const CategoriesListScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesListScreen> createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Categories',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryController>().getCategory();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                GetBuilder<CategoryController>(builder: (categoryController) {
              if (categoryController.categoryControllerInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return GridView.builder(
                itemCount: categoryController.categoryModel.data?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, childAspectRatio: 0.85),
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: CategoryCardWidget(
                      categoryData:
                          categoryController.categoryModel.data![index],
                      onTap: (){
                        Get.to(ProductListScreen(categoryId:  categoryController.categoryModel.data![index].id!));
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
