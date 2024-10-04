import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget{
  const  NewExpense({super.key});

 @override
  State<NewExpense> createState(){
    return _NewExpenseState();
  }

}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(context){
    return const  Padding(padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
           maxLength: 25,
           decoration: InputDecoration(
             label: Text('Title'),
           ),
          )
        ],
      ),);
  }
}