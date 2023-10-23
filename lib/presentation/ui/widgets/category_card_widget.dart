import 'package:crafty_bay/data/models/category_data.dart';
import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
class CategoryCardWidget extends StatelessWidget {
  final CategoryData categoryData;
  final VoidCallback onTap;
  const CategoryCardWidget({
    Key? key, required this.categoryData, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color:
                  AppColors.primaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8)),
              child: Image.network(categoryData.categoryImg ?? ''),
            ),
            const SizedBox(height: 4,),
            Text(categoryData.categoryName ?? '', style: const TextStyle(
                color: AppColors.primaryColor,
                letterSpacing: 0.4,
                fontSize: 15
            ),)
          ],
        ),
      ),
    );
  }
}
