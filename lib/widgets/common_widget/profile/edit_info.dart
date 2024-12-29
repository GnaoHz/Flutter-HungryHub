// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view_model/sign_up_view_model.dart';
import '../../../view_model/orders_view_model.dart';
import '../../../model/firebase/firebase_authencation.dart';
import '/widgets/common_widget/check_mail/check_mail.dart';
import 'package:flutter_hungry_hub/widgets/common_widget/profile/persionnal_info.dart';
import 'package:flutter_hungry_hub/view_model/profile_view_model.dart';

class EditInfoView extends StatefulWidget {
  const EditInfoView({super.key});

  @override
  State<EditInfoView> createState() => _EditInfoViewState();
}

class _EditInfoViewState extends State<EditInfoView> {
  late String codeMail;
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpViewModel());
    
    final controller2=Get.put(OrdersViewModel());
    RxString user_id=controller2.userId;

    final fire = Get.put(FirAuth ());

    codeMail = controller.generateVerificationCode().toString();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                const SizedBox(height: 24),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Edit Infomation',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        color: Color(0xffF44336),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                
                _buildTextField(
                  label: 'Full Name',
                  hintText: 'Full Name',
                  obscureText: false,
                  onChanged: controller.onChangeCheckName,
                  validator: controller.validatorCheck,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  label: 'Address',
                  hintText: 'Address',
                  obscureText: false,
                  onChanged: controller.onChangeCheckAdress,
                  validator: controller.validatorCheck,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  label: 'Sex',
                  hintText: 'Sex',
                  obscureText: false,
                  onChanged: controller.onChangeCheckSex,
                  validator: controller.validatorCheck,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  label: 'Phone Number',
                  hintText: 'Phone Number',
                  obscureText: false,
                  onChanged: controller.onChangeCheckNumberPhone,
                  validator: controller.validatorCheck,
                ),
                // Continue Button
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Obx(() {
                    return ElevatedButton(
                      onPressed: () {
                        if (controller.isValidSignupForm()) {
                          /*controller.sendEmail(
                            controller.email, codeMail.toString());
                          print('test ma code1: $codeMail');
                          Get.to(() => CheckMail(
                                email: controller.email,
                                password: controller.password,
                                fullName: controller.hoTen,
                                address: controller.address,
                                sex: controller.sex,
                                phoneNumber: controller.numberPhone,
                                verificationCode: codeMail.toString(),
                              ));*/
                          fire.updateUserInfo(user_id.value,controller.hoTen,controller.address,controller.sex,controller.numberPhone);
                          
                          Get.back();
                          
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffE53935),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 100),
                      ),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Hàm tái sử dụng cho các trường nhập liệu
  Padding _buildTextField({
    required String label,
    required String hintText,
    required bool obscureText,
    required Function(String) onChanged,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        obscureText: obscureText,
        style: const TextStyle(
            color: Color(0xff939393),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 16),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
              color: Color(0xff939393),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.blue, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.redAccent, width: 1),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Color(0xff939393),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
