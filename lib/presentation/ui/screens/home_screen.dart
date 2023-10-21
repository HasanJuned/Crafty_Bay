import 'package:crafty_bay/presentation/state_holders/home_slider_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/categories_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
              GetBuilder<HomeSliderController>(builder: (homeSliderController) {
                if (homeSliderController.getHomeSliderInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return HomeSlider(
                  sliders: homeSliderController.sliderModel.data ?? [],
                );
              }),
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
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const CategoryCardWidget();
                    }),
              ),
              const SizedBox(
                height: 8,
              ),
              RemarksTitle(
                title: 'Popular',
                onTap: () {
                  Get.to(ProductListScreen());
                },
              ),
              SizedBox(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (builder, index) {
                    return const ProductCard();
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              RemarksTitle(
                title: 'Special',
                onTap: () {
                  Get.to(ProductListScreen());
                },
              ),
              SizedBox(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (builder, index) {
                    return const ProductCard();
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              RemarksTitle(
                title: 'New',
                onTap: () {
                  Get.to(ProductListScreen());
                },
              ),
              SizedBox(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (builder, index) {
                    return const ProductCard();
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
