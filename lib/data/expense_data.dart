import 'package:expense_tracker_app/models/expense.dart';

final List<Expense> registeredExpenses = [
  Expense(
    id: "a3e32f19-58d2-4dcc-81f9-de85cf063630",
    title: 'Transport to iCET',
    amount: 19.99,
    date: DateTime.now(),
    category: Category.travel,
  ),
  Expense(
    id: "a3e32f19-58d2-4dcc-81f9-de85cf063631",
    title: 'Lunch',
    amount: 15.69,
    date: DateTime.now(),
    category: Category.food,
  ),
];
