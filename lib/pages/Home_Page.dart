import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist_app/data/database.dart';
import 'package:todolist_app/utils/ToDoTile.dart';
import 'package:todolist_app/utils/dialogbox.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});
  //Todo List
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){

    //if this is the 1st time opening app the create default data
    if (mybox.get("ToDoList")==null) {
      db.createInitialData();
    }
    else{
      //there already exist data
      db.loadData();
    }
    super.initState();
  }
  //reference hive box
  final mybox = Hive.box("mybox");

  toDoDataBase db = toDoDataBase();

  void checkBoxChanged(bool? value,int index){
    setState(() {
      db.toDoList[index][1]=!db.toDoList[index][1];
    });
    db.updateDataBase();
  }
  
  TextEditingController mycontroller=TextEditingController();

  //save new task 
void saveNewTask(){
  setState(() {
    db.toDoList.add([mycontroller.text,false]);
    mycontroller.clear();
  });
  Navigator.of(context).pop();
  db.updateDataBase();
}

  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context) {
      return Dialogbox(
      controller: mycontroller,
      OnSave: saveNewTask,
      OnCancel: () => Navigator.of(context).pop(),
    );
    },
    );
  }

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
      db.updateDataBase();
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        title: Center(child: Text("TO DO")),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return Todotile(
            taskName: db.toDoList[index][0], 
            taskCompleted: db.toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value,index),
            deleteFunction: (context) => deleteTask(index)
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
      onPressed:createNewTask,
      child:Icon(Icons.add)
      ),
    );
  }
}