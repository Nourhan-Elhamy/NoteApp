import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/utils/app_colors.dart';
import 'package:todoapp/core/utils/app_images.dart';
import '../../../../regester/presentation/controller/theme_controller.dart';
import '../archieve_screen.dart';
import '../done_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.name, required this.photo});
final String name;
final File photo;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
       DrawerHeader(
         decoration: BoxDecoration(
           color: AppColors.blue
         ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.white,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: Image.file(photo,fit:BoxFit.cover ,).image,
                ),
              ),
              SizedBox(width: 10,),
              Text(name,style: TextStyle(color: AppColors.white,fontSize: 20),)

            ],

          ),
       ),
        SizedBox(height: 18,),
        Padding(
          padding: const EdgeInsets.only(
            right: 24
          ),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (c){
                return ArchieveScreen();
              }));
            },
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12)  ,
                   bottomRight       : Radius.circular(12)
                )
              ),
              tileColor: AppColors.blue.withOpacity(0.1),
              leading: Icon(Icons.archive_outlined,color: AppColors.blue,),
              title: Text("Archived Tasks",style: TextStyle(color: AppColors.blue,fontSize: 16,fontWeight: FontWeight.w500),),
            ),
          ),
        ),
        SizedBox(height: 18,),
        Padding(
          padding: const EdgeInsets.only(
              right: 24
          ),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (c){
                return DoneScreen();
              }));
            },
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12)  ,
                      bottomRight       : Radius.circular(12)
                  )
              ),
              tileColor: AppColors.blue.withOpacity(0.1),
              leading: Image.asset(AppImages.done),
              title: Text("Done Tasks",style: TextStyle(color: AppColors.blue,fontSize: 16,fontWeight: FontWeight.w500),),

            ),
          ),
        ),
        SizedBox(height: 400,),
        Switch(
            value: Provider.of<ThemeProvider>(context,listen: false).switchValue, onChanged:(b){
          Provider.of<ThemeProvider>(context,listen: false).changeSwitchValue(b);

        })
      ],
    );
  }
}
