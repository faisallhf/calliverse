import 'package:flutter/material.dart';
import 'package:calliverse/pages/detail_page.dart';
import 'package:calliverse/pages/new_message_page.dart';

class MessagePage extends StatelessWidget {
  final List<Map<String, dynamic>> chats = [
    {
      "name": "Pranav Ray",
      "message": "okay sure!!",
      "time": "12:25 PM",
      "read": true,
      "image": "assets/images/Ellipse 1.png"
    },
    {
      "name": "Ayesha Tanwar",
      "message": "See you there!",
      "time": "1:30 PM",
      "read": false,
      "image": "assets/images/Ellipse 1 (1).png"
    },
    {
      "name": "Roshni",
      "message": "Sounds good!",
      "time": "2:45 PM",
      "read": true,
      "image": "assets/images/Ellipse 1 (2).png"
    },
    {
      "name": "Kaushik",
      "message": "Got it!",
      "time": "3:00 PM",
      "read": false,
      "image": "assets/images/Ellipse 1 (3).png"
    },
    {
      "name": "Makenna Press",
      "message": "On my way!",
      "time": "4:15 PM",
      "read": true,
      "image": "assets/images/Ellipse 1 (4).png"
    },
    {
      "name": "Ann George",
      "message": "Sure thing!",
      "time": "5:00 PM",
      "read": false,
      "image": "assets/images/Ellipse 1 (5).png"
    },
    {
      "name": "Adison Baptista",
      "message": "Noted.",
      "time": "6:30 PM",
      "read": true,
      "image": "assets/images/Ellipse 2.png"
    },
  ];

  MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160.0), // Adjust the height as needed
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Text(
              "Messages",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'Mulish',
              ),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Color(0xff095DEC),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 10),
                // Search bar inside AppBar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(chats[index]["image"]),
                    radius: 25,
                  ),
                  title: Text(
                    chats[index]["name"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(chats[index]["message"]),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chats[index]["time"],
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 5),
                      chats[index]["read"]
                          ? Icon(
                              Icons.done_all,
                              size: 16,
                              color: Colors.blue,
                            )
                          : Icon(
                              Icons.done,
                              size: 16,
                              color: Colors.grey,
                            ),
                    ],
                  ),
                  onTap: () {
                    // Navigate to DetailPage with specific user details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          chatDetails: {
                            "name": chats[index]["name"], // User's name
                            "imagePath": chats[index]["image"], // User's image path
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewMessagePage(),
            ),
          );
        },
        child: Icon(
          Icons.edit_outlined,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff095DEC),
      ),
    );
  }
}
