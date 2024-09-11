import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project15/Controller/Quize_Controller.dart';

class AnswerOptions extends StatelessWidget {
  final String text;
  final int index;
  final int questionId;
  final VoidCallback onPressed;

  AnswerOptions({
    Key? key,
    required this.text,
    required this.index,
    required this.questionId,
    required this.onPressed,
  }) : super(key: key);

  final controller = Get.find<Quize_Controller>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Quize_Controller>(
        init: Get.find<Quize_Controller>(),
        builder: (controller) => InkWell(
              onTap: controller.checkIfQuestionIsAnswred(questionId)
                  ? null
                  : onPressed,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 3, color: controller.getColor(index))),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: '${index + 1}',
                              style: Theme.of(context).textTheme.headlineMedium,
                              children: [
                            TextSpan(
                              text: text,
                              style: Theme.of(context).textTheme.headlineMedium,
                            )
                          ])),
                    ],
                  ),
                ),
              ),
            ));
  }
}
