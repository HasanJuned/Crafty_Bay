import 'package:crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:crafty_bay/presentation/state_holders/home_slider_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/special_product_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/categories_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../state_holders/popular_product_controller.dart';
import '../widgets/category_card_widget.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/product_card.dart';
import '../widgets/remarks_title.dart';
import '../widgets/home_widgets/home_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              SvgPicture.asset(ImageAssets.craftyBayNavLogoSVG),
              const Spacer(),
              CircularIconButton(
                onTap: () {},
                icon: Icons.person,
              ),
              const SizedBox(
                width: 10,
              ),
              CircularIconButton(
                onTap: () {},
                icon: Icons.call,
              ),
              const SizedBox(
                width: 10,
              ),
              CircularIconButton(
                onTap: () {},
                icon: Icons.notifications_active,
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'Search',
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none)),
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<HomeSliderController>(
                builder: (homeSliderController) {
                  if (homeSliderController.getHomeSliderInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return HomeSlider(
                    sliders: homeSliderController.sliderModel.data ?? [],
                  );
                },
              ),
              const SizedBox(
                height: 8,
              ),
              RemarksTitle(
                title: 'All Categories',
                onTap: () {
                  Get.find<MainBottomNavController>().changeScreen(1);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 90,
                child: GetBuilder<CategoryController>(
                  builder: (categoryController) {
                    if (categoryController.categoryControllerInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        itemCount: categoryController.categoryModel.data?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryCardWidget(
                            categoryData: categoryController.categoryModel.data![index],
                            onTap: (){
                              Get.to(ProductListScreen(categoryId:  categoryController.categoryModel.data![index].id!));
                            },
                          );
                        });
                  }
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              RemarksTitle(
                title: 'Popular',
                onTap: () {
                   Get.to(ProductListScreen(
                     productModel: Get.find<PopularProductController>().productModel
                   ));
                },
              ),
              SizedBox(
                height: 170,
                child: GetBuilder<PopularProductController>(
                  builder: (productController) {
                    if (productController.getPopularProductInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productController.productModel.data?.length ?? 0,
                      itemBuilder: (builder, index) {
                        return ProductCard(
                          productData: productController.productModel.data![index],

                        );
                      },
                    );
                  }
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              RemarksTitle(
                title: 'Special',
                onTap: () {
                   Get.to(ProductListScreen(
                       productModel: Get.find<SpecialProductController>().productModel

                   ));
                },
              ),
              SizedBox(
                height: 170,
                child: GetBuilder<SpecialProductController>(
                    builder: (specialProductController) {
                      if (specialProductController.getSpecialProductInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: specialProductController.productModel.data?.length ?? 0,
                        itemBuilder: (builder, index) {
                          return ProductCard(
                            productData: specialProductController.productModel.data![index],

                          );
                        },
                      );
                    }
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              RemarksTitle(
                title: 'New',
                onTap: () {
                   Get.to(ProductListScreen(
                     productModel: Get.find<NewProductController>().productModel,
                   ));
                },
              ),
              SizedBox(
                height: 170,
                child: GetBuilder<NewProductController>(
                    builder: (newProductController) {
                      if (newProductController.getNewProductInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: newProductController.productModel.data?.length ?? 0,
                        itemBuilder: (builder, index) {
                          return ProductCard(
                            productData: newProductController.productModel.data![index],

                          );
                        },
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
