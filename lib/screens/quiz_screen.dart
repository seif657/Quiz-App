import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project15/Controller/Quize_Controller.dart';
import 'package:project15/widgets/custom_button.dart';
import 'package:project15/screens/result_screen.dart';
import 'package:project15/widgets/ProgressTimer.dart';
import 'package:project15/widgets/Question_Card.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);
  static const routeName = '/quiz_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black87,
            ),
          ),
          SafeArea(
            child: GetBuilder<Quize_Controller>(
              init: Get.find<Quize_Controller>(),
              builder: (controller) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Question ',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.white),
                            children: [
                              TextSpan(
                                text: (controller.numberOfQuestoin == 4
                                        ? controller.numberOfQuestoin
                                        : controller.numberOfQuestoin + 1)
                                    .round()
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(color: Colors.white),
                              ),
                              TextSpan(
                                text: '/',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(color: Colors.white),
                              ),
                              TextSpan(
                                text: controller.countOfQuestion.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        ProgressTimer(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  SizedBox(
                    height: 450,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index) {
                        controller.updateQuestionNumber(index);
                      },
                      itemBuilder: (context, index) => QuestionCard(
                        questionModel: controller.questions[index],
                      ),
                      controller: controller.pageController,
                      itemCount: controller.questions.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: GetBuilder<Quize_Controller>(
        init: Get.find<Quize_Controller>(),
        builder: (controller) => CustomButton(
          onPressed: () {
            controller.nextQuestion();
            if (controller.questions[3].id == controller.questions.length) {
              Get.offAndToNamed(ResultScreen.routeName);
            }
          },
          text: 'End The Game',
        ),
      ),
    );
  }
}
