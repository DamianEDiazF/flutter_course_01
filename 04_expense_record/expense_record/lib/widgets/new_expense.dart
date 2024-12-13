import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expense_record/models/expense.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onNewExpense});

  final void Function(Expense) onNewExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _pickedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    var newDate = await showDatePicker(
        context: context,
        firstDate: DateTime.utc(2000),
        lastDate: DateTime.utc(3000));

    setState(() {
      _pickedDate = newDate;
    });
  }

  void _submitExpenseData() {
    var enteredAmount = double.tryParse(_amountController.text.trim());

    if (_titleController.text.trim().isEmpty ||
        enteredAmount == null ||
        enteredAmount < 0 ||
        _pickedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid data'),
          content: Text('Check title, amount and date.'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text("Go away! 🤷‍♂️")),
          ],
        ),
      );
      return;
    }

    widget.onNewExpense(
      Expense(
        title: _titleController.text.trim(),
        amount: enteredAmount,
        date: _pickedDate!,
        category: _selectedCategory,
      ),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        16,
        48, // Padding from top set to 48 to avoid android keyboard obscuring UI elements somehow
        16,
        16,
      ),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text(
                "Title",
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 50,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]'))
                  ],
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text(
                      "Amount",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_pickedDate == null
                        ? 'No date selected'
                        : formatter.format(_pickedDate!)),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  }
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text("Save Expense"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class _NewExpenseState extends State<NewExpense> {
//   var _enteredTitle = '';

//   void _saveTitleInput(String inputValue) {
//     _enteredTitle = inputValue;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           TextField(
//             onChanged: _saveTitleInput,
//             maxLength: 50,
//             decoration: const InputDecoration(
//               label: Text(
//                 "Title",
//               ),
//             ),
//           ),
//           Row(
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   print(_enteredTitle);
//                 },
//                 child: const Text("Save Expense"),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
