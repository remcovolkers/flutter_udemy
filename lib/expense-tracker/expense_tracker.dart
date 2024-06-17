import 'package:flutter/material.dart';
import 'package:flutter_udemy/expense-tracker/components/chart/chart.dart';
import 'package:flutter_udemy/expense-tracker/components/expenses_list/expenses_list.dart';
import 'package:flutter_udemy/expense-tracker/components/new_expense_modal.dart';
import 'package:flutter_udemy/expense-tracker/data/expense_data.dart';
import 'package:flutter_udemy/expense-tracker/models/expense.dart';
import 'package:flutter_udemy/expense-tracker/models/expense_response.dart';

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

  void _onEditExpense(Expense expense) {
    int editIndex = widget.expenses.indexOf(expense);

    setState(() {
      widget.expenses[editIndex] = expense;
    });
  }

  void _openAddExpenseOverlay(Expense? expense) async {
    ExpenseResponse newOrEdittedExpense = await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (modalContext) {
        return AddOrEditExpenseModal(
          expense: expense,
        );
      },
    );

    if (newOrEdittedExpense.isEdit) {
      _onEditExpense(newOrEdittedExpense.expense);
    } else {
      _addExpense(newOrEdittedExpense.expense);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).size.width > MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: () => _openAddExpenseOverlay(null),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: !isLandscape
          ? Column(
              children: [
                Chart(expenses: widget.expenses),
                Expanded(
                  child: widget.expenses.isNotEmpty
                      ? ExpensesList(
                          expensesList: widget.expenses,
                          onRemoveExpense: _removeExpense,
                          onEditExpense: _openAddExpenseOverlay,
                        )
                      : mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: widget.expenses)),
                Expanded(
                  child: widget.expenses.isNotEmpty
                      ? ExpensesList(
                          expensesList: widget.expenses,
                          onRemoveExpense: _removeExpense,
                          onEditExpense: _openAddExpenseOverlay,
                        )
                      : mainContent,
                ),
              ],
            ),
    );
  }
}
