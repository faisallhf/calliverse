import 'package:calliverse/pages/ThemeProvider.dart';
import 'package:calliverse/pages/otp_verification_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EmailSignupPage extends StatefulWidget {
  const EmailSignupPage({super.key});

  @override
  State<EmailSignupPage> createState() => _EmailSignupPageState();
}

class _EmailSignupPageState extends State<EmailSignupPage> {
  // TextEditingController _emailController = new TextEditingController();
  // TextEditingController _passwordController = new TextEditingController();
  // TextEditingController _confirmpasswordController =
  //     new TextEditingController();

  // String? _emailError;
  // String? _passwordError;
  // String? _confirmPasswordError;

  // String? _validateEmail(String value) {
  //   if (value.isEmpty) {
  //     return 'Please enter your email';
  //   }
  //   if (!value.contains('@')) {
  //     return 'Email must contain "@"';
  //   }
  //   return null;
  // }

  // String? _validatePassword(String value) {
  //   if (value.isEmpty) {
  //     return 'Please enter your password';
  //   }
  //   if (value.length < 8) {
  //     return 'Password must be at least 8 characters long';
  //   }
  //   if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
  //     return 'Password must contain at least one special character';
  //   }
  //   return null;
  // }

  // String? _validateConfirmPassword(String value) {
  //   if (value.isEmpty) {
  //     return 'Please confirm your password';
  //   }
  //   if (value != _passwordController.text) {
  //     return 'Passwords do not match';
  //   }
  //   return null;
  // }

  // void _onSubmit() {
  //   setState(() {
  //     _emailError = _validateEmail(_emailController.text);
  //     _passwordError = _validatePassword(_passwordController.text);
  //     _confirmPasswordError =
  //         _validateConfirmPassword(_confirmpasswordController.text);
  //   });

  //   if (_emailError == null &&
  //       _passwordError == null &&
  //       _confirmPasswordError == null) {
  //     context.push('/otpverification_page/Email/${_emailController.text}');
  //   }
  // }
  // void _onSubmit() {
  //   context.push('/otpverification_page/Email/${_emailController.text}');
  // }

  @override
  Widget build(BuildContext context) {
     final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:themeProvider.isDarkMode ? Color(0xff020520) : Colors.white ,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 56,
        automaticallyImplyLeading: false,
         backgroundColor: themeProvider.isDarkMode ? Color(0xff020520) : Colors.white,
        leadingWidth: 40,
        titleSpacing: 0,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 18,
           color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            context.pushNamed('connection_page');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                "Sign up with Email",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Mulish",
                  color: themeProvider.isDarkMode?Color(0xffFFFFFF):Color(0xff0F1828),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Text(
                "Please create your account using your \nemail.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Mulish",
                    color: themeProvider.isDarkMode?Color(0xffFFFFFF):Color(0xff0F1828)),
              ),
            ),
            SizedBox(height: 50),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      // controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: TextStyle(
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w600,
                            color:themeProvider.isDarkMode?Color(0xffADB5BD): Color(0xffADB5BD),
                            fontSize: 14,
                          ),
                        filled: true,
                        fillColor:themeProvider.isDarkMode?Color(0xff3E3E6766).withOpacity(0.4): Colors.grey[300],
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    // if (_emailError != null)
                    //   Padding(
                    //     padding: const EdgeInsets.only(top: 8.0),
                    //     child: Text(
                    //       _emailError!,
                    //       style: TextStyle(color: Colors.red, fontSize: 12),
                    //     ),
                    //   ),
                    SizedBox(height: 10),
                    TextField(
                      // controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                       labelStyle: TextStyle(
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w600,
                            color:themeProvider.isDarkMode?Color(0xffADB5BD): Color(0xffADB5BD),
                            fontSize: 14,
                          ),
                        filled: true,
                         fillColor:themeProvider.isDarkMode?Color(0xff3E3E6766).withOpacity(0.4): Colors.grey[300],
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                     // if (_passwordError != null)
                    //   Padding(
                    //     padding: const EdgeInsets.only(top: 8.0),
                    //     child: Text(
                    //       _passwordError!,
                    //       style: TextStyle(color: Colors.red, fontSize: 12),
                    //     ),
                    //   ),
                    TextField(
                        // controller: _confirmpasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelStyle: TextStyle(
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w600,
                            color:themeProvider.isDarkMode?Color(0xffADB5BD): Color(0xffADB5BD),
                            fontSize: 14,
                          ),
                          filled: true,
                           fillColor:themeProvider.isDarkMode?Color(0xff3E3E6766).withOpacity(0.4): Colors.grey[300],
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      // if (_confirmPasswordError != null)
                      //   Padding(
                      //     padding: const EdgeInsets.only(top: 8.0),
                      //     child: Text(
                      //       _confirmPasswordError!,
                      //       style: TextStyle(color: Colors.red, fontSize: 12),
                      //     ),
                      //   ),
                  ],
                ),
                
                SizedBox(height: 60),
                ElevatedButton(
                  // onPressed: _onSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:themeProvider.isDarkMode?Color(0xFF095DEC) :Color(0xFF095DEC),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () { 
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpVerificationPage(typeofVerification: 'Email', data: '',)));
                   },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color:themeProvider.isDarkMode?Color(0xFFF7F7FC): Color(0xFFF7F7FC),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
