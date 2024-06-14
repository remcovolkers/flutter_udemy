import 'package:flutter/material.dart';
import 'package:flutter_udemy/expense-tracker/components/expenses_list/expenses_list.dart';
import 'package:flutter_udemy/expense-tracker/components/new_expense_modal.dart';
import 'package:flutter_udemy/expense-tracker/data/expense_data.dart';
import 'package:flutter_udemy/expense-tracker/models/expense.dart';

class ExpenseTracker extends StatefulWidget {
  ExpenseTracker({super.key});
  final List<Expense> expenses = expenseData;

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  void addExpense(Expense expense) {
    setState(() {
      widget.expenses.add(expense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (modalContext) {
        return NewExpenseModal(
          addExpense: (Expense expense) => addExpense(expense),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpensesList(expensesList: widget.expenses),
          ),
        ],
      ),
    );
  }
}
