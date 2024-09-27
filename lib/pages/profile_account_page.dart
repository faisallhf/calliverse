import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileAccountPage extends StatefulWidget {
  const ProfileAccountPage({super.key});

  @override
  State<ProfileAccountPage> createState() => _ProfileAccountPageState();
}

class _ProfileAccountPageState extends State<ProfileAccountPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();

  void _saveProfile() {
    String firstName = _firstNameController.text.trim();
    String lastName = _lastNameController.text.trim();

    // Simple validation
    if (firstName.isEmpty) {
      _showErrorDialog('First Name cannot be empty');
      return;
    }
    if (lastName.isEmpty) {
      _showErrorDialog('Last Name cannot be empty');
      return;
    }

    // If validation passes, navigate to the next screen
    context.goNamed('loginPage'); // Replace 'nextScreen' with your route
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text("Your Profile"),
        leading: GestureDetector(
          onTap: () {
            context.goNamed('otpVerificationPage');
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 30),
            child: Image.asset("assets/images/profile.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // First Name Field
                TextField(
                  controller: _firstNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "First Name",
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
                  ),
                ),
                SizedBox(height: 15),
                // Last Name Field
                TextField(
                  controller: _lastNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Last Name",
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
                  ),
                ),
                SizedBox(height: 15),
                // Bio Field (Optional)
                TextField(
                  controller: _bioController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Bio (Optional)",
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
                  ),
                ),
                SizedBox(height: 15),
                // Website Link Field (Optional)
                TextField(
                  controller: _websiteController,
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    labelText: "Website Link (Optional)",
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
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: _saveProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0081FF),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      "Save",
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

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _bioController.dispose();
    _websiteController.dispose();
    super.dispose();
  }
}
