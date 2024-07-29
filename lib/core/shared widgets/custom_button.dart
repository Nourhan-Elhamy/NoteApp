import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.title,  this.icon, required this.color,});

  final void Function()? onPressed;
  final String title;
  final IconData?  icon ;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(

color: color,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          icon == null ? const SizedBox():   Icon(icon)

        ],
      ),
    );
  }
}