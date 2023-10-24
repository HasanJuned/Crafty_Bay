import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utility/app_colors.dart';

class ProductImageSlider extends StatefulWidget {
  final List<String> imageList;

  const ProductImageSlider({Key? key, required this.imageList})
      : super(key: key);

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 259,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: 1.1,
              onPageChanged: (int page, _) {
                _selectedSlider.value = page;
              }),
          items: widget.imageList.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                      )),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _selectedSlider,
            builder: (context, value, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < widget.imageList.length; i++)
                    Container(
                      height: 12,
                      width: 12,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: value == i
                              ? AppColors.primaryColor
                              : Colors.white),
                    )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
