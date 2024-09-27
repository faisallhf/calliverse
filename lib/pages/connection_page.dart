import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  void goToFutureDataPage() {
    context.goNamed('emailsignup_page');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Image.asset("assets/images/connection_page.png", height: 380),
            Text(
              "Connect easily with your family and friends over countries",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Mulish',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Terms & Privacy Policy",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                context.pushNamed("emailsignupPage");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0081FF),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "Continue with email",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFF7F7FC),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.pushNamed("phonesignupPage");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF020520),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "Continue with phone",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFF7F7FC),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                context.goNamed('loginPage');
              },
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
