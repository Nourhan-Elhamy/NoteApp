import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/core/utils/app_colors.dart';
import 'package:todoapp/core/utils/app_images.dart';
import 'package:todoapp/features/add_task/presentation/views/widgets/add_task_body.dart';

import '../../../../core/utils/app_texts.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },

            child: Image.asset(AppImages.arrowleft,color: Theme.of(context).iconTheme.color)),
        title: Text(AppTexts.addtask,style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: AddTaskBody(
        
      ),
    );
  }
}
