import 'package:flutter/material.dart';
import 'package:sign_in_page_firebase_meetup/sign_in_page.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() => RegisterState();
}


class RegisterState extends State<Register> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    // Email validation logic
    if (value == null || value.isEmpty || !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
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
  String? _validateName(String? value) {
    // Email validation logic
    if (value == null || value.isEmpty || !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }
  String? _validateUserName(String? value) {
    // Email validation logic
    if (value == null || value.isEmpty || !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
      return 'Please enter a valid email address';
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
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
            keyboardType: TextInputType.emailAddress,
            validator: _validateName,
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _userNameController,
            decoration: InputDecoration(labelText: 'UserName'),
            keyboardType: TextInputType.emailAddress,
            validator: _validateUserName,
          ),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
              },
              child: Text('Forgot Password?',style: TextStyle(color:Colors.blue),),

            ),),
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
                'Register',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );

  }
}