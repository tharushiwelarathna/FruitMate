import 'package:flutter/material.dart';
import 'package:fruitmate_app/controller/login_controller.dart';
import 'package:fruitmate_app/util/app_colors.dart';
import 'package:fruitmate_app/util/app_images.dart';
import 'package:fruitmate_app/view/register/register.dart';
import 'package:fruitmate_app/view/welcome/welcome.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: SafeArea(
        child: Scaffold(
          body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.appIcon,
                        scale: 2,
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.green,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.visibility),
                            onPressed: () {
                              // Implement toggle password visibility
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Implement forgot password functionality
                            },
                            child: const Text('Forgot Password?'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => const Welcome()),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors
                                .signinbtn, // Set the desired button color
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 18,
                              color:
                                  AppColors.white, // Set the desired text color
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("New User?"),
                          TextButton(
                            onPressed: () => Get.to(() => const Logup()),
                            child: const Text('Sign Up'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
