import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_udemy/expense-tracker/enums/expense_category.dart';
import 'package:flutter_udemy/expense-tracker/models/expense.dart';
import 'package:flutter_udemy/expense-tracker/models/expense_response.dart';

class AddOrEditExpenseModal extends StatefulWidget {
  final Expense? expense;
  const AddOrEditExpenseModal({super.key, this.expense});

  @override
  State<AddOrEditExpenseModal> createState() => _AddOrEditExpenseModalState();
}

class _AddOrEditExpenseModalState extends State<AddOrEditExpenseModal> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  ExpenseCategory _selectedExpenseCategory = ExpenseCategory.leisure;
  DateTime? _selectedDate;

  void _submit() {
    final double value = double.parse(_valueController.text);
    final bool amountIsInvalid = value <= 0;

    if (_descriptionController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null) {
      showDialog(
        context: context,
        builder: (dialogCtx) => AlertDialog(
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('I promise not to fuck up again'),
            )
          ],
          title: const Text('You fucked up'),
          content: const Text('Please don\'t fuck up again.'),
        ),
      );
      return;
    }

    if (widget.expense != null) {
      widget.expense!.category = _selectedExpenseCategory;
      widget.expense!.description = _descriptionController.text;
      widget.expense!.value = double.parse(_valueController.text);

      if (_selectedDate != null) {
        widget.expense!.date = _selectedDate!;
      }
    }

    Expense newOrEdittedExpense = widget.expense ??
        Expense(
          value: value,
          description: _descriptionController.text,
          date: _selectedDate!,
          category: _selectedExpenseCategory,
        );

    ExpenseResponse addResponse =
        ExpenseResponse(isEdit: widget.expense != null, expense: newOrEdittedExpense);
    return Navigator.of(context).pop(addResponse);
  }

  void _openDatePicker() async {
    DateTime now = DateTime.now();

    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: now,
    );

    setState(() {
      _selectedDate = chosenDate;
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    inspect(widget.expense);

    bool isEdit = widget.expense != null;

    if (isEdit) {
      _descriptionController.text = widget.expense!.description;
      _valueController.text = widget.expense!.value.toString();
      _selectedExpenseCategory = widget.expense!.category;
      _selectedDate = widget.expense!.date;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.cancel),
            ),
          ),
          TextField(
            controller: _descriptionController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Description'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _valueController,
                  decoration: const InputDecoration(
                    label: Text('Value'),
                    prefixText: '€ ',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedDate == null ? '' : formatter.format(_selectedDate!)),
                    IconButton(onPressed: _openDatePicker, icon: const Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedExpenseCategory,
                items: ExpenseCategory.values
                    .map(
                      (expenseCategory) => DropdownMenuItem(
                        value: expenseCategory,
                        child: Text(
                          expenseCategory.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedExpenseCategory = value;
                  });
                },
              ),
              const Spacer(),
              IconButton(
                onPressed: _submit,
                icon: const Icon(Icons.save),
              ),
            ],
          )
        ],
      ),
    );
  }
}
