import 'package:flutter/material.dart';
import 'package:fruitmate_app/controller/login_controller.dart';
import 'package:fruitmate_app/util/app_colors.dart';
import 'package:fruitmate_app/util/app_images.dart';
import 'package:fruitmate_app/view/home/home.dart';
import 'package:fruitmate_app/view/registration/registration.dart';
import 'package:get/get.dart';

import '../../util/app_icons.dart';
import '../../util/app_widgets.dart';
import '../../util/validator.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.white,
      child: SafeArea(
        child: Scaffold(
          body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              return GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.05,
                          ),
                          child: Image.asset(
                            AppImages.appIcon,
                            scale: 1.5,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: SingleChildScrollView(
                            child: Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: formKey,
                          child: Column(
                            children: [
                              textFiledView(
                                  name: "Email",
                                  hintText: "Email",
                                  validator: validateEmail,
                                  textEditingController:
                                      controller.emailController,
                                  keyBoardType: TextInputType.emailAddress,
                                  context: context,
                                  controller: controller,
                                  obscureText: false,
                                  suffixIcon: false),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              textFiledView(
                                  name: "Password",
                                  hintText: "Password",
                                  validator: validatePasswordLogin,
                                  textEditingController:
                                      controller.passwordController,
                                  keyBoardType: TextInputType.visiblePassword,
                                  context: context,
                                  controller: controller,
                                  obscureText: controller.passwordObscureText,
                                  suffixIcon: true),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: AppWidgets.regularText(
                                      text: "Forgot Password?",
                                      size: 16.0,
                                      color: AppColors.grey,
                                      weight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.06,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  // if (controller.formKey.currentState!
                                  //     .validate()) {
                                  Get.to(() => Home());
                                  // }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.green,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 20),
                                    child: SizedBox(
                                      width: width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.symmetric(),
                                            child: AppWidgets.regularText(
                                              text: "Sign In",
                                              size: 22,
                                              color: AppColors.white,
                                              weight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppWidgets.regularText(
                                    text: "Don’t have an account? ",
                                    size: 18.0,
                                    color: AppColors.black,
                                    weight: FontWeight.w500,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      Get.to(() => Registration());
                                    },
                                    child: AppWidgets.regularText(
                                      text: "Sign Up",
                                      size: 18.0,
                                      color: AppColors.green,
                                      weight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  textFiledView(
      {required String name,
      required String hintText,
      required String? Function(String? value) validator,
      required TextEditingController textEditingController,
      keyBoardType,
      context,
      required LoginController controller,
      required bool obscureText,
      required bool suffixIcon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.regularText(
          text: name,
          size: 18.0,
          color: AppColors.black,
          weight: FontWeight.w400,
        ),
        AppWidgets.normalTextField(
          controller: textEditingController,
          obscureText: obscureText,
          filled: false,
          maxLines: 1,
          borderColor: AppColors.grey,
          textAlign: TextAlign.start,
          isUnderlinedBorder: true,
          fontColor: AppColors.black,
          hintText: hintText,
          validator: validator,
          keyBoardType: keyBoardType,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          borderFillColor: AppColors.yellow,
          hintFontColor: AppColors.grey.withOpacity(0.5),
          hintFontWeight: FontWeight.w400,
          suffixIcon: suffixIcon
              ? GestureDetector(
                  onTap: () {
                    controller.showPassword();
                  },
                  child: Image.asset(
                    obscureText ? AppIcons.hide : AppIcons.unHide,
                    scale: 20,
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
