import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> chatDetails;

  DetailPage({required this.chatDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chatDetails["name"], style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                      "assets/images/Ellipse 1.png"), // Replace with correct path for Ellipse 1.png
                  radius: 40,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chatDetails["name"],
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Online",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                buildImageMessage(
                    "assets/images/cat.png"), // Replace with correct path for cat.png
                buildMessage("Hey!", true),
                buildMessage("Hey, how are you?", false),
                buildMessage("I'm good, thanks!", true),
                buildMessage("Do you have any plans for the weekend?", true),
                buildMessage("Not really. What about you?", false),
                buildMessage("I'm going hiking with friends.", true),
                buildMessage("That sounds fun!", false),
                buildMessage("Yeah, I'm looking forward to it.", true),
                buildMessage("Great! Have a good time.", false),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Implement send message functionality
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMessage(String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isMe ? 20 : 0),
            topRight: Radius.circular(isMe ? 0 : 20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: isMe ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget buildImageMessage(String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
                "assets/images/Ellipse 1.png"), // Replace with correct path for Ellipse 1.png
            radius: 25,
          ),
          SizedBox(width: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 200, // Adjust as per your design
              height: 200, // Adjust as per your design
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
