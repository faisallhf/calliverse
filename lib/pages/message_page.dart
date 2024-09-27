import 'package:calliverse/pages/detail_page.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text("Messages", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
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
                    // Navigate to DetailScreen with specific details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          chatDetails: chats[index],
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewMessagePage(),
            ),
          );
        },
        child: Icon(Icons.edit),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
