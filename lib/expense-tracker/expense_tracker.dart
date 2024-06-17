import 'package:flutter/material.dart';
import 'package:flutter_udemy/expense-tracker/components/chart/chart.dart';
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
  Widget mainContent = const Center(
    child: Text('No expenses found, start adding some!'),
  );

  void _addExpense(Expense expense) {
    setState(() {
      widget.expenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final deleteIndex = widget.expenses.indexOf(expense);
    setState(() {
      widget.expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () => setState(() {
            widget.expenses.insert(deleteIndex, expense);
          }),
        ),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (modalContext) {
        return NewExpenseModal(
          addExpense: (Expense expense) => _addExpense(expense),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: widget.expenses),
          Expanded(
            child: widget.expenses.isNotEmpty
                ? ExpensesList(expensesList: widget.expenses, onRemoveExpense: _removeExpense)
                : mainContent,
          ),
        ],
      ),
    );
  }
}
