import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../datePicker.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // #TODO - titileController & _amountController with TextEditingController

  var textFieldValue = '';
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.food;

  DateTime? _selectedDate;
  final formatter = DateFormat.yMd();
  // #TODO - onChange function

  // void onTextChange(String value){
  //   print('Typed value: $value');
  // }

  // #TODO - selectedCategory
  // #TODO - selectedDate

  // #TODO - showDatePicker Function

  // void _showDatePicker() async{
  //   final now=DateTime.now();
  //   final firstDate=DateTime(now.year-1,now.month ,now.day);
  //   var pickedDate=await showDatePicker(
  //       context: context,
  //       initialDate: now,
  //       firstDate: firstDate,
  //       lastDate: now);
  //
  //   setState(() {
  //     _selectedDate=pickedDate;
  //   });
  // }

  void _showDatePicker() async {
    DatePickerUtil datePickerUtil = DatePickerUtil();
    DateTime? pickedDate = await datePickerUtil.showDatePick(context);

    // Now you can use the pickedDate or perform other actions.
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  // #TODO - dispose
  @override
  void dispose() {
    _titleController.dispose;
    _amountController.dispose;
    super.dispose;
  }

  // #TODO - onSubmit Function with validations
  void onSubmit() {
    if (_titleController.text.isEmpty ||
        _amountController.text.isEmpty ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Validation Message'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(Expense(
      id: const Uuid().v4(),
      title: _titleController.text,
      amount: double.parse(_amountController.text),
      date: _selectedDate!,
      category: _selectedCategory,
    ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text('Add New Expense',
              style: TextStyle(fontStyle: FontStyle.italic)),
          TextField(
            controller: _titleController,
            // onChanged: (e) => {onTextChange(e)},
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),

          // #TODO - Amount with keyboardType: TextInputType.number
          TextField(
            keyboardType: TextInputType.number,
            controller: _amountController,
            decoration: const InputDecoration(
              prefixText: 'LKR ',
              label: Text('Amount'),
            ),
          ),
          // #TODO - Date Picker Selection Icon Button with a Text
          Row(
            children: [
              Text(_selectedDate != null
                  ? formatter.format(_selectedDate!)
                  : ': No data selected'),
              IconButton(
                  onPressed: () {
                    _showDatePicker();
                  },
                  icon: Icon(Icons.calendar_month_outlined)),
            ],
          ),
          // #TODO - Category Dropdown
          DropdownButton(
              value: _selectedCategory,
              items: Category.values
                  .map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: Text(
                        category.name.toUpperCase(),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  _selectedCategory = value;
                });
              }),

          Row(
            // #TDOD - Add Cancel TextButton with Navigator.pop(context)
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                onPressed: () {
                  onSubmit();
                  print('title: ${_titleController.text}');
                  print('amount: ${_amountController.text}');
                  print('selected Date: ${_selectedDate}');
                  print('selected Category: ${_selectedCategory}');
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
