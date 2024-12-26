import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todotile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

   Todotile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
  });


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top:25,right: 25,left: 25 ),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(onPressed: deleteFunction,
          icon: Icons.delete,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(20),)
        ]),
        child: Container(
          
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.yellow[400]
          ),
          
          child: Row(
            
            children: [
              //checkbox
              Checkbox(value: taskCompleted, onChanged: onChanged,activeColor: Colors.black,),
              //task name
              Text(taskName,
              style:TextStyle(
                decoration: taskCompleted?TextDecoration.lineThrough:TextDecoration.none
               ),)
            ],
          ),
        ),
      ),
    );
  }
}