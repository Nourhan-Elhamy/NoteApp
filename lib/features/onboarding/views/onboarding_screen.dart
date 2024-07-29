import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/features/onboarding/views/widgets/onboarding_body.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();

}
class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingBody()
    );
  }
}
