import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../regester/presentation/views/regester_screen.dart';


class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(33.0),
      child: Column(

        children: [
          Image.asset(AppImages.onboardingimage,width: double.infinity,),
          SizedBox(height: 63,),
          Text("ToDo List\nDaily Task"
            ,style: Theme.of(context).textTheme.titleLarge
          ),
          SizedBox(height: 21,),
          Text("This productive tool is designed to help\nyou better manage your task\nproject-wise conveniently!"
            ,textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey
            ),),
          SizedBox(height: 50,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (c){
                return RegesterScreen();
              }));
            },
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.blue
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text("Let’s Start",textAlign: TextAlign.center,style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),),
                  ),
                  Icon(Icons.arrow_forward_outlined,color: AppColors.white,)
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
