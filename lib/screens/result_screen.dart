import 'package:project15/Controller/Quize_Controller.dart';
import 'package:project15/screens/welcome_screen.dart';
import 'package:project15/widgets/custom_button.dart';
import 'package:project15/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key}) : super(key: key);
  static const routeName = '/result_screen';
  final Quize_Controller controller = Get.put(Quize_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Obx(() {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    controller.name.toString(),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: kPrimaryColor,
                        ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Your Score is',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    '${controller.countOfCorrectedAnswer.value} / ${controller.countOfQuestion}',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: kPrimaryColor,
                        ),
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    onPressed: () {
                      controller.startAgain();
                      Get.offAllNamed(WelcomeScreen.routeName);
                    },
                    text: 'Start Again',
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}
