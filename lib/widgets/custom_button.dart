import 'package:flutter/material.dart';
import 'package:project15/constant.dart';

class CustomButton extends StatelessWidget {

  const CustomButton ({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width = 220,
  }) : super (key: key);
  final VoidCallback onPressed;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        onPressed: onPressed, 
        label: Text(text , style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),)
        ),
    );
  }
}