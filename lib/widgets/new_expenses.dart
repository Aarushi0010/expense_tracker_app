import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget{
  const  NewExpense({super.key});

 @override
  State<NewExpense> createState(){
    return _NewExpenseState();
  }

}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime ? _selectedDate ;

  void _presentDatePicker()  async{
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1 , now.month);
   final pickedDate =  await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

   setState(() {
     _selectedDate = pickedDate ;
   });
  }

  @override
  void dispose(){

    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context){
    return  Padding(padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
           maxLength: 25,
           keyboardType: TextInputType.text,
           decoration: const InputDecoration(
             label: Text('Title'),
           ),
          ),
          const SizedBox(height : 10),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),

              const SizedBox(width : 16),

              Expanded(
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null ? 'Select Date' : formatter.format(_selectedDate!)),
                    IconButton(onPressed: _presentDatePicker,
                        icon: const Icon(
                          Icons.calendar_month,
                        ))
                  ],
                ),
              )
            ],
          ),

          const SizedBox(height : 10),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),

              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                  },
                  child: const Text('Save'))
            ],
          )
        ],
      ),);
  }
}