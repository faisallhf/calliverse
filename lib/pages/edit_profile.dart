import 'package:calliverse/pages/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Accessing the ThemeProvider here
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
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: themeProvider.isDarkMode ? Colors.white : Color(0xff0f1828),
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Avatar with camera icon
            Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/image4.png'), // Placeholder image
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.camera_alt, size: 18, color: Colors.white),
                      onPressed: () {
                        // Handle camera action
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Text Fields for Profile Details
            _buildTextField('Name', nameController, themeProvider),
            _buildTextField('Country', countryController, themeProvider),
            _buildPhoneNumberField(themeProvider), // Updated phone field
            _buildTextField('Bio', bioController, themeProvider, maxLines: 3),
            _buildTextField('Website Link', websiteController, themeProvider, keyboardType: TextInputType.url),
            const SizedBox(height: 50),
            // Save Button
            Center(
              child: SizedBox(
                width: double.infinity, // Full width as per the input fields
                height: 50, // Adjust height
                child: ElevatedButton(
                  onPressed: () {
                    // Handle save action (e.g., save user data)
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF095DEC), // Background color
                    foregroundColor: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded edges
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a text field with no borders and grey color
  Widget _buildTextField(String labelText, TextEditingController controller, ThemeProvider themeProvider, 
      {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        height: 45, // Set the height for the container
        decoration: BoxDecoration(
          color: themeProvider.isDarkMode ? Color(0xff3E3E6766).withOpacity(0.4) : Colors.grey[300],
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: labelText,
            hintStyle: TextStyle(color:themeProvider.isDarkMode ?Colors.white : Colors.grey),
            border: InputBorder.none, // No border
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          onChanged: (text) {
            setState(() {}); // To refresh the state
          },
        ),
      ),
    );
  }

  // Helper method to build the phone number field with country code and flag
  Widget _buildPhoneNumberField(ThemeProvider themeProvider) {
    return IntlPhoneField(
      decoration: InputDecoration(
        hintText: 'Phone Number',
        labelStyle: TextStyle(color:themeProvider.isDarkMode ?Colors.white : Colors.grey),
        filled: true,
        fillColor: themeProvider.isDarkMode ? Color(0xff3E3E6766).withOpacity(0.4) : Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide.none,
        ),
      ),
      initialCountryCode: 'US',
      style: TextStyle(color: themeProvider.isDarkMode ?Colors.white : Colors.grey), // Default set to USA
      onChanged: (phone) {
        print(phone.completeNumber); // You can use this number
      },
    );
  }
}
