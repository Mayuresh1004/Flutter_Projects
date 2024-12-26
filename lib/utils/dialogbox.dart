import 'package:flutter/material.dart';
import 'package:todolist_app/utils/buttons.dart';

class Dialogbox extends StatelessWidget {
   Dialogbox({super.key,required this.controller,required this.OnSave,required this.OnCancel});
  final  controller;
  VoidCallback OnSave;
  VoidCallback OnCancel;
  
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                

                hintText: "Add a Task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              
              //save button
              Buttons(
                text: "Save", onPressed: OnSave,
                
                ),
                SizedBox(width: 10,),
              //cancel button
              Buttons(
                text: "Cancel", onPressed: OnCancel
                )
            ],)
          ],
        ),
      ),
    );
  }
}