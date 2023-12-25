// ignore_for_file: prefer_const_constructors, unused_label

import 'package:counter_app/pages/utils/dialog_page.dart';
import 'package:counter_app/pages/utils/todo_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //varibale
/*  int counter = 0;
  TextEditingController mycontroller = TextEditingController();

  String greeting = "";

  void usergreeting() {
    String username = mycontroller.text;
    setState(() {
      greeting = "Hello" + username;
    });
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }
*/

  //Create to do list
  List toDoList = [
    ["Pay current bills", true],
    ["Buy some books", false],
  ];

  final _controller = TextEditingController();

//create method for checkbox change
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    // Navigator.of(context)=>pop();
  }

  //create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSaved: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
/*    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed this button many times'),
            Text(
              counter.toString(),
              style: TextStyle(fontSize: 40),
            ),
            ElevatedButton(
                onPressed: incrementCounter, child: Text('Increment '))
          ],
        ),
      ),
    );
*/
/*    return Scaffold(
      body: Center(
       // child:Padding(padding: EdgeInsets.all(25),),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(greeting),
            TextField(
              controller: mycontroller,
              decoration: InputDecoration(
                hintText: "type your name.....",
              ),
            ),
            ElevatedButton(onPressed: usergreeting, child: 
            Text('Tap me'))
          ],
        ),
      ),
    );
*/
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: Text('TO DO List'),
        backgroundColor: Colors.pink[300],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },

/*        children: [
          ToDoList(
              taskName: 'Pay Current Bills',
              taskCompleted: true,
              onChanged: (p0) {}),
          ToDoList(
              taskName: 'Buy some Books',
              taskCompleted: false,
              onChanged: (p0) {}),
          ToDoList(
              taskName: 'cook Biriyani',
              taskCompleted: true,
              onChanged: (p0) {})
          //ToDoList(),
          //ToDoList()
        ],
*/
      ),
    );
  }
}
