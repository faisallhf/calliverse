import 'package:calliverse/pages/ThemeProvider.dart';
import 'package:calliverse/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileAccountPage extends StatefulWidget {
  const ProfileAccountPage({super.key});

  @override
  State<ProfileAccountPage> createState() => _ProfileAccountPageState();
}

class _ProfileAccountPageState extends State<ProfileAccountPage> {
  // final TextEditingController _firstNameController = TextEditingController();
  // final TextEditingController _lastNameController = TextEditingController();
  // final TextEditingController _bioController = TextEditingController();
  // final TextEditingController _websiteController = TextEditingController();

  // void _saveProfile() {
  //   String firstName = _firstNameController.text.trim();
  //   String lastName = _lastNameController.text.trim();

    // // Simple validation
    // if (firstName.isEmpty) {
    //   _showErrorDialog('First Name cannot be empty');
    //   return;
    // }
    // if (lastName.isEmpty) {
    //   _showErrorDialog('Last Name cannot be empty');
    //   return;
    // }

    // If validation passes, navigate to the next screen
    // context.pushNamed('login_page'); // Replace 'nextScreen' with your route
  // }

  // void _showErrorDialog(String message) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text('Error'),
  //       content: Text(message),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: Text('OK'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
       backgroundColor: themeProvider.isDarkMode ? Color(0xff020520) : Colors.white,
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
        ),
        title: Text(
          "Your Profile",
         style: TextStyle(
            fontWeight: FontWeight.w500,
            color: themeProvider.isDarkMode ? Colors.white : Color(0xff0f1828),
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor:themeProvider.isDarkMode?Colors.white: Colors.grey[300],
                  radius: 90,
                  child: ImageIcon(
                    AssetImage('assets/images/person_outlined.png'),
                    size: 56.0,
                    color:themeProvider.isDarkMode?Colors.black: Colors.black,
                  ),
                ),
                Positioned(
                  bottom: 32,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor:themeProvider.isDarkMode?Color(0xff095DEC): Colors.black,
                    radius: 11,
                    child: Icon(
                      Icons.add,
                      color:themeProvider.isDarkMode?Colors.white: Colors.white,
                      size: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // First Name Field
                TextField(
                  // controller: _firstNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "First Name",
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
                // Last Name Field
                TextField(
                  // controller: _lastNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Last Name",
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
                // Bio Field (Optional)
                TextField(
                  // controller: _bioController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Bio (Optional)",
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
                // Website Link Field (Optional)
                TextField(
                  // controller: _websiteController,
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    labelText: "Website Link (Optional)",
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
                SizedBox(height: 60),
                ElevatedButton(
                  // onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:themeProvider.isDarkMode?Color(0xFF095DEC) :Color(0xFF095DEC),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () { 
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                   },
                  child: Text(
                    "Save",
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
          ),
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   _firstNameController.dispose();
  //   _lastNameController.dispose();
  //   _bioController.dispose();
  //   _websiteController.dispose();
  //   super.dispose();
  // }
}
