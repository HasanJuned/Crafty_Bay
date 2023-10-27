import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:crafty_bay/presentation/state_holders/home_slider_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/popular_product_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/read_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/utility/image_assets.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_card_widget.dart';
import 'package:crafty_bay/presentation/ui/widgets/home_widgets/home_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/remarks_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../state_holders/new_product_controller.dart';
import '../../state_holders/special_product_controller.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withOpacity(0.03),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(ImageAssets.craftyBayNavLogoSVG),
            const Spacer(),
            CircularIconButton(
              icon: Icons.person,
              onTap: () {
                //print(AuthController.readProfile);
                if (AuthController.readProfile != null) {
                  Get.to(const ReadProfileScreen());
                } else {
                  Get.to(CompleteProfileScreen());
                }
              },
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.call_outlined,
              onTap: () async {
                launchUrlString("tel://${008801716874981}");
              },
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.notifications_active_outlined,
              onTap: () {},
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.light_mode_outlined,
              onTap: () {
                if (Get.isDarkMode) {
                  Get.changeThemeMode(ThemeMode.light);
                } else {
                  Get.changeThemeMode(ThemeMode.dark);
                }
              },
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.logout_outlined,
              onTap: () {
                AuthController.clearUserInfo();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.search_outlined),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              GetBuilder<HomeSliderController>(
                builder: (homeSliderController) {
                  if (homeSliderController.getHomeSliderInProgress) {
                    return const SizedBox(
                      height: 180,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
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
                title: 'Categories',
                onTap: () {
                  Get.find<MainBottomNavController>().changeScreen(1);
                },
              ),
              const SizedBox(
                height: 10,
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
                      itemCount:
                          categoryController.categoryModel.data?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryCardWidget(
                          categoryData:
                              categoryController.categoryModel.data![index],
                          onTap: () {
                            Get.to(
                              ProductListScreen(
                                  categoryId: categoryController
                                      .categoryModel.data![index].id!),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RemarksTitle(
                title: 'Popular',
                onTap: () {
                  Get.to(
                    ProductListScreen(
                      productModel:
                          Get.find<PopularProductController>().productModel,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 176,
                child: GetBuilder<PopularProductController>(
                  builder: (popularProductController) {
                    if (popularProductController.getPopularProductInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          popularProductController.productModel.data?.length ??
                              0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(top: 8, left: 4, bottom: 8),
                          child: ProductCard(
                            productData: popularProductController
                                .productModel.data![index],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RemarksTitle(
                title: 'Special',
                onTap: () {
                  Get.to(
                    ProductListScreen(
                      productModel:
                          Get.find<SpecialProductController>().productModel,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 176,
                child: GetBuilder<SpecialProductController>(
                  builder: (specialController) {
                    if (specialController.getSpecialProductInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          specialController.productModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(top: 8, left: 4, bottom: 8),
                          child: ProductCard(
                            productData:
                                specialController.productModel.data![index],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              RemarksTitle(
                title: 'New',
                onTap: () {
                  Get.to(
                    ProductListScreen(
                      productModel:
                          Get.find<NewProductController>().productModel,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 176,
                child: GetBuilder<NewProductController>(
                  builder: (newController) {
                    if (newController.getNewProductInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: newController.productModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(top: 8, left: 4, bottom: 8),
                          child: ProductCard(
                            productData:
                                newController.productModel.data![index],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
