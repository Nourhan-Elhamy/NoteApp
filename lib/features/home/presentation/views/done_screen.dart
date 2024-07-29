import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/utils/app_colors.dart';
import 'package:todoapp/features/home/data/model/task_model.dart';
import 'package:todoapp/features/home/presentation/views/task_details_screen.dart';
import '../../../../core/utils/app_images.dart';
import '../controller/home_controller.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({super.key});
  @override
  State<DoneScreen> createState() => _DoneScreenState();
}
class _DoneScreenState extends State<DoneScreen> {
  @override
  Widget build(BuildContext context) {
    List<TaskModel> donelist =
    Provider.of<HomeProvider>(context).task.where((element) => element.doneOrnot == true).toList();
    return Scaffold(

      appBar: AppBar(

        title: Text("Done Tasks",style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: true,
        leading:  GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Image.asset(AppImages.arrowleft,color: Theme.of(context).iconTheme.color,)),
      ),
      body: ListView.builder(
        itemCount: donelist.length,
          itemBuilder: (c,index){
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (c){
                return TaskDetailsScreen(taskmodel: donelist[index]);
              }));
            },
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              tileColor: Theme.of(context).primaryColor,
              leading: Image.asset(AppImages.iconbag),
              title: Text(donelist[index].title,style: Theme.of(context).textTheme.titleMedium,),
              subtitle: Text(donelist[index].time,style: TextStyle(color: AppColors.blue),),
              trailing: Column(
                children: [
                  Text(donelist[index].startdate,style: TextStyle(color: AppColors.blue),),
                  SizedBox(height: 13,),
                  Text(donelist[index].enddate,style: TextStyle(color: AppColors.blue)),
                ],
              ),
            ),
          ),
        );

      }),

    );
  }
}
