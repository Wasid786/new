import 'package:flutter/material.dart';
import 'package:stick/password.dart';

class UsernamePage extends StatelessWidget {
  const UsernamePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 66, 66, 66),
        title: const Text("What's vibes with you?"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose your username',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 66, 66, 66),
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/userpage.gif',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your username',
                  hintStyle: TextStyle(fontSize: 14),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PasswordPage()),
                );
              },
              style: ButtonStyle(
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(100, 40)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 66, 66, 66),
                  )),
              child: const Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),

              /// color lagana hai yahan
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              'We reserved a spot for you',
              style: TextStyle(
                color: Color.fromARGB(255, 66, 66, 66),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
