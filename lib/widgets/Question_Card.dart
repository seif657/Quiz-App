import 'package:flutter/material.dart';
import 'package:project15/Model/Question_Model.dart';
import 'package:project15/widgets/answer_options.dart';
import 'package:get/get.dart';
import 'package:project15/Controller/Quize_Controller.dart';

class QuestionCard extends StatelessWidget {
  final Question_Model questionModel;

  const QuestionCard({
    Key? key,
    required this.questionModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: screenSize.height * 0.9, 
        margin: const EdgeInsets.symmetric(horizontal: 1.0),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questionModel.question,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 30,),
              Flexible(
                flex: 4,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: questionModel.options.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: AnswerOptions(
                      questionId: questionModel.id,
                      text: '- ${questionModel.options[index]}',
                      index: index,
                      onPressed: () => Get.find<Quize_Controller>().checkAnswer(questionModel, index),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
