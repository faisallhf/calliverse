import 'package:calliverse/pages/ThemeProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpVerificationPage extends StatefulWidget {
  final String typeofVerification;
  final String data;
  final String verificationId;

  const OtpVerificationPage({
    Key? key,
    required this.typeofVerification,
    required this.data,
    required this.verificationId,
  }) : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final TextEditingController _otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationId;

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
      border: Border.all(color: Colors.transparent),
    ),
  );

  @override
  void initState() {
    super.initState();
    _verificationId = widget.verificationId;
  }

  Future<void> _resendOtp() async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: widget.data,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          context.pushNamed('profileAccountPage');
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Verification failed: ${e.message}")),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationId = verificationId;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("OTP code resent")),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            _verificationId = verificationId;
          });
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error resending OTP: ${e.toString()}")),
      );
    }
  }

  Future<void> _submitOtp() async {
    if (_verificationId != null) {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId!,
          smsCode: _otpController.text,
        );
        await _auth.signInWithCredential(credential);
        context.pushNamed('profileAccountPage');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid OTP. Try again!")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:
          themeProvider.isDarkMode ? Color(0xff020520) : Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 56,
        automaticallyImplyLeading: false,
        backgroundColor:
            themeProvider.isDarkMode ? Color(0xff020520) : Colors.white,
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
            if (widget.typeofVerification == 'Email') {
              context.pushNamed('emailsignupPage');
            } else {
              context.pushNamed('phonesignupPage');
            }
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Image.asset(
              themeProvider.isDarkMode
                  ? "assets/images/logo.png"
                  : "assets/images/logo_light.png",
            ),
            height: 200,
          ),
          Text(
            "Enter Code",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: "Mulish",
                color: themeProvider.isDarkMode
                    ? Color(0xffffffff)
                    : Color(0xff0F1828)),
          ),
          SizedBox(height: 10),
          Text(
            "We have sent you a ${widget.typeofVerification} with the \ncode to ${widget.data}",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "Mulish",
                color: themeProvider.isDarkMode
                    ? Color(0xffffffff)
                    : Color(0xff0F1828)),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          Pinput(
            length: 6,
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
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: themeProvider.isDarkMode
                          ? Color(0xff3E3E6766).withOpacity(0.4)
                          : Colors.white,
                    ),
                  ),
            ),
            onCompleted: (pin) => _submitOtp(),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: _resendOtp,
            child: Text(
              "Resend Code",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: "Mulish",
                color: themeProvider.isDarkMode
                    ? Color(0xFF095DEC)
                    : Color(0xFF095DEC),
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
