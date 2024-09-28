
import 'package:flutter/material.dart';

class MeetingDetailsScreen extends StatelessWidget {
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
          'Meetings Title',
          style: TextStyle(
            color: Color(0xff0f1828),
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '17 Feb 2025 at 08:00pm',
              style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF095DEC),
              ),
            ),
            SizedBox(height: 10), // Added space between elements
            Container(
              width: double.infinity,
              alignment: Alignment.topCenter,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget leo in elit faucibus pretium vel eget tortor. Integer feugiat sagittis quam non vehicula. Sed facilisis enim a consectetur convallis. Integer feugiat quam porta eros tempor, non sollicitudin diam fringilla. Fusce eleifend magna sed facilisis commodo.',
                style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(113, 113, 114, 1),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 20),

            // Invite Link Label and Field
            Text(
              'Invite Link',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5), // Small space between label and input field
            Container(
              width: double.infinity, // Align with the width as per your image
              height: 50, // Adjust height as necessary
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Color(0xffF7F7FC), // Background color
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border:
                            InputBorder.none, // Completely removes the border
                        focusedBorder:
                            InputBorder.none, // Removes the focused outline
                        enabledBorder:
                            InputBorder.none, // Removes the enabled border
                        errorBorder:
                            InputBorder.none, // Removes the error border
                        disabledBorder:
                            InputBorder.none, // Removes the disabled border
                        hintText: 'example.com/abcd123',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(173, 181, 189, 1),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.copy, color: Color(0xFF095DEC)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Invite Code Label and Field
            Text(
              'Invite Code',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5), // Small space between label and input field
            Container(
              width: double.infinity, // Align with the width as per your image
              height: 50, // Adjust height as necessary
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Color(0xffF7F7FC), // Background color
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border:
                            InputBorder.none, // Completely removes the border
                        focusedBorder:
                            InputBorder.none, // Removes the focused outline
                        enabledBorder:
                            InputBorder.none, // Removes the enabled border
                        errorBorder:
                            InputBorder.none, // Removes the error border
                        disabledBorder:
                            InputBorder.none, // Removes the disabled border
                        hintText: 'example.com/abcd123',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(173, 181, 189, 1),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.copy, color: Color(0xFF095DEC)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),

            // Rounded Elevated Button
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
                    'Invite Friend',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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