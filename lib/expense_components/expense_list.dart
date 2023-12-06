import 'package:expense_tracker_app/expense_components/expense_item.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...expenses.map((e) => ExpenseItem(e))],
    );

    // #TODO - Try with ListView then

    // #TODO - Add ListView.builder
  }
}
