import 'package:calliverse/pages/ThemeProvider.dart';
import 'package:calliverse/pages/connection_page.dart';
import 'package:calliverse/pages/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Ensure this is the path to your ThemeProvider

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Color(0xff020520) : Colors.white,
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
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: themeProvider.isDarkMode ? Colors.white : Color(0xff0f1828),
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Circular Avatar
              Center(
                child: CircleAvatar(
                  backgroundColor: themeProvider.isDarkMode?Colors.transparent:Colors.transparent,
                  radius: 50,
                  backgroundImage: const AssetImage('assets/images/image4.png'),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Danny Hopkins',
                style: TextStyle(
                  color:themeProvider.isDarkMode ? Colors.white : Color(0xff0f1828) ,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '+1234567890',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color:themeProvider.isDarkMode ? Colors.white : Color(0xff888888),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Experienced designer, shaping intuitive \ninterfaces and seamless user journeys',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color:themeProvider.isDarkMode ? Colors.white : Color(0xff888888),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Profile options in a container with row layout
              OptionTile(
                icon: Icons.person_outline_outlined,
                text: 'Edit Profile',
                textColor: themeProvider.isDarkMode?Colors.white:Colors.black,
                iconColor:themeProvider.isDarkMode?Colors.white:Colors.black ,
                 trailing: Icon(Icons.arrow_forward_ios, size: 16, color: themeProvider.isDarkMode ? Colors.white : Colors.black),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfileScreen()),
                  );
                },
              ),
              const SizedBox(height: 10),
              OptionTile(
                icon: Icons.translate_outlined,
                text: 'Translation Language',
                 textColor: themeProvider.isDarkMode?Colors.white:Colors.black,
                iconColor:themeProvider.isDarkMode?Colors.white:Colors.black ,
                trailing: Row(
                  children: [
                    const Text(
                      'Eng (US)',
                      style: TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                    const SizedBox(width: 9),
                    Icon(Icons.arrow_forward_ios, size: 16,color: themeProvider.isDarkMode?Colors.white:Colors.black ,),
                  ],
                ),
                onTap: () {},
              ),
              OptionTile(
                icon: Icons.notifications_outlined,
                text: 'Notifications',
                 textColor: themeProvider.isDarkMode?Colors.white:Colors.black,
                iconColor:themeProvider.isDarkMode?Colors.white:Colors.black ,
                trailing: Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: false, // Replace with your notification state variable
                    onChanged: (value) {
                   
                    },
                    activeColor: Colors.blue,
                    inactiveThumbColor: Colors.grey,
                    activeTrackColor: Colors.grey[300],
                    inactiveTrackColor: Colors.grey[300],
                  ),
                ),
                onTap: () {},
              ),
              const SizedBox(height: 10),
              OptionTile(
                icon: Icons.download_rounded,
                text: 'Download Chat',
                 textColor: themeProvider.isDarkMode?Colors.white:Colors.black,
                iconColor:themeProvider.isDarkMode?Colors.white:Colors.black ,
                 trailing: Icon(Icons.arrow_forward_ios, size: 16, color: themeProvider.isDarkMode ? Colors.white : Colors.black),
                onTap: () {},
              ),
              const SizedBox(height: 10),
              OptionTile(
                icon: Icons.dark_mode_outlined,
                text: 'Dark Mode',
                 textColor: themeProvider.isDarkMode?Colors.white:Colors.black,
                iconColor:themeProvider.isDarkMode?Colors.white:Colors.black ,
                trailing: Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    },
                    activeColor: Colors.blue,
                    inactiveThumbColor: Colors.grey,
                    activeTrackColor: Colors.grey[300],
                    inactiveTrackColor: Colors.grey[300],
                  ),
                ),
                onTap: () {},
              ),
              const SizedBox(height: 10),
              OptionTile(
                icon: Icons.logout_rounded,
                text: 'Logout',
                 textColor: themeProvider.isDarkMode?Colors.white:Colors.black,
                iconColor:themeProvider.isDarkMode?Colors.white:Colors.black ,
                 trailing: Icon(Icons.arrow_forward_ios, size: 16, color: themeProvider.isDarkMode ? Colors.white : Colors.black),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>ConnectionPage()));
                },
              ),
              const SizedBox(height: 10),
              OptionTile(
                icon: Icons.delete_outline_outlined,
                text: 'Delete Account',
                textColor: Colors.red,
                iconColor: Colors.red,
                 trailing: Icon(Icons.arrow_forward_ios, size: 16, color: themeProvider.isDarkMode ? Colors.white : Colors.black),
                onTap: () {},
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget? trailing;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? iconColor;

   OptionTile({
    super.key,
    required this.icon,
    required this.text,
    this.trailing,
    required this.onTap,
    this.textColor = Colors.black,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: iconColor),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 14, color: textColor),
                  ),
                ),
                trailing ??  Icon(Icons.arrow_forward_ios, size: 16,),
              ],
            ),
             Divider(
              thickness: 0.5,
              color:themeProvider.isDarkMode?Colors.transparent: Color(0xffDDDDDD),
            ),
          ],
        ),
      ),
    );
  }
}
