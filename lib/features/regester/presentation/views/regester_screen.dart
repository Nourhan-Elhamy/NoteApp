import 'dart:io';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todoapp/core/utils/app_colors.dart';
import 'package:todoapp/core/utils/app_images.dart';

import '../../../home/presentation/views/home_screen.dart';


class RegesterScreen extends StatefulWidget {
   RegesterScreen({super.key});

  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {
  final ImagePicker picker= ImagePicker();

  XFile? image;

  pickPhoto(ImageSource imageSource) async {
     image = await picker.pickImage(source:imageSource);
     if(image!=null){
       Navigator.pop(context);
     }
     setState(() {
     });
  }
TextEditingController nameController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Image.asset(AppImages.regesterscreen,width: 300,height: 300,),
              GestureDetector(
                onTap: (){
                  showModalBottomSheet(context: context, builder: (c){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                pickPhoto(ImageSource.gallery);
                                setState(() {

                                });
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.photo_size_select_actual,color:  AppColors.black,),
                                  Text("Gallery"),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                pickPhoto(ImageSource.camera);
                                setState(() {

                                });
                              },
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.camera_alt,color:  AppColors.black,),
                                    Text("Camera",),
                                  ],
                                ),
                              ),
                            ),
                          )

                        ],
                      ),
                    );
                  });
                },
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColors.blue
                    )
                  ),
                    child: image==null?
                    Icon(Icons.add_a_photo,color: AppColors.blue,size: 40,) :
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                        child: Image.file(File(image!.path),fit: BoxFit.cover)),
                ),
              ),
              Text(image==null? "Add Photo":"Update Photo",style: Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.blue)
                        ,borderRadius: BorderRadius.circular(15)
                  ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your Name",style: Theme.of(context).textTheme.titleMedium,),
                        TextFormField(
                          style: Theme.of(context).textTheme.titleMedium,
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "Enter Your Name",

                              hintStyle: Theme.of(context).textTheme.titleSmall,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none
                          ),
                        )
                      ],
                    ),
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(
                width: 331,
                height: 50,
                child: MaterialButton(
                  color: AppColors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  onPressed: (){
                    if(image==null){
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error")));
                    }
                    else{
                      Navigator.push(context,MaterialPageRoute(builder: (c){
                        return HomeScreen(
                          name: nameController.text,
                          photo: File(image!.path),
                        );
                      }));
                    }

                  },
                child: Text("Get Started",style: TextStyle(color: AppColors.white,fontSize: 18),),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
