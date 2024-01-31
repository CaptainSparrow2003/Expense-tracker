import 'package:flutter/material.dart';
import 'package:newproject/Models/expense.dart';
import 'package:newproject/widgets/expense_list.dart';
import 'package:newproject/widgets/new_expense.dart';
import 'package:newproject/widgets/total_expense.dart';
import 'package:newproject/widgets/chart/chart.dart';
import 'package:newproject/sms_handler.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [];
  @override
  void initState() {
    super.initState();
    SmsMessagesList(addSmsExpense: _addExpense).filterSmsMessages();
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(onAddExpense: _addExpense);
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: const Duration(seconds: 5),
          content: const Text('you deleted an expense'),
          action: SnackBarAction(
              label: 'undo',
              onPressed: () {
                setState(() {
                  _registeredExpenses.insert(expenseIndex, expense);
                });
              })),
    );
  }

  double get _totalExpense {
    double sum = 0;
    for (final expense in _registeredExpenses) {
      sum += expense.amount;
    }
    return double.parse(sum.toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    Widget maincontent = const Center(
      child: Text('no expenses found.\nStart adding some'),
    );
    if (_registeredExpenses.isNotEmpty) {
      maincontent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'Assets/AppLogo1.png',
                width: 150,
                height: 75,
              )
            ],
          ),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add),
            )
          ]),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          TotalExpense(totalExpense: _totalExpense),
          Expanded(child: maincontent),
        ],
      ),
    );
  }
}
