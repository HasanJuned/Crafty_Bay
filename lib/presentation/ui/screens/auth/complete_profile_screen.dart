import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../state_holders/create_profile_controller.dart';
import '../../utility/image_assets.dart';

class CompleteProfileScreen extends StatelessWidget {
  CompleteProfileScreen({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _postCodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
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
                    'Complete Profile',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Get started with us by share your details',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Full Name'),
                    controller: _nameController,
                    validator: (String? text) {
                      if (text!.isEmpty) {
                        return 'Enter your full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'City'),
                    controller: _cityController,
                    validator: (String? text) {
                      if (text!.isEmpty) {
                        return 'Enter your city';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'State'),
                    controller: _stateController,
                    validator: (String? text) {
                      if (text!.isEmpty) {
                        return 'Enter your state';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Postcode'),
                    controller: _postCodeController,
                    validator: (String? text) {
                      if (text!.isEmpty) {
                        return 'Enter your post code';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Country'),
                    controller: _countryController,
                    validator: (String? text) {
                      if (text!.isEmpty) {
                        return 'Enter your country';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Phone'),
                    controller: _phoneController,
                    validator: (String? text) {
                      if (text!.isEmpty) {
                        return 'Enter your phone';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLines: 3,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      hintText: 'Shipping Address',
                    ),
                    controller: _addressController,
                    validator: (String? text) {
                      if (text!.isEmpty) {
                        return 'Enter your shipping address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<CreateProfileController>(
                        builder: (createProfileController) {
                      if (createProfileController.createProfileInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final response =
                                await createProfileController.createProfile(
                              _nameController.text,
                              _addressController.text,
                              _cityController.text,
                              _stateController.text,
                              _postCodeController.text,
                              _countryController.text,
                              _phoneController.text,
                            );
                            if (response) {
                              AuthController.setReadProfile(_phoneController.text);
                              Get.showSnackbar(
                                const GetSnackBar(
                                  title: 'Welcome',
                                  message: 'Profile successfully created!',
                                  duration: Duration(seconds: 2),
                                  backgroundColor: AppColors.primaryColor,
                                ),
                              );
                              Navigator.pop(context);
                            } else {
                              Get.showSnackbar(
                                const GetSnackBar(
                                  title: 'Failed!',
                                  message: 'Try again!',
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            }
                          }
                        },
                        child: const Text('Complete'),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
