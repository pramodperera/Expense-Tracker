import 'package:expense_tracker_app/expense_components/expense_list.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'datePicker.dart';
import 'expense_components/new_expense.dart';

const filePath = 'assets/json/expense_data.json';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  List<Expense> expenses = [];
  DateTime? _selectedDate = DateTime.now();
  final formatter = DateFormat.yMd();

  @override
  void initState() {
    _loadExpenses();
    super.initState();
  }

  void _showDatePickerMain() async {
    DatePickerUtil datePickerUtil = DatePickerUtil();
    DateTime? pickedDate = await datePickerUtil.showDatePick(context);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _loadExpenses() async {
    List<Expense> loadedExpenses =
        (await readJsonFile(filePath)).map((dynamic item) {
      return Expense.fromJson(item as Map<String, dynamic>);
    }).toList();
    setState(() {
      expenses = loadedExpenses;
    });
  }

  // #TODO - addExpense function to expense List and pass to NewExpense widget;
  void addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  // #TODO - removeExpense function to expense List and pass to NewExpense widget;
  void _removeExpense(Expense expense) {
    final expenseIndex=expenses.indexOf(expense);
    setState(() {
      expenses.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(context).colorScheme.error,
        action: SnackBarAction(label: 'Undo',
        onPressed: (){
          setState(() {
            expenses.insert(expenseIndex, expense);
          });

        },),
        content: const Text('You have deleted an expense!')));
  }

  void _openAddExpenseOverlay() {
    // #TODO - Add show bottom model
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (ctx) => NewExpense(onAddExpense: addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          Text(_selectedDate != null
              ? formatter.format(_selectedDate!)
              : ': No data selected'),
          IconButton(
              onPressed: () {
                _showDatePickerMain();
              },
              icon: Icon(Icons.calendar_month_outlined)),
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ExpensesList(expenses: expenses,onRemoveExpense: _removeExpense,
            selectedDate: _selectedDate ?? DateTime.now(),)),
        ],
      ),
    );
  }
}
