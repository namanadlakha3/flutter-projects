import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ExpenseList(expenses: _expenses),
          ),
        ],
      ),
    );
  }
}
