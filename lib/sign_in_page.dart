import 'package:flutter/material.dart';
import 'package:sign_in_page_firebase_meetup/register.dart';

import 'forgot_password_page.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                  top: 120.0, left: 16.0, right: 16.0, bottom: 8.0),
              // Add padding as needed
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign In ',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            // SizedBox(height: 05),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text("Don't have an account?"),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                      }, child: Text('Register')),
                    ],
                  ),
                  // child: TextButton(onPressed: (){
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                  // }, child: Text('Register')),

                  // child: RichText(
                  //   text: TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         text: 'Don\'t have an account? ',
                  //         style: TextStyle(
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.normal,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ),

              ],
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SignInForm(),
            ),
          ],
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    // Email validation logic
    if (value == null ||
        value.isEmpty ||
        !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
            .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    // Password validation logic
    if (value == null || value.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 10),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: _validateEmail,
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: _validatePassword,
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen()));
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 500,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                side: MaterialStateProperty.all(BorderSide(color: Colors.grey)),
              ),
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  // If validations pass, you can navigate to the next screen
                }
              },
              child: Text(
                'Sign In',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
