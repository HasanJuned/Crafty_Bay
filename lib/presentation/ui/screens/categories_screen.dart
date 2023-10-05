import 'package:flutter/material.dart';

import '../widgets/category_card_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Categories',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 200,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              childAspectRatio: 0.85
            ),
            itemBuilder: (context, index){
              return const FittedBox(child: CategoryCardWidget());
            }),
      ),
    );
  }
}
