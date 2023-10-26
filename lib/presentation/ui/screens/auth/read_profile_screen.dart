import 'package:crafty_bay/presentation/state_holders/create_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../state_holders/read_profile_controller.dart';

class ReadProfileScreen extends StatefulWidget {
  const ReadProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ReadProfileScreen> createState() => _ReadProfileScreenState();
}

class _ReadProfileScreenState extends State<ReadProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _postCodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ReadProfileController>().readProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black87,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<ReadProfileController>(
              builder: (readProfileController) {
            if (readProfileController.readProfileInProgress) {
              return const Center(
                child: LinearProgressIndicator(),
              );
            }
            _nameController.text =
                readProfileController.readProfileData.cusName ?? 'Unknown';
            _addressController.text =
                readProfileController.readProfileData.cusAdd ?? 'Unknown';
            _cityController.text =
                readProfileController.readProfileData.cusCity ?? 'Unknown';
            _stateController.text =
                readProfileController.readProfileData.cusState ?? 'Unknown';
            _postCodeController.text =
                readProfileController.readProfileData.cusPostcode ?? 'Unknown';
            _countryController.text =
                readProfileController.readProfileData.cusCountry ?? 'Unknown';
            _phoneController.text =
                readProfileController.readProfileData.cusPhone ?? 'Unknown';
            _emailController.text =
                readProfileController.readProfileData.user?.email ?? 'Unknown';
            return Column(
              children: [
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: 90,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: 'Name',

                      prefixIcon: Icon(
                    Icons.person,
                    color: AppColors.primaryColor,
                  )),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                      labelText: 'Address',

                      prefixIcon: Icon(
                    Icons.home_outlined,
                    color: AppColors.primaryColor,
                  )),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _stateController,
                  decoration: const InputDecoration(
                      labelText: 'State',

                      prefixIcon: Icon(
                    Icons.streetview,
                    color: AppColors.primaryColor,
                  )),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _postCodeController,
                  decoration: const InputDecoration(
                      labelText: 'Post Code',

                      prefixIcon: Icon(
                    Icons.post_add_sharp,
                    color: AppColors.primaryColor,
                  )),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                      labelText: 'City',

                      prefixIcon: Icon(
                    Icons.location_city,
                    color: AppColors.primaryColor,
                  )),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _countryController,
                  decoration: const InputDecoration(
                    labelText: 'Country',
                      prefixIcon: Icon(
                    Icons.outlined_flag_outlined,
                    color: AppColors.primaryColor,
                  )),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                      labelText: 'Phone',

                      prefixIcon: Icon(
                    Icons.phone,
                    color: AppColors.primaryColor,
                  )),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  readOnly: true,
                  controller: _emailController,
                  decoration: const InputDecoration(
                      labelText: 'Email',

                      prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColors.primaryColor,
                  )),
                ),
                const SizedBox(
                  height: 12,
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
                              Get.showSnackbar(
                                const GetSnackBar(
                                  title: 'Welcome',
                                  message: 'Profile successfully updated',
                                  duration: Duration(seconds: 2),
                                  backgroundColor: AppColors.primaryColor,
                                ),
                              );
                            } else {
                              Get.showSnackbar(
                                const GetSnackBar(
                                  title: 'Failed!',
                                  message: 'Try again',
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'Update Profile',
                            style: TextStyle(letterSpacing: 1),
                          ));
                    }))
              ],
            );
          }),
        ),
      ),
    );
  }
}
