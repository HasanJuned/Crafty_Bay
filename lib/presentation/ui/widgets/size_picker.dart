import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class SizePicker extends StatefulWidget {
  final List<String> sizes;
  final Function(int selectedIndex) onSelected;
  final int initiallySelected;

  const SizePicker(
      {Key? key,
        required this.sizes,
        required this.onSelected,
        required this.initiallySelected})
      : super(key: key);

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  int _selectedSizes = 0;

  @override
  void initState() {
    _selectedSizes = widget.initiallySelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.sizes.length,
      itemBuilder: (context, index) {
        return InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            _selectedSizes = index;
            widget.onSelected(index);
            if (mounted) {
              setState(() {});
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
                color: _selectedSizes == index ? AppColors.primaryColor : null),
            child: Text(widget.sizes[index]),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 14);
      },
    );
  }
}
