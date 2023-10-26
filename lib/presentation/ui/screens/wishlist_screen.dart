import 'package:crafty_bay/presentation/state_holders/show_wish_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/main_bottom_nav_bar_controller.dart';
import '../widgets/wish_list_product_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<ShowWishListController>().showWishList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: RefreshIndicator(
        onRefresh: () async {
          Get.find<ShowWishListController>().showWishList();
        },
        child: GetBuilder<ShowWishListController>(
            builder: (showWishListController) {
          if (showWishListController.showWishListInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Wish List',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              leading: const BackButton(
                color: Colors.black,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount:
                    showWishListController.showWishListModel.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return WishListProductCard(
                    showWishListData:
                        showWishListController.showWishListModel.data![index],
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
