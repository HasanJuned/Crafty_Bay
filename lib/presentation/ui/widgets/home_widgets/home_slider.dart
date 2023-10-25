import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/slider_data.dart';
import '../../utility/app_colors.dart';

class HomeSlider extends StatefulWidget {
  final List<SliderData> sliders;

  const HomeSlider({Key? key, required this.sliders}) : super(key: key);

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 160.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (int page, _) {
              _selectedSlider.value = page;
            },
          ),
          items: widget.sliders.map((sliderData) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.2)),
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image.network(sliderData.image ?? '', height: double.infinity, width: double.infinity,  fit: BoxFit.fitHeight,
                      ),
                      Positioned(
                        bottom: 3,
                        right: 5,
                        child: Text(
                          sliderData.title ?? '',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.3),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 16,
        ),
        ValueListenableBuilder(
          valueListenable: _selectedSlider,
          builder: (context, value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.sliders.length; i++)
                  Container(
                    height: 10,
                    width: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: value == i ? AppColors.primaryColor : null),
                  )
              ],
            );
          },
        ),
      ],
    );
  }
}
