import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/logup_controller.dart';
import '../../util/app_colors.dart';

class Logup extends StatelessWidget {
  const Logup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.white,
        child: SafeArea(
            child: Scaffold(
          body: GetBuilder<LogupController>(
              init: LogupController(),
              builder: (controller) {
                return Container();
              }),
        )));
  }
}
