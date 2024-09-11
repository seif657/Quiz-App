import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project15/Controller/Quize_Controller.dart';
import 'package:project15/constant.dart';

class ProgressTimer extends StatelessWidget {
  ProgressTimer({Key? key}) : super(key: key);
  final controller = Get.put(Quize_Controller());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var circleSize = screenSize.width * 0.12; // Adjust size relative to screen width

    return Obx(() => SizedBox(
          height: circleSize,
          width: circleSize,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: 1 - (controller.sec.value / 15),
                color: kPrimaryColor,
                backgroundColor: Colors.grey,
                strokeWidth: screenSize.width * 0.02, // Responsive stroke width
              ),
              Center(
                child: Text(
                  "${controller.sec.value}",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.05, // Responsive font size
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
