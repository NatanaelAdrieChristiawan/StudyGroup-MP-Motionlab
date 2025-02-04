import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:study_group_flutter/app/common/widgets/custom_button.dart';
import 'package:study_group_flutter/app/common/widgets/custom_text_field.dart';
import 'package:study_group_flutter/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200.h,
                child: Lottie.asset('assets/lotties/lt_login.json'),
              ),
              const SizedBox(height: 30),
              Text(
                'Welcome!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Happy Shopping All',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: const Color(0xFF707070),
                    ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Username',
                icon: const Icon(
                  Icons.email_outlined,
                  color: Color(0xFF344E41),
                ),
                textInputType: TextInputType.emailAddress,
                controller: controller.usernameController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Password',
                icon: const Icon(
                  Icons.lock_outline_rounded,
                  color: Color(0xFF344E41),
                ),
                isPassword: true,
                controller: controller.passwordController,
              ),
              const SizedBox(height: 40),

              // Gunakan Obx hanya untuk widget spesifik
              Obx(() {
                return controller.isLoading.value
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: CircularProgressIndicator(
                          color: Color(0xFF00623B),
                        ),
                      )
                    : CustomButton(
                        text: 'Login',
                        onTap: () {
                          controller.login();
                        },
                      );
              }),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offNamed(Routes.REGISTER);
                    },
                    child: const Text(
                      'Register',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}