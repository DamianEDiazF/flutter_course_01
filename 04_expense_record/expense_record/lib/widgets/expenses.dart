import 'package:expense_record/widgets/expenses_list/expenses_list.dart';
import 'package:expense_record/models/expense.dart';
import 'package:expense_record/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter CURSE',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Rotten Pumpkin',
      amount: 1.29,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  void _openAddExpenseDialog() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return const NewExpense();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _openAddExpenseDialog,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The chart goes here'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
