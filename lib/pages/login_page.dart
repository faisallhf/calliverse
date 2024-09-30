import 'package:calliverse/pages/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  void _onSubmit() {
    context.pushNamed('subscriptionPage');
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
        backgroundColor:themeProvider.isDarkMode ? Color(0xff020520) : Colors.white ,
        leadingWidth: 40,
        titleSpacing: 0,
        centerTitle: false,
        leading: IconButton(
          icon:  Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 18,
            color:  themeProvider.isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            context.pushNamed('connection_page');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              fit: BoxFit.fill,
              height: 190,
              themeProvider.isDarkMode 
                ? "assets/images/logo.png" // Dark mode image
                : "assets/images/logo_light.png",)
                ,
           
            Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: "Mulish",
                color:themeProvider.isDarkMode?Colors.white:Color(0xff0F1828) 
              ),
            ),
            SizedBox(height: 10),
            Text("Login to Continue",
            style: TextStyle(color: themeProvider.isDarkMode?Colors.white:Color(0xff0F1828),
            fontFamily: 'Mulish',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            ),),
            SizedBox(height: 20),
            Column(
              children: [
                TextField(
                  
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Enter your email or phone",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: TextStyle(
                      color:themeProvider.isDarkMode?Color(0xffADB5BD): Color(0xffADB5BD),
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor:themeProvider.isDarkMode?Color(0xff3E3E6766).withOpacity(0.4): Colors.grey[300],
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                     // Error text in red
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  // controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: TextStyle(
                      color:themeProvider.isDarkMode?Color(0xffADB5BD): Color(0xffADB5BD),
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor:themeProvider.isDarkMode?Color(0xff3E3E6766).withOpacity(0.4): Colors.grey[300],
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                     // Error text in red
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                
                  onPressed: () {
                    _onSubmit();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:themeProvider.isDarkMode?Color(0xFF095DEC): Color(0xFF095DEC),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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
