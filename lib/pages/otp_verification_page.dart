import 'package:calliverse/pages/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpVerificationPage extends StatefulWidget {
  final String typeofVerification;
  final String data;
  const OtpVerificationPage(
      {super.key, required this.typeofVerification, required this.data});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  // Controller for capturing OTP input
  final TextEditingController _otpController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 60,
    textStyle: TextStyle(
      fontSize: 30,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
      color: Color(0xFFEDEDED),
      borderRadius: BorderRadius.circular(50),
      border: Border.all(
        color: Colors.transparent,
      ),
    ),
  );

  // Function to handle OTP submission
  void _submitOtp() {
    String enteredOtp = _otpController.text;

    // Simple validation for demo purposes (you can replace it with your backend OTP validation)
    if (enteredOtp.length == 4) {
      // Assuming OTP is valid, navigate to the next page (e.g., profile account page)
      context.pushNamed('profileAccountPage');
    } else {
      // Show an error message if OTP is invalid
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Invalid OTP. Please try again.')),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
     final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:themeProvider.isDarkMode ? Color(0xff020520) : Colors.white ,
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
            context.pushNamed('emailsignupPage');
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Image.asset(
             themeProvider.isDarkMode 
                ? "assets/images/logo.png" // Dark mode image
                : "assets/images/logo_light.png",),
              height: 200,
            ),
          
          Text(
            "Enter Code",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: "Mulish",
              color: themeProvider.isDarkMode?Color(0xffffffff):Color(0xff0F1828)

            ),
          ),
          SizedBox(height: 10),
          Text(
            "We have sent you a ${widget.typeofVerification} with the \ncode to ${widget.data}",
            style: TextStyle(
             fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: "Mulish",
              color: themeProvider.isDarkMode?Color(0xffffffff):Color(0xff0F1828)

            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
         Pinput(
  length: 4,
  controller: _otpController,
  defaultPinTheme: defaultPinTheme,
  focusedPinTheme: defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      border: Border.all(
        color: themeProvider.isDarkMode 
          ? Color(0xff3E3E6766).withOpacity(0.4) 
          : Colors.white,
      ),
    ) ??
    BoxDecoration(
      color: themeProvider.isDarkMode 
        ? Color(0xff3E3E6766).withOpacity(0.4) 
        : Colors.white,
      borderRadius: BorderRadius.circular(50),
      border: Border.all(
        color: themeProvider.isDarkMode 
          ? Color(0xff3E3E6766).withOpacity(0.4) 
          : Colors.white,
      ),
    ),
  ),
  onCompleted: (pin) => _submitOtp(), // Automatically submit when OTP is completed
),

          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              // Logic for resending the OTP goes here
            },
            child: Text(
              "Resend Code",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: "Mulish",
                color:themeProvider.isDarkMode?Color(0xFF095DEC): Color(0xFF095DEC),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
