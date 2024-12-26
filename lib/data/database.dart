import 'package:hive_flutter/hive_flutter.dart';

class toDoDataBase {
  //reference box
  List toDoList=[];
  final mybox=Hive.box("mybox");

  //runs if it is 1st time opening the app
  void createInitialData(){
    toDoList = [
      ["Go to Gym",false],["Study",false]
    ];
  }

  //load data from db
  void loadData(){
    toDoList=mybox.get("ToDoList");
  }

  //update data
  void updateDataBase(){
    mybox.put("ToDoList", toDoList);
  }
}