import 'package:calliverse/pages/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart'; // Dependency for international phone number

class AddContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
       backgroundColor:themeProvider.isDarkMode ? Color(0xff020520) : Colors.white ,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 96,
        automaticallyImplyLeading: false,
        backgroundColor:themeProvider.isDarkMode ? Color(0xff020520) : Colors.white ,
        leadingWidth: 40,
        titleSpacing: 0,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 18,
             color:  themeProvider.isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button action
          },
        ),
        title: Text(
          'New Contact',
          style: TextStyle(
            color: themeProvider.isDarkMode ? Colors.white : Color(0xff0f1828),
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Name Field
            TextField(
              decoration: InputDecoration(
                hintText: 'First Name (Required)',
                labelStyle: TextStyle(color:themeProvider.isDarkMode ?Colors.white : Colors.grey),
                filled: true,
                fillColor: themeProvider.isDarkMode ? Color(0xff3E3E6766).withOpacity(0.4) : Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Last Name Field
            TextField(
              decoration: InputDecoration(
                hintText: 'Last Name (Optional)',
                labelStyle: TextStyle(color:themeProvider.isDarkMode ?Colors.white : Colors.grey),
                filled: true,
                fillColor: themeProvider.isDarkMode ? Color(0xff3E3E6766).withOpacity(0.4) : Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Phone Number Field with IntlPhoneField
            IntlPhoneField(
  decoration: InputDecoration(
    hintText: 'Phone Number', 
    labelStyle: TextStyle(color:themeProvider.isDarkMode ?Colors.white : Colors.grey),// Replaces labelText with hintText
    filled: true,
    fillColor:  themeProvider.isDarkMode ? Color(0xff3E3E6766).withOpacity(0.4) : Colors.grey[300],
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
),


            SizedBox(height: 90),

            // Save Button
            Center(
              child: SizedBox(
                width: double.infinity, // Full width as per the input fields
                height: 50, // Adjust height
                child: ElevatedButton(
                  onPressed: () {
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
}
