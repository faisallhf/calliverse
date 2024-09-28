import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> chatDetails;

  DetailPage({required this.chatDetails});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final TextEditingController _controller = TextEditingController();
  bool _isTextFieldNotEmpty = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isTextFieldNotEmpty = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7FC),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 86,
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
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.chatDetails["imagePath"]), // Use the correct path
              radius: 18,
            ),
            SizedBox(width: 8),
            Text(
              widget.chatDetails["name"],
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff0F1828),
                fontFamily: 'Mulish',
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                buildImageMessage("assets/images/cat.png"),
                buildMessage("Hey!", true),
                buildMessage("Hey, how are you?", false),
                buildMessage("I'm good, thanks!", true),
                buildMessage("Do you have any plans for the weekend?", true),
                SizedBox(height: 9),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color(0xffADB5BD),
                        thickness: 1,
                        endIndent: 12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      child: Text(
                        'Sat, 17/10',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffADB5BD),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Color(0xffADB5BD),
                        thickness: 1,
                        indent: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 9),
                buildMessage("Not really. What about you?", false),
                buildMessage("I'm going hiking with friends.", true),
                buildMessage("That sounds fun!", false),
                buildMessage("Yeah, I'm looking forward to it.", true),
                buildMessage("Great! Have a good time.", false),
              ],
            ),
          ),
          BottomAppBar(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 16, right: 8, bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5),
                      child: Row(
                        children: [
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: IconButton(
                                onPressed: () {
                                  // Handle emoji button action
                                },
                                icon: Icon(
                                  Icons.emoji_emotions_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                hintText: 'Type a message...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Handle attachment action
                            },
                            icon: Icon(Icons.attach_file, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8, right: 8),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      onPressed: () {
                        if (_isTextFieldNotEmpty) {
                          // Handle sending message
                          // You can add your message sending logic here
                        } else {
                          // Handle voice message recording
                        }
                      },
                      icon: Icon(
                        _isTextFieldNotEmpty ? Icons.send : Icons.mic,
                        color: Colors.white,
                      ),
                    ),
                  ),
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
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(top: 8, right: 68, left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          Text('Look at how chocho sleep in my arms!'),
          SizedBox(height: 5),
          Text(
            '16.46',
            style: TextStyle(color: Color(0xffADB5BD)),
          ),
        ],
      ),
    );
  }
}
