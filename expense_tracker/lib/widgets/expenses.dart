import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'chart/chart.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

// create class _ExpensesScreenState to hold the state of the ExpensesScreen widget
class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _expenses = [
    Expense(
        title: "Flutter course",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Movie",
        amount: 9.99,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  void removeExpense(String id) {
    Expense expense = _expenses.firstWhere((e) => e.id == id);
    int index = _expenses.indexOf(expense);
    setState(() {
      _expenses.removeWhere((expense) => expense.id == id);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Expense removed"),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
            label: "UNDO",
            onPressed: () {
              setState(() {
                _expenses.insert(index, expense);
              });
            }),
      ),
    );
  }

  void openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpense(addExpense: addExpense);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text("No expenses found."),
    );

    if (_expenses.length > 0) {
      mainContent =
          ExpenseList(expenses: _expenses, removeExpense: removeExpense);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: openAddExpenseOverlay,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Chart(
            expenses: _expenses,
          ),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
