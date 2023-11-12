import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({super.key, required this.expenses, required this.removeExpense});
  void Function(String) removeExpense;
  List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
            background: Container(
              margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal,
              ),
              color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            ),
            key: ValueKey(expenses[index]),
            onDismissed: ((direction) {
              removeExpense(expenses[index].id);
            }),
            child: ExpenseItem(
              expenses[index],
            ));
      },
    );
  }
}
