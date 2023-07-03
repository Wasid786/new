import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPhoneNumberInputs = false;
  bool showEmailOrUsernameInputs = false;

  void _showPhoneNumberInputs() {
    setState(() {
      showPhoneNumberInputs = true;
      showEmailOrUsernameInputs = false;
    });
  }

  void _showEmailOrUsernameInputs() {
    setState(() {
      showPhoneNumberInputs = false;
      showEmailOrUsernameInputs = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 66, 66, 66),
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login using phone number or email',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _showPhoneNumberInputs,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 66, 66, 66), // Set the button color to grey
                  ),
                  child: const Text('Phone Number'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _showEmailOrUsernameInputs,
                  style: ElevatedButton.styleFrom(
                    // backgroundcl Colors.grey,
                    backgroundColor: const Color.fromARGB(255, 66, 66, 66),
                  ),
                  child: const Text('Email or Username'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (showPhoneNumberInputs) ...[
              Theme(
                data: ThemeData(
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: Colors.black, // Set the border color to black
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: Colors
                            .black, // Set the border highlight color to black
                      ),
                    ),
                  ),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Enter your phone number',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(
                          255, 66, 66, 66), // Set the label text color to grey
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Theme(
                data: ThemeData(
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Adjust the value to change the border radius
                      borderSide: const BorderSide(
                        color: Colors.black, // Set the border color to black
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Adjust the value to change the border radius
                      borderSide: const BorderSide(
                        color: Colors
                            .black, // Set the border highlight color to black
                      ),
                    ),
                  ),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Enter your password',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 66, 66, 66),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Add functionality for "Forgot password?" here
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 66, 66, 66),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for "Continue" button here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 66, 66,
                      66), // Set the button background color to grey
                ),
                child: const Text('Continue'),
              ),
            ],
            if (showEmailOrUsernameInputs) ...[
              Theme(
                data: ThemeData(
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Adjust the value to change the border radius
                      borderSide: const BorderSide(
                        color: Colors.black, // Set the border color to black
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Adjust the value to change the border radius
                      borderSide: const BorderSide(
                        color: Colors
                            .black, // Set the border highlight color to black
                      ),
                    ),
                  ),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Enter your Email or Username',
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 66, 66, 66),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Adjust the value to change the border radius
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Theme(
                data: ThemeData(
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Adjust the value to change the border radius
                      borderSide: const BorderSide(
                        color: Colors.black, // Set the border color to black
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Adjust the value to change the border radius
                      borderSide: const BorderSide(
                        color: Colors
                            .black, // Set the border highlight color to black
                      ),
                    ),
                  ),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Enter your password',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 66, 66, 66),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Add functionality for "Forgot password?" here
                },
                style: TextButton.styleFrom(),
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 66, 66, 66),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for "Continue" button here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 66, 66, 66), // Set the button color to grey
                ),
                child: const Text('Continue'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
