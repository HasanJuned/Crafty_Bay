import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color:
                AppColors.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8)),
            child: const Icon(
              Icons.shop,
              color: AppColors.primaryColor,
              size: 32,
            ),
          ),
          const SizedBox(height: 4,),
          const Text('Electronics', style: TextStyle(
              color: AppColors.primaryColor,
              letterSpacing: 0.4,
              fontSize: 15
          ),)
        ],
      ),
    );
  }
}
