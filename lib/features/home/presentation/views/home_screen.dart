import 'dart:io';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/utils/app_colors.dart';
import 'package:todoapp/core/utils/app_images.dart';
import 'package:todoapp/features/add_task/presentation/views/add_task_screen.dart';

import 'package:todoapp/features/home/data/model/task_model.dart';
import 'package:todoapp/features/home/presentation/controller/home_controller.dart';
import 'package:todoapp/features/home/presentation/views/task_details_screen.dart';
import 'package:todoapp/features/home/presentation/views/widgets/appbar_widget.dart';
import 'package:todoapp/features/home/presentation/views/widgets/drawer_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.name, required this.photo, });
final String name;
final File photo;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<TaskModel> unArchieveTasks=Provider.of<HomeProvider>(context).task.where((element) =>element.archieveOrnot==false).toList();
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.blue,
          onPressed: (){
          },
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (c){
                return AddTaskScreen();
              }));
            },
              child: Icon(Icons.add,color: AppColors.white,)),
        ),
        drawer: Drawer(
          child: CustomDrawer(name: widget.name,photo: widget.photo,),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body:   Column(
          children: [
            AppbarWidget(name: widget.name,photo: widget.photo,),
            Expanded(
              child: unArchieveTasks.isEmpty?
                  Center(child: Text("Please Add Task",style: Theme.of(context).textTheme.titleMedium,)):
              ListView.builder(
                itemCount: unArchieveTasks.length,
                  itemBuilder:(c,index){
                    return Dismissible(
                      background: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.red,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.delete,color: AppColors.white,),

                      ),
                      key: GlobalKey(),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 22,left: 22,right: 22,bottom: 3),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (c){
                              return TaskDetailsScreen(taskmodel: unArchieveTasks[index],)
                              ;
                            }));
                          },
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            ),
                            tileColor: Theme.of(context).primaryColor,
                            title: Text(unArchieveTasks[index].title,style: Theme.of(context).textTheme.titleMedium,),
                            trailing: GestureDetector(
                              onTap: (){
                                setState(() {
                                  unArchieveTasks[index].doneOrnot=!unArchieveTasks[index].doneOrnot;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color:unArchieveTasks[index].doneOrnot?AppColors.white:
                                      AppColors.blue,
                                  border: Border.all(color: AppColors.blue)

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Done"),
                                ),
                              ),
                            ),
                            leading: Image.asset(AppImages.iconbag),
                            subtitle: Text(unArchieveTasks[index].time,style: TextStyle(color: AppColors.blue),),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
