import 'package:crafty_bay/presentation/ui/screens/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        primarySwatch: MaterialColor(AppColors.primaryColor.value, AppColors().color),
      ),
    );
  }
}
