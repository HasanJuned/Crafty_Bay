import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import 'custom_stepper.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                /// put the network image here
                image: AssetImage('assets/images/shoe.jpg'),
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
                              const Text(
                                'Nike Shoe AK909589',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(color: Colors.black54),
                                  children: [
                                    TextSpan(text: 'Color: Black'),
                                    TextSpan(text: 'Size: XL'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete_outline),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '\$1000',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        SizedBox(
                          width: 85,
                          child: FittedBox(
                            child: CustomStepper(
                              lowerLimit: 1,
                              upperLimit: 10,
                              stepValue: 1,
                              value: 1,
                              onChange: (int value) {},
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
