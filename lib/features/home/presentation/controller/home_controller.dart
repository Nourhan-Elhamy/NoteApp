import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../add_task/presentation/views/widgets/add_task_body.dart';
import '../../data/model/task_model.dart';


class HomeProvider extends ChangeNotifier{
  String convertDateString(DateTime date){
    return date.toString().split(" ")[0];

  }
  List<TaskModel>task=[];


  deleteTask(TaskModel taskModel) {
    task.remove(taskModel);
    notifyListeners();
  }

  String converttime(TimeOfDay time){
    return "${time.hour}:${time.minute}:${time.period.name}";
  }


  addTask(
  {
    context,
    required desc ,
    required title

}
      ){
    if(time!=null && startdate!=null && enddate!=null && tasknamecontroller.text.isNotEmpty &&desccontrollr.text.isNotEmpty)
    {
      task.add(
          TaskModel(
              time: time!.format(context).toString(),
              title: tasknamecontroller.text,
              enddate: convertDateString(enddate!),
              startdate: convertDateString(startdate!),
              desc: desccontrollr.text
          )
      );
notifyListeners();
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill the previous Fields"),backgroundColor: AppColors.blue,));
    }
    resetDate();

}



selectStartDate(context) async {
  startdate= await showDatePicker(context: context, firstDate: datetime, lastDate: datetime.add(Duration(
      days: 365
  )));
  notifyListeners();
}

selectEndDate(context)async{
  enddate= await showDatePicker(context: context, firstDate: datetime, lastDate: datetime.add(Duration(
      days: 365
  )));
  notifyListeners();
}
selectTime(context)async{
  time =await showTimePicker(context: context, initialTime: TimeOfDay.now());
}
  DateTime? startdate= DateTime.now();
  DateTime? enddate= DateTime.now();
  TimeOfDay? time;

  updateDone(int index){
    task[index].doneOrnot=!task[index].doneOrnot;
    notifyListeners();
  }
  updateArchieve(int index){

      task[index].archieveOrnot = !task[index].archieveOrnot;
      notifyListeners();

  }

  resetDate(){
    startdate= DateTime.now();
    enddate= DateTime.now();
     time=null;
     desccontrollr.clear();
     tasknamecontroller.clear();

  }
}