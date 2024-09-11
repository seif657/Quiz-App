import 'package:project15/Controller/Quize_Controller.dart';
import 'package:project15/screens/welcome_screen.dart';
import 'package:project15/screens/result_screen.dart';
import 'package:project15/screens/quiz_screen.dart';
import 'package:project15/utils/binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final controller = Get.put(Quize_Controller());
  
  @override
  
  Widget build(BuildContext context) {
      return GetMaterialApp
    (
      title: "quize app",
      debugShowCheckedModeBanner: false,
      initialBinding: MyBinding(),
      initialRoute: WelcomeScreen.routeName,
      getPages: [
        GetPage(name: WelcomeScreen.routeName, page: () => WelcomeScreen()) ,
        GetPage(name: ResultScreen.routeName, page: () => ResultScreen()) ,
        GetPage(name: QuizScreen.routeName, page: () => QuizScreen()) ,
      ],
     
    );
  }
}


