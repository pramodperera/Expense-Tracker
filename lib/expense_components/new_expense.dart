import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // #TODO - onChange function

  // #TODO - titileController & _amountController with TextEditingController
  // #TODO - selectedCategory
  // #TODO - selectedDate

  // #TODO - dispose

  // #TODO - showDatePicker Function

  // #TODO - onSubmit Function with validations

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            onChanged: (e) => {},
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          // #TODO - Amount with keyboardType: TextInputType.number
          // #TODO - Date Picker Selection Icon Button with a Text
          // #TODO - Category Dropdown
          Row(
            // #TDOD - Add Cancel TextButton with Navigator.pop(context)
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
