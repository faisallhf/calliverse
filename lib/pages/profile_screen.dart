import 'package:calliverse/pages/edit_profile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false; // State to manage dark mode toggle
  bool isNotificationsEnabled = true; // State to manage notifications toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 56,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leadingWidth: 40,
        titleSpacing: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 18,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xff0f1828),
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Circular Avatar
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/image4.png'),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Danny Hopkins',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '+1234567890',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff888888),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Experienced designer, shaping intuitive \ninterfaces and seamless user journeys',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff888888),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Profile options in a container with row layout
              OptionTile(
                icon: Icons.person_outline_outlined,
                text: 'Edit Profile',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProfileScreen()),
                  );
                },
              ),
              const SizedBox(height: 10),

              OptionTile(
                icon: Icons.translate_outlined,
                text: 'Translation Language',
                trailing: const Row(
                  children: [
                    Text(
                      'Eng (US)',
                      style: TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
                onTap: () {},
              ),
              // const SizedBox(height: 10),
              OptionTile(
                icon: Icons.notifications_outlined,
                text: 'Notifications',
                trailing: Transform.scale(
                  scale: 0.8, // Reduce the size of the switch
                  child: Switch(
                    value: isNotificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        isNotificationsEnabled = value;
                      });
                    },
                    activeColor: Colors.blue, // Thumb color when active
                    inactiveThumbColor:
                        Colors.grey, // Thumb color when inactive
                    activeTrackColor:
                        Colors.grey[300], // Track color when active
                    inactiveTrackColor:
                        Colors.grey[300], // Track color when inactive
                  ),
                ),
                onTap: () {},
              ),
              const SizedBox(height: 10),
              OptionTile(
                icon: Icons.download_rounded,
                text: 'Download Chat',
                onTap: () {},
              ),

              // const SizedBox(height: 10),

              OptionTile(
                icon: Icons.dark_mode_outlined,
                text: 'Dark Mode',
                trailing: Transform.scale(
                  scale: 0.8, // Reduce the size of the switch
                  child: Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value;
                      });
                    },
                    activeColor: Colors.blue, // Thumb color when active
                    inactiveThumbColor:
                        Colors.grey, // Thumb color when inactive
                    activeTrackColor:
                        Colors.grey[300], // Track color when active
                    inactiveTrackColor:
                        Colors.grey[300], // Track color when inactive
                  ),
                ),
                onTap: () {},
              ),
              const SizedBox(height: 10),
              OptionTile(
                icon: Icons.logout_rounded,
                text: 'Logout',
                onTap: () {},
              ),
              const SizedBox(height: 10),

              OptionTile(
                icon: Icons.delete_outline_outlined,
                text: 'Delete Account',
                textColor: Colors.red, // Set text color to red
                iconColor: Colors.red, // Set icon color to red
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
  final Widget? trailing; // For adding widgets like Switch or Icons
  final VoidCallback onTap;
  final Color? textColor; // Parameter for text color
  final Color? iconColor; // Parameter for icon color

  const OptionTile({
    super.key,
    required this.icon,
    required this.text,
    this.trailing,
    required this.onTap,
    this.textColor = Colors.black, // Default text color is black
    this.iconColor = Colors.black, // Default icon color is black
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0), // Padding on both sides
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: iconColor), // Apply iconColor here
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 14, color: textColor), // Apply textColor here
                  ),
                ),
                trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Color(0xffDDDDDD), // Line color
            ),
          ],
        ),
      ),
    );
  }
}
