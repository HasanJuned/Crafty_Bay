import 'package:crafty_bay/data/models/show_wish_list_data.dart';
import 'package:crafty_bay/presentation/state_holders/show_wish_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/app_colors.dart';

class WishListProductCard extends StatefulWidget {
  final ShowWishListData showWishListData;

  const WishListProductCard({
    Key? key,
    required this.showWishListData,
  }) : super(key: key);

  @override
  State<WishListProductCard> createState() => _WishListProductCardState();
}

class _WishListProductCardState extends State<WishListProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailsScreen(
            productId: widget.showWishListData.productId!));
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  /// put the network image here
                  image: NetworkImage(
                      widget.showWishListData.product?.image ?? ''),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.showWishListData.product?.title ??
                                    'Unknown',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.find<ShowWishListController>().removeFromWishlist(widget.showWishListData.productId!);
                          },
                          icon: const Icon(Icons.delete_outline),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '\$ ${widget.showWishListData.product?.price ?? 0}',
                          style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        const SizedBox(
                          height: 28,
                          width: 28,
                          child: CircleAvatar(
                            backgroundColor: Colors.redAccent,
                            child: Icon(
                              Icons.favorite_border_outlined,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
