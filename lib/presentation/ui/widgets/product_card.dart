import 'package:crafty_bay/data/models/product_data.dart';
import 'package:crafty_bay/presentation/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';

class ProductCard extends StatelessWidget {
  final ProductData productData;

  const ProductCard({
    Key? key,
    required this.productData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Get.to(ProductDetailsScreen(productId: productData.id!,));
      },
      child: Card(
        shadowColor: AppColors.primaryColor.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: SizedBox(
          width: 130,
          child: Column(
            children: [
              Container(
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(productData.image ?? ''),
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      productData.title ?? '',
                      maxLines: 1,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${productData.price ?? 0}',
                          style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.yellow,
                            ),
                            Text(
                              '${productData.star ?? 0}',
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const Card(
                          color: AppColors.primaryColor,
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
