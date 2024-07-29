import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/shared%20widgets/custom_button.dart';
import 'package:todoapp/core/shared%20widgets/custom_field.dart';
import 'package:todoapp/core/utils/app_colors.dart';
import 'package:todoapp/core/utils/app_images.dart';

import 'package:todoapp/features/home/data/model/task_model.dart';
import 'package:todoapp/features/home/presentation/controller/home_controller.dart';

import 'add_task_body.dart';
import 'add_task_body.dart';
import 'add_task_body.dart';


class AddTaskBody extends StatefulWidget {
   AddTaskBody({super.key});

  @override
  State<AddTaskBody> createState() => _AddTaskBodyState();
}
DateTime datetime= DateTime.now();

TextEditingController tasknamecontroller =TextEditingController();
TextEditingController desccontrollr = TextEditingController();




class _AddTaskBodyState extends State<AddTaskBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
          children: [
            CustomTextField(
              controller: tasknamecontroller,
              name: "Task Name",
              hinttext: "Enter the Task name",
            ),
            CustomTextField(
              controller: desccontrollr,
              name: "Description",
              hinttext: "Enter The Task Desciption  ",
              minline: 3,
              maxline: 6,

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  tileColor: Theme.of(context).primaryColor,
                  title: Text("Start Date",style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Text(Provider.of<HomeProvider>(context).startdate== null ?"enter the start date":
                  Provider.of<HomeProvider>(context,listen: false).convertDateString(Provider.of<HomeProvider>(context).startdate!),style: Theme.of(context).textTheme.titleSmall),
                  leading: Icon(Icons.calendar_month,color: AppColors.blue,),
                  trailing: GestureDetector(
                    onTap: ()async{

                      Provider.of<HomeProvider>(context,listen: false).selectStartDate(context);
                    },

                      child: Image.asset(AppImages.arrowdown,color: Theme.of(context).iconTheme.color,)),
                ),
            ),
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Theme.of(context).primaryColor,
                  title: Text("End Date",style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Text(Provider.of<HomeProvider>(context).enddate==null? "Enter The End Date":
                  Provider.of<HomeProvider>(context,listen: false
                  ).convertDateString(Provider.of<HomeProvider>(context).enddate!),style: Theme.of(context).textTheme.titleSmall),
                  leading: Icon(Icons.calendar_month,color: AppColors.blue,),
                  trailing: GestureDetector(

                      child: GestureDetector(
                        onTap: (){
                         Provider.of<HomeProvider>(context,listen: false).selectEndDate(context);
                        },
                          child: Image.asset(AppImages.arrowdown,color: Theme.of(context).iconTheme.color,))),
                ),
            ),

              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Theme.of(context).primaryColor,
                  title: Text("Add Time",style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Text(Provider.of<HomeProvider>(context).time==null? "Set a Time For The Task":
                  Provider.of<HomeProvider>(context).time!.format(context),style: Theme.of(context).textTheme.titleSmall
                  ),
                  leading: Image.asset(AppImages.watch),
                  trailing: GestureDetector(
                    onTap: (){
                      Provider.of<HomeProvider>(context,listen: false).selectTime(context);
                    },
                      child: Image.asset(AppImages.arrowdown,color: Theme.of(context).iconTheme.color,)),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: MaterialButton(

                  onPressed: (){

                    Provider.of<HomeProvider>(context,listen: false).addTask(
                      desc: desccontrollr,
                    title: tasknamecontroller,
                    context: context);
                },

                color:  AppColors.blue,child: Text("Add Task",style: TextStyle(color: AppColors.white),),),
              ),
            )

          ],
        ),


    );
  }
}
