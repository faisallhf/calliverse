import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart'; // Dependency for international phone number

class AddContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 96,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
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
            // Handle back button action
          },
        ),
        title: const Text(
          'New Contact',
          style: TextStyle(
            color: Color(0xff0f1828),
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
                filled: true,
                fillColor: Colors.grey.shade300,
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
                filled: true,
                fillColor: Colors.grey[300],
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
    hintText: 'Phone Number', // Replaces labelText with hintText
    filled: true,
    fillColor: Colors.grey[300],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide.none,
    ),
  ),
  initialCountryCode: 'US', // Default set to USA
  onChanged: (phone) {
    print(phone.completeNumber); // You can use this number
  },
),


            SizedBox(height: 30),

            // Save Button
            Center(
              child: SizedBox(
                width: double.infinity, // Full width as per the input fields
                height: 50, // Adjust height
                child: ElevatedButton(
                  onPressed: () {},
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
