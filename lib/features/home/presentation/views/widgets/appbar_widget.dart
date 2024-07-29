import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key, required this.name, required this.photo});

 final String name;
 final File photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blue
      ),
      child: Expanded(
        child: Row(
         children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: GestureDetector(
               onTap: (){
                 Scaffold.of(context).openDrawer();
               },
                 child: Image.asset(AppImages.menue)),
           ),
           Expanded(
             child: Column(
               children: [
                 SizedBox(height: 10,),
                 Text("Hello!",style: TextStyle(color: AppColors.white,fontSize: 15),),
                 SizedBox(height: 10,),
                 Text(name,style: TextStyle(color: AppColors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                 SizedBox(height: 10,),
                 Text(DateTime.now().toString().split(" ")[0],style: TextStyle(color: AppColors.white,fontWeight: FontWeight.bold,fontSize: 14),)
                     
               ],
             ),
           ),
           CircleAvatar(
             radius: 44,
             backgroundColor: AppColors.white,
        
             child: CircleAvatar(
               radius: 39,
               backgroundImage: Image.file(photo,fit:BoxFit.cover ,).image,
             ),
           )
         ],
        ),
      ),
    );
  }
}
