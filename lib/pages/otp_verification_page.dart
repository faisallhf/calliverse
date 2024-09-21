import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

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
      context.goNamed('profileAccountPage');
    } else {
      // Show an error message if OTP is invalid
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Invalid OTP. Please try again.')),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            context.goNamed('emailsignupPage');
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
              height: 200,
            ),
          ),
          Text(
            "Enter Code",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "Mulish",
            ),
          ),
          SizedBox(height: 10),
          Text(
            "We have sent you a ${widget.typeofVerification} with the \ncode to ${widget.data}",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          Pinput(
            length: 4,
            controller: _otpController,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration?.copyWith(
                    border: Border.all(color: Colors.transparent),
                  ) ??
                  BoxDecoration(
                    color: Color(0xFFEDEDED),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.transparent),
                  ),
            ),
            onCompleted: (pin) =>
                _submitOtp(), // Automatically submit when OTP is completed
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              // Logic for resending the OTP goes here
            },
            child: Text(
              "Resend Code",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "Mulish",
                color: Color(0xFF095DEC),
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
