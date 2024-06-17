import 'package:flutter_udemy/expense-tracker/enums/expense_category.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

class Expense {
  double value;
  String description;
  DateTime date;
  final String id;
  ExpenseCategory category;

  Expense({
    required this.value,
    required this.description,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  get formattedDate {
    return formatter.format(date);
  }
}
