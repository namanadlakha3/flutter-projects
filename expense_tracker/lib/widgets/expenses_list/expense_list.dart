import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({super.key, required this.expenses});
  List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return ExpenseItem(
          expenses[index],
        );
      },
    );
  }
}
