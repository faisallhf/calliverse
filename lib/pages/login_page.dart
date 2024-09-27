import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;

  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email or phone';
    }
    // You can add additional validation if you want to separate email and phone logic
    return null;
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  void _onSubmit() {
    setState(() {
      _emailError = _validateEmail(_emailController.text.trim());
      _passwordError = _validatePassword(_passwordController.text.trim());
    });

    if (_emailError == null && _passwordError == null) {
      context.pushNamed('subscriptionPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            context.goNamed('connection_page');
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Image.asset(
              "assets/images/logo.png",
              height: 180,
            ),
          ),
          Text(
            "Welcome Back",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "Mulish",
            ),
          ),
          SizedBox(height: 10),
          Text("Login to Continue"),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Enter your email or phone",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: TextStyle(
                      color: Color(0xffADB5BD),
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: Color(0xFFF7F7FC),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    errorText: _emailError, // Show email validation error
                    errorStyle:
                        TextStyle(color: Colors.red), // Error text in red
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: TextStyle(
                      color: Color(0xffADB5BD),
                      fontSize: 14,
                    ),
                    fillColor: Color(0xFFF7F7FC),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    errorText: _passwordError, // Show password validation error
                    errorStyle:
                        TextStyle(color: Colors.red), // Error text in red
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _onSubmit();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0081FF),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFF7F7FC),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
