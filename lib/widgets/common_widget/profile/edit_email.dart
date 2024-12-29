import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view_model/sign_up_view_model.dart';
import '../../../view_model/orders_view_model.dart';
import '../../../model/firebase/firebase_authencation.dart';
import '/widgets/common_widget/check_mail/check_mail.dart';
import '/widgets/common_widget/check_mail/check_mail2.dart';
import 'package:flutter_hungry_hub/widgets/common_widget/profile/persionnal_info.dart';
import 'package:flutter_hungry_hub/view_model/profile_view_model.dart';

class EditEmailView extends StatefulWidget {
  const EditEmailView({super.key});

  @override
  State<EditEmailView> createState() => _EditEmailViewState();
}

class _EditEmailViewState extends State<EditEmailView> {
  late String codeMail;
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpViewModel());
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
                      'Sign Up',
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
                _formEmail(controller),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Obx(() {
                    return ElevatedButton(
                      onPressed: () {
                        if (controller.isValidSignupForm()) {
                          controller.sendEmail(controller.email, codeMail.toString());
                          print('Verification code sent: $codeMail');
                          Get.to(() => CheckMail2(
                                email: controller.email,
                                verificationCode: codeMail.toString(),
                              ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffE53935),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                      ),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(color: Colors.white)
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

  Padding _formEmail(SignUpViewModel controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        obscureText: false,
        style: const TextStyle(
            color: Color(0xff939393),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 16), 
        decoration: InputDecoration(
          labelText: 'Email',
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
          hintText: 'Email',
          hintStyle: const TextStyle(
              color: Color(0xff939393),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
        onChanged: controller.onChangeUsername,
        validator: controller.validatorUsername,
      ),
    );
  }
}
