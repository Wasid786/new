import 'package:flutter/material.dart';
import 'package:stick/signup_by_email.dart';
import 'package:stick/otp.dart';

class SignUpMobile extends StatelessWidget {
  const SignUpMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login With Mobile'),
        backgroundColor: Colors.grey[800],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'how would you like to connect ?',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'sign in using....',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                'assets/mobile.gif',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 40),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'enter mobile number ',
                ),
                style: TextStyle(fontSize: 20),
                keyboardType: TextInputType.numberWithOptions(),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpEmail()),
                  );
                },
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(100, 40)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 66, 66, 66),
                    )),
                child: const Text(
                  'Use Email',
                  style: TextStyle(color: Colors.white),
                ),

                /// color lagana hai yahan
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,

                ///width: double.minPositive,
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100, // Set the desired width for the button
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyVerify()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 66, 66, 66),
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
            ],
          ),
        ),
      ),
    );
  }
}
