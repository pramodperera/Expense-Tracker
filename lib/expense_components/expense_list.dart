import 'package:expense_tracker_app/expense_components/expense_item.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList({
    required this.expenses,
    required this.onRemoveExpense,
    required this.selectedDate,

  }) ;


  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  final DateTime selectedDate;

  Widget build(BuildContext context) {
    final filteredExpenses = expenses.where((expense) =>
    expense.date.year == selectedDate.year &&
        expense.date.month == selectedDate.month &&
        expense.date.day == selectedDate.day);

    return filteredExpenses.isEmpty
        ? const Center(
      child: Text('No expenses available for the selected date.'),
    )
        : ListView.builder(
      itemCount: filteredExpenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(filteredExpenses.elementAt(index)),
        onDismissed: (direction) {
          onRemoveExpense(filteredExpenses.elementAt(index));
        },
        background: Container(
          color: Colors.red,
          child: Icon(Icons.delete, color: Colors.white),
        ),
        child: ExpenseItem(filteredExpenses.elementAt(index)),
      ),
    );
  }
}
  // final DateTime? selectedDate;

  // @override
  // Widget build(BuildContext context) {
  //   // return Column(
  //   //   children: [...expenses.map((e) => ExpenseItem(e))],
  //   // );
  //
  //   // #TODO - Try with ListView then
  //   // return ListView(
  //   //   padding: const EdgeInsets.all(8),
  //   //   children: <Widget>[
  //   //     ...expenses.map((e) => ExpenseItem(e)),
  //   //   ],
  //   // );
  //
  //   // #TODO - Add ListView.builder
  //   return ListView.builder(
  //       itemCount: expenses.length,
  //       itemBuilder: (context, index) => Dismissible(
  //           key: ValueKey(expenses[index]),
  //           onDismissed: (direction) {
  //             onRemoveExpense(expenses[index]);
  //           },
  //           child: ExpenseItem(expenses[index])));
  // }
  // @override
  // Widget build(BuildContext context) {
  //   return ListView.builder(
  //       itemCount: expenses.length,
  //       itemBuilder: (context, index) => Dismissible(
  //           key: ValueKey(expenses[index]),
  //           onDismissed: (direction) {
  //             onRemoveExpense(expenses[index]);
  //           },
  //           child: ExpenseItem(expenses[index])));
  // }
  // Filter expenses based on the selected date
  //   final filteredExpenses = selectedDate != null
  //       ? expenses.where((expense) =>
  //   expense.date.year == selectedDate!.year &&
  //       expense.date.month == selectedDate!.month &&
  //       expense.date.day == selectedDate!.day)
  //       : expenses;
  //
  //   return filteredExpenses.isEmpty
  //       ? const Center(
  //     child: Text('No expenses available for the selected date.'),
  //   )
  //       : ListView.builder(
  //     itemCount: filteredExpenses.length,
  //     itemBuilder: (context, index) => Dismissible(
  //       key: ValueKey(filteredExpenses.elementAt(index)),
  //       onDismissed: (direction) {
  //         onRemoveExpense(filteredExpenses.elementAt(index));
  //       },
  //       background: Container(
  //         color: Colors.red,
  //         child: const Icon(Icons.delete, color: Colors.white),
  //       ),
  //       child: ExpenseItem(filteredExpenses.elementAt(index)),
  //     ),
  //   );
  // }
// }
