import 'package:expense_tracker/models/expense.dart' as expense;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  NewExpense({super.key, required this.addExpense});
  void Function(expense.Expense) addExpense;
  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final enteredTitle = TextEditingController();
  final enteredAmount = TextEditingController();
  DateTime? selectedDate;
  expense.Category? selectedCategory;

  @override
  void dispose() {
    enteredTitle.dispose();
    enteredAmount.dispose();
    super.dispose();
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void onSelectCategory(expense.Category? category) {
    if (category == null) return;
    setState(() {
      selectedCategory = category;
    });
  }

  void submitExpenseData() {
    final enteredAmountVal = double.tryParse(enteredAmount.text);
    final enteredAmountValid = enteredAmountVal != null && enteredAmountVal > 0;

    if (enteredTitle.text.trim().isEmpty ||
        !enteredAmountValid ||
        selectedDate == null ||
        selectedCategory == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text("Invalid data"),
              content: Text("Please enter valid data"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            );
          });
      return;
    }
    widget.addExpense(expense.Expense(
        title: enteredTitle.text,
        amount: enteredAmountVal!,
        date: selectedDate!,
        category: selectedCategory!));
    Navigator.pop(context);
  }

  void datePicker() async {
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    setState(() {
      selectedDate = pickedDate!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.fromLTRB(16, 48, 16, keyBoardSpace + 16),
                child: Column(
                  children: [
                    if (width > 600)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: enteredTitle,
                              maxLength: 50,
                              decoration: const InputDecoration(
                                labelText: 'Title',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Expanded(
                            child: TextField(
                              controller: enteredAmount,
                              maxLength: 50,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                prefixText: '\$',
                                labelText: 'Entered Amount',
                              ),
                            ),
                          )
                        ],
                      )
                    else
                      TextField(
                        controller: enteredTitle,
                        maxLength: 50,
                        decoration: const InputDecoration(
                          labelText: 'Title',
                        ),
                      ),
                    Row(children: [
                      Expanded(
                        child: TextField(
                          controller: enteredAmount,
                          maxLength: 50,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixText: '\$',
                            labelText: 'Entered Amount',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(selectedDate == null
                                ? "Select date"
                                : formatter.format(selectedDate!)),
                            IconButton(
                              onPressed: datePicker,
                              icon: const Icon(Icons.calendar_month),
                            )
                          ],
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        DropdownButton(
                          value: selectedCategory,
                          items: expense.Category.values.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(
                                e.name.toUpperCase(),
                              ),
                            );
                          }).toList(),
                          onChanged: onSelectCategory,
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: submitExpenseData,
                          child: const Text("Save Expense"),
                        ),
                        TextButton(
                          onPressed: onCancel,
                          child: const Text("Cancel"),
                        )
                      ],
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
}
