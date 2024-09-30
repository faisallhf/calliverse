import 'package:calliverse/pages/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:themeProvider.isDarkMode ? Color(0xff020520) : Colors.white ,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
             Image.asset(
              themeProvider.isDarkMode 
                ? "assets/images/Illustration.png" // Dark mode image
                : "assets/images/connection_page.png", // Light mode image
              height: 350,
            ),
            Text(
              "Connect easily with your family and friends over countries",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: themeProvider.isDarkMode?Color(0xffFFFFFF):Color(0xff0F1828)
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Terms & Privacy Policy",
              style: TextStyle(
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w600,
                color:themeProvider.isDarkMode?Color(0xffFFFFFF): Color(0xff0F1828),
                fontSize: 14,
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                context.pushNamed("emailsignupPage");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:themeProvider.isDarkMode?Color(0xFF095DEC): Color(0xFF095DEC),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "Continue with email",
                style: TextStyle(
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color:themeProvider.isDarkMode?Color(0xFFF7F7FC): Color(0xFFF7F7FC),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.pushNamed("phonesignupPage");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:themeProvider.isDarkMode?Color(0xffffffff): Color(0xFF020520),
                minimumSize: Size(double.infinity, 50),
              ),
              child:  Text(
                "Continue with phone",
                style: TextStyle(
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color:themeProvider.isDarkMode?Color(0xff095DEC): Color(0xFFF7F7FC),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                context.pushNamed('login_page');
              },
              child:  Text(
                "Login",
                style: TextStyle(
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w600,
                  color:themeProvider.isDarkMode?Color(0xff095DEC): Color(0xff095DEC),
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
