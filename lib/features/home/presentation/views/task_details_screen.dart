import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/utils/app_images.dart';
import 'package:todoapp/features/home/data/model/task_model.dart';
import 'package:todoapp/features/home/presentation/controller/home_controller.dart';
import '../../../../core/utils/app_colors.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key, required this.taskmodel, });
  final TaskModel taskmodel;

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final int index = Provider.of<HomeProvider>(context).task.indexOf(widget.taskmodel);
    return Scaffold(

      appBar: AppBar(
        title: Text("Task Details",style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AppImages.arrowleft,color: Theme.of(context).iconTheme.color,),
        ),

      ),
     body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Task Name:",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(widget.taskmodel.title,style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description:",
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 6,
                  ),
                  Text(widget.taskmodel.desc,style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),

            SizedBox(height: 70.0),
            ListTile(
              leading: Icon(Icons.calendar_month,color: AppColors.blue,),
              tileColor: Theme.of(context).primaryColor,
              title: Text("Start Date",style: Theme.of(context).textTheme.titleMedium,),
              subtitle: Text(widget.taskmodel.startdate,style: Theme.of(context).textTheme.titleSmall),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.calendar_month,color: AppColors.blue,),
              tileColor: Theme.of(context).primaryColor,
              title: Text("End Date",style: Theme.of(context).textTheme.titleMedium,),
              subtitle: Text(widget.taskmodel.enddate,style: Theme.of(context).textTheme.titleSmall),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.calendar_month,color: AppColors.blue,),
              tileColor: Theme.of(context).primaryColor,
              title: Text("Time",style: Theme.of(context).textTheme.titleMedium,),
              subtitle: Text(widget.taskmodel.time,style: Theme.of(context).textTheme.titleSmall),
            ),
            SizedBox(height: 40,),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: (){
               if (index != -1) {
               Provider.of<HomeProvider>(context,listen: false).updateArchieve(index);
               }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),

              color: AppColors.blue,
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    index != -1 ? Provider.of<HomeProvider>(context,listen: false).task[index].archieveOrnot
                ? "UnArchive"
                    : "Archive"
                    : "Archive",style: TextStyle(color: AppColors.white,fontSize: 18),),
                  SizedBox(width: 10,),
                  Icon(Icons.archive,color: AppColors.white,)
                ],
              ),),
            ),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(onPressed: (){
                showDialog(context: context, builder: (c){
                  return AlertDialog(
                    backgroundColor: Theme.of(context).primaryColor,
                    title: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("Are you sure you want to delete       \nthis task",style: Theme.of(context).textTheme.titleMedium,),
                          SizedBox(height: 20,),
                          Row(children: [
                            Expanded(
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                color: AppColors.red,
                                onPressed: () {
                                  setState(() {
                                    if(index != -1){
                                      Provider.of<HomeProvider>(context,listen: false).deleteTask(widget.taskmodel);


                                    }
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  });

                                  },
                                child: Text("Yes",style: TextStyle(color: AppColors.white),),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),

                                ),
                                color: AppColors.blue,
                                onPressed: (){
                                Navigator.pop(context);
                              },
                                child: Text("Cancel",style: TextStyle(color: AppColors.white),),
                              ),
                            ),

                          ],)
                        ],
                      ),
                    ),

                  );
                });
              },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),

                color: AppColors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Delete",style: TextStyle(color: AppColors.white,fontSize: 18),
                      ),
                      SizedBox(width: 10,),
                      Icon(Icons.delete,color: AppColors.white,)
                    ],
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
