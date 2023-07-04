import 'package:flutter/material.dart';
import 'package:stick/pages/login_page.dart';
import 'package:stick/user_name_page.dart';

class SelectInterestPage extends StatefulWidget {
  const SelectInterestPage({super.key});
  @override
  _SelectInterestPageState createState() => _SelectInterestPageState();
}

class _SelectInterestPageState extends State<SelectInterestPage> {
  List<String> selectedTags = [];

  void _toggleTag(String tag) {
    setState(() {
      if (selectedTags.contains(tag)) {
        selectedTags.remove(tag);
      } else {
        selectedTags.add(tag);
      }
    });
  }

  void _navigateToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 66, 66, 66),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Choose what interests you the most',
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          buildTagChip('#travel_&_vlog'),
                          const SizedBox(width: 20),
                          const SizedBox(height: 20),
                          buildTagChip('#health_&_fitness'),
                          SizedBox(width: 20),
                          SizedBox(height: 20),
                          buildTagChip('#business_&_investment'),
                          SizedBox(width: 20),
                          SizedBox(height: 20),
                          buildTagChip('#science'),
                          SizedBox(width: 20),
                          SizedBox(height: 20),
                          buildTagChip('#cooking_&_baking'),
                          SizedBox(width: 20),
                          SizedBox(height: 20),
                          buildTagChip('#art_&_design'),
                          SizedBox(width: 20),
                          SizedBox(height: 20),
                          buildTagChip('#photography_&_videography'),
                          SizedBox(width: 20),
                          SizedBox(height: 20),
                          buildTagChip('#computer_tech'),
                          SizedBox(width: 20),
                          SizedBox(height: 20),
                          buildTagChip('#performing_arts'),
                          SizedBox(width: 20),
                          SizedBox(height: 20),
                          buildTagChip('#writing_&_quotes'),
                          SizedBox(width: 20),
                          SizedBox(height: 20),
                          buildTagChip('#sports_&_e-sports'),
                          SizedBox(width: 20),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: double.minPositive,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 100, // Set the desired width for the button
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UsernamePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 77, 77, 77),
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),

              // child: ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => UsernamePage()),
              //     );
              //   },
              //   style: ButtonStyle(
              //     minimumSize: MaterialStateProperty.all<Size>(Size(100, 40)),
              //     backgroundColor: MaterialStateProperty.all<Color>(
              //       const Color.fromARGB(255, 87, 86, 86),
              //     ),
              //   ),
              //   child: const Text('Save'),
              // ),
            ),
            Center(
              child: GestureDetector(
                onTap: () => _navigateToLoginPage(context),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Already a member? Login here',
                    style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTagChip(String tag) {
    final isSelected = selectedTags.contains(tag);
    return GestureDetector(
      onTap: () => _toggleTag(tag),
      child: Chip(
        label: Text(tag),
        backgroundColor: isSelected ? Color.fromARGB(255, 203, 252, 112) : null,
        deleteIconColor: isSelected ? Colors.white : null,
      ),
    );
  }
}
