import 'package:crafty_bay/presentation/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utility/image_assets.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String email; //

  const OTPVerificationScreen({Key? key, required this.email})
      : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                    ImageAssets.craftyBayLogoSVG,
                    width: 100,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Enter Your OTP Code',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'A 4 digit OTP code has been sent',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 24,
                ),
                PinCodeTextField(
                  controller: _otpTEController,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    activeColor: AppColors.primaryColor,
                    inactiveColor: AppColors.primaryColor,
                    selectedColor: Colors.green,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v) {},
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<OTPVerificationController>(
                      builder: (controller) {
                    if (controller.otpVerificationInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          verifyOtp(controller);
                        }
                      },
                      child: const Text('Next'),
                    );
                  }),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(text: 'This code will expire in '),
                      TextSpan(
                          text: '120s',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  child: const Text('Resend'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyOtp(OTPVerificationController controller) async {
    print(_otpTEController.text);

    final response =
        await controller.verifyOtp(widget.email, _otpTEController.text);
    if (response) {
      Get.offAll(const MainBottomNavBarScreen());
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('OTP Verification Failed! Try again')));
      }
    }
  }
}
