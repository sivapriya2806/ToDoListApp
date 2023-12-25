import 'package:counter_app/pages/utils/my_button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSaved,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.pink[100],
        content: Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //user input
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a New Task..'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //save
                  MyButton(text: "Save", onPressed: onSaved),

                  const SizedBox(
                    width: 8,
                  ),
                  //cancel
                  MyButton(text: "Cancel", onPressed: onCancel)
                ],
              )
            ],
          ),
        ));
  }
}
