import 'package:calliverse/pages/ThemeProvider.dart';
import 'package:calliverse/pages/otp_verification_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class PhoneSignupPage extends StatefulWidget {
  const PhoneSignupPage({super.key});

  @override
  State<PhoneSignupPage> createState() => _PhoneSignupPageState();
}

class _PhoneSignupPageState extends State<PhoneSignupPage> {
  // final TextEditingController _phoneController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _confirmPasswordController =
  //     TextEditingController();

  // String? _passwordError;
  // String? _confirmPasswordError;

  // bool _validateInputs() {
  //   setState(() {
  //     _passwordError = null;
  //     _confirmPasswordError = null;

  //     // Password validation
  //     if (_passwordController.text.isEmpty) {
  //       _passwordError = 'Please enter your password';
  //     } else if (_passwordController.text.length < 8) {
  //       _passwordError = 'Password must be at least 8 characters long';
  //     } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
  //         .hasMatch(_passwordController.text)) {
  //       _passwordError = 'Password must contain at least one special character';
  //     }

  //     // Confirm password validation
  //     if (_confirmPasswordController.text.isEmpty) {
  //       _confirmPasswordError = 'Please confirm your password';
  //     } else if (_confirmPasswordController.text != _passwordController.text) {
  //       _confirmPasswordError = 'Passwords do not match';
  //     }
  //   });

  //   return _passwordError == null && _confirmPasswordError == null;
  // }

  // void _onContinue() {
  //   if (_validateInputs()) {
  //     context.push('/otpverification_page/Message/${_phoneController.text}');
  //   }
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
          icon:  Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 18,
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            context.pushNamed('connection_page');
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30,),
            child: Text(
              "Sign up with Phone Number",
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
              "Please create your account using your \nphone number.",
              textAlign: TextAlign.center,
              style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Mulish",
                    color: themeProvider.isDarkMode?Color(0xffFFFFFF):Color(0xff0F1828)),
             ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(20),
            child: IntlPhoneField(
      decoration: InputDecoration(
        hintText: 'Phone Number',
        hintStyle: TextStyle(
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w600,
                            color:themeProvider.isDarkMode?Color(0xffADB5BD): Color(0xffADB5BD),
                            fontSize: 14,
                          ) ,
        labelStyle: TextStyle(color:themeProvider.isDarkMode ?Colors.white : Colors.grey),
        filled: true,
        fillColor: themeProvider.isDarkMode ? Color(0xff3E3E6766).withOpacity(0.4) : Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide.none,
        ),
         counterText: '',
      ),
      initialCountryCode: 'US',
      style: TextStyle(color: themeProvider.isDarkMode ?Colors.white : Colors.grey), // Default set to USA
      onChanged: (phone) {
        print(phone.completeNumber); // You can use this number
      },
    ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
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
          ),
          // if (_passwordError != null)
          //   Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //     child: Text(
          //       _passwordError ?? '',
          //       style: TextStyle(color: Colors.red, fontSize: 12),
          //     ),
          //   ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              // controller: _confirmPasswordController,
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
          ),
          // if (_confirmPasswordError != null)
          //   Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //     child: Text(
          //       _confirmPasswordError ?? '',
          //       style: TextStyle(color: Colors.red, fontSize: 12),
          //     ),
          //   ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              // onPressed: _onContinue,
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
          ),
        ],
      ),
    );
  }
}
