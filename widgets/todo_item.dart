import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/TodoApp/components/colors.dart';
import 'package:practice/TodoApp/models/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem({Key? key, required this.todo, this.onToDoChanged, this.onDeleteItem}) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: (){
          //print("Clicked on todo item");
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone? Icons.check_box:Icons.check_box_outline_blank,color:COLORS.tdBlue,),
        title: Text(todo.todoText!,
          style:TextStyle(fontSize: 16,color: COLORS.tdBlack,
        decoration:todo.isDone? TextDecoration.lineThrough:null)),


        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: COLORS.tdRed,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            color: Colors.white,iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: (){
              onDeleteItem(todo.id);

            //  print("Clicked on delete item");
            },
          ),
        ),
      ),
    );
  }
}
