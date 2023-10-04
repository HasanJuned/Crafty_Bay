import 'package:flutter/material.dart';

class RemarksTitle extends StatelessWidget {
  const RemarksTitle({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        TextButton(onPressed: onTap, child: const Text('See All'))
      ],
    );
  }
}
