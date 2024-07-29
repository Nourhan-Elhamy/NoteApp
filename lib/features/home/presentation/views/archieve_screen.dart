import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/utils/app_images.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/model/task_model.dart';
import '../controller/home_controller.dart';

class ArchieveScreen extends StatefulWidget {
  ArchieveScreen({super.key});
  @override
  State<ArchieveScreen> createState() => _ArchieveScreenState();
}
class _ArchieveScreenState extends State<ArchieveScreen> {
  @override
  Widget build(BuildContext context) {

    List<TaskModel>archievelist = Provider.of<HomeProvider>(context).task.where((element) => element.archieveOrnot == true).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Archieve Tasks",style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: true,
        leading:  GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Image.asset(AppImages.arrowleft,color: Theme.of(context).iconTheme.color,)),
      ),
      body: ListView.builder(
          itemCount: archievelist.length,
          itemBuilder: (c,index){
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: (){

                },
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  tileColor: Theme.of(context).primaryColor,
                  leading: Image.asset(AppImages.iconbag),
                  title: Text(archievelist[index].title,style: Theme.of(context).textTheme.titleMedium,),
                  subtitle: Text(archievelist[index].time,style: TextStyle(color: AppColors.blue),),
                  trailing: Column(
                    children: [
                      MaterialButton(onPressed: (){

                        setState(() {
                          archievelist[index].archieveOrnot=false;
                          archievelist.removeAt(index);
                        });
                      },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        color: AppColors.blue,
                        child: Text("unarchieve",style: TextStyle(fontSize: 12,color: AppColors.white),),
                      )

                    ],
                  ),
                ),
              ),
            );

          }),

    );
  }
}
