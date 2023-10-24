import 'package:flutter/material.dart';
import 'package:sign_in_page_firebase_meetup/sign_in_page.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _newPasswordController,
              decoration: InputDecoration(
                labelText: 'New Password',
                labelStyle: TextStyle(fontSize: 18),
              ),
              obscureText: true,
              onChanged: (_) => checkPasswordMatch(),
            ),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: TextStyle(fontSize: 18),
              ),
              obscureText: true,
              onChanged: (_) => checkPasswordMatch(),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: isButtonEnabled
                  ? () {
// Check if passwords match
                      if (_newPasswordController.text ==
                          _confirmPasswordController.text) {
// Passwords match, navigate to the sign-in screen
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      }
                    }
                  : null, // Disable button if passwords don't match
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void checkPasswordMatch() {
    setState(() {
      if (_newPasswordController.text.length >= 4 &&
          _confirmPasswordController.text.length >= 4) {
        isButtonEnabled =
            _newPasswordController.text == _confirmPasswordController.text;
      } else {
        isButtonEnabled = false;
      }
    });
  }
}
