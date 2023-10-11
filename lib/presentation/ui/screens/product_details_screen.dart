import 'package:crafty_bay/presentation/ui/widgets/custom_stepper.dart';
import 'package:crafty_bay/presentation/ui/widgets/home_widgets/product_image_slider.dart';
import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import '../widgets/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> colors = [
    Colors.deepPurple,
    Colors.blueAccent,
    Colors.green,
    Colors.grey,
    Colors.redAccent,
  ];

  List<String> sizes = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    'XXL',
  ];

  int _selectedColor = 0;
  int _selectedSizes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [const ProductImageSlider(), productDetailsAppBar],
            ),
            const SizedBox(
              height: 8,
            ),
            productDetails,
            addToCartBottomContainer
          ],
        ),
      ),
    );
  }

  Container get addToCartBottomContainer {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Price',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '\$230',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          )
        ],
      ),
    );
  }

  AppBar get productDetailsAppBar {
    return AppBar(
      title: const Text(
        'Product Details',
        style: TextStyle(color: Colors.black54),
      ),
      leading: const BackButton(
        color: Colors.black54,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Expanded get productDetails {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Address shoe AK3343 - Black Adition',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.6,
                          fontSize: 18),
                    ),
                  ),
                  CustomStepper(
                    lowerLimit: 1,
                    upperLimit: 10,
                    stepValue: 1,
                    value: 1,
                    onChange: (newValue) {
                      print(newValue);
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellow,
                      ),
                      Text(
                        '4.8',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Review'),
                  ),
                  const Card(
                    color: AppColors.primaryColor,
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  )
                ],
              ),
              const Text(
                'Color',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 28,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {
                        _selectedColor = index;
                        if (mounted) {
                          setState(() {});
                        }
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: colors[index],
                        child: _selectedColor == index
                            ? const Icon(Icons.done, color: Colors.white)
                            : null,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 14);
                  },
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              const Text(
                'Size',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 28,
                child: SizePicker(
                  sizes: sizes,
                  onSelected: (int selectedSize) {
                    _selectedSizes = selectedSize;
                  },
                  initiallySelected: 0,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                  '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum''')
            ],
          ),
        ),
      ),
    );
  }
}
