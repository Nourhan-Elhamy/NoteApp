class TaskModel{

  final String title;
  final String desc;
  final String time;
  final String startdate;
  final String enddate;
  bool doneOrnot;
  bool archieveOrnot;



  TaskModel({
    required this.time,
    required this.title,
    required this.enddate,
    required this.startdate,
    required this.desc,
    this.doneOrnot=false,
    this.archieveOrnot=false
});


}

