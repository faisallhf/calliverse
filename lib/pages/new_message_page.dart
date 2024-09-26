import 'package:flutter/material.dart';
import 'package:calliverse/pages/add_contact.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Message'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 1, // +1 for the "Add New Contact" option
        itemBuilder: (context, index) {
          if (index == 0) {
            // The "Add New Contact" option
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.person_add, color: Colors.white),
              ),
              title: Text("Add New Contact"),
              onTap: () {
                // Navigate to the "Add New Contact" screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddContact()),
                );
              },
            );
          } else {
            // Contacts list
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(contacts[index - 1]['image']!),
                radius: 30,
              ),
              title: Text(contacts[index - 1]['name']!),
              onTap: () {
                // Handle contact selection
              },
            );
          }
        },
      ),
    );
  }
}
