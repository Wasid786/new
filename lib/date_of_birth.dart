import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateOfBirthPage extends StatefulWidget {
  const DateOfBirthPage({Key? key}) : super(key: key);

  @override
  _DateOfBirthPageState createState() => _DateOfBirthPageState();
}

class _DateOfBirthPageState extends State<DateOfBirthPage> {
  late DateTime _selectedDate = DateTime.now();
  final _dateFormatter = DateFormat('yyyy-MM-dd');
  bool _isOlderThan13 = false;
  Future<void> _selectDate(BuildContext context) async {
    final initialDate = DateTime.now().subtract(const Duration(
        days:
            4745)); // Assuming average lifespan of 70 years (365 * 70 = 25,550 days). Subtracting 13 years (365 * 13 = 4,745 days).

    final bool isEligibleForSelection =
        DateTime.now().difference(initialDate).inDays >= 4745;

    if (!isEligibleForSelection) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Not Eligible'),
            content: const Text(
                'You must be at least 13 years old to select a date of birth.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: initialDate,
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _isOlderThan13 =
            DateTime.now().difference(_selectedDate).inDays >= 4745;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Date of Birth"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select your date of birth',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(200, 50)),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.grey.withOpacity(0.3),
                ),
              ),
              child: Text(
                !_selectedDate.isNull
                    ? _dateFormatter.format(_selectedDate)
                    : 'Select date',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            const Visibility(
              child: Text(
                'You are older than 13 years.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                ),
              ),
            ),

            // Visibility(
            //   visible: _selectedDate != null,
            //   child: Text(
            //     _isOlderThan13
            //         ? 'You are older than 13 years.'
            //         : 'You must be older than 13 years to sign in.',
            //     style: TextStyle(
            //       fontSize: 14,
            //       color: _isOlderThan13 ? Colors.green : Colors.red,
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isOlderThan13
                  ? () {
                      // Handle sign-in for users older than 13
                    }
                  : null,
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(100, 40)),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 87, 86, 86),
                ),
              ),
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
