import 'package:calliverse/pages/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:calliverse/pages/add_contact.dart';
import 'package:provider/provider.dart';

class NewMessagePage extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {"name": "Marcus Septimus", "image": "assets/images/n1.png"},
    {"name": "Lindsey Dorwart", "image": "assets/images/n2.png"},
    {"name": "Aspen Geidt", "image": "assets/images/n3.png"},
    {"name": "Alfonso Aminoff", "image": "assets/images/n4.png"},
    {"name": "Angel Carder", "image": "assets/images/n5.png"},
    {"name": "Miracle Dorwart", "image": "assets/images/n6.png"},
    {"name": "Mira Press", "image": "assets/images/n7.png"},
    {"name": "Jakob Herwitz", "image": "assets/images/n8.png"},
    {"name": "Angel Carder", "image": "assets/images/n5.png"},
  ];

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
          'New Messages',
          style: TextStyle(
            color: themeProvider.isDarkMode ? Colors.white : Color(0xff0f1828),
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color:  themeProvider.isDarkMode ? Colors.white : Colors.black,),
            onPressed: () {
              // Search functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: contacts.length + 1, // +1 for the "Add New Contact" option
        itemBuilder: (context, index) {
          return Column(
            children: [
              if (index == 0) ...[
                ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xff095DEC),
                    child: Icon(Icons.person_add_alt_rounded, color: Colors.white),
                  ),
                  title: Text("Add New Contact",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w600,color: themeProvider.isDarkMode?Colors.white:Colors.black),),
                  onTap: () {
                    // Navigate to the "Add New Contact" screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddContact()),
                    );
                  },
                ),
                SizedBox(height: 20),
              ] else ...[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(contacts[index - 1]['image']!),
                    radius: 30,
                  ),
                  title: Text(contacts[index - 1]['name']!,style: TextStyle(fontSize: 15,fontFamily: 'Inter',fontWeight: FontWeight.w700,color: themeProvider.isDarkMode?Colors.white:Colors.black),),
                  onTap: () {
                    // Handle contact selection
                  },
                ),
              ],
              SizedBox(height: 10), // Space between items
            ],
          );
        },
      ),
    );
  }
}
