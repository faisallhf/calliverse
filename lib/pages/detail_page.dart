import 'package:calliverse/pages/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:themeProvider.isDarkMode ? Color(0xff020520) : Colors.white ,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 86,
        automaticallyImplyLeading: false,
        backgroundColor: themeProvider.isDarkMode ? Color(0xff020520) : Colors.white ,
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
                color: themeProvider.isDarkMode ? Colors.white : Color(0xff0f1828),
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
              color:  themeProvider.isDarkMode ? Colors.white : Colors.black,
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
                buildMessage("Hey!", true,themeProvider),
                buildMessage("Hey, how are you?", false,themeProvider),
                buildMessage("I'm good, thanks!", true,themeProvider),
                buildMessage("Do you have any plans for the weekend?", true,themeProvider),
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
                buildMessage("Not really. What about you?", false,themeProvider),
                buildMessage("I'm going hiking with friends.", true,themeProvider),
                buildMessage("That sounds fun!", false,themeProvider),
                buildMessage("Yeah, I'm looking forward to it.", true,themeProvider),
                buildMessage("Great! Have a good time.", false,themeProvider),
              ],
            ),
          ),
          BottomAppBar(
            color:  themeProvider.isDarkMode ? Color(0xff020520) : Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 16, right: 8, bottom: 8),
                    decoration: BoxDecoration(
                      color:themeProvider.isDarkMode?Color(0xff3E3E6766).withOpacity(0.4): Color(0xffF7F7FC3).withOpacity(0.2),
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
                                fillColor: Colors.white,
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

  Widget buildMessage(String text, bool isMe, dynamic themeProvider) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : themeProvider.isDarkMode
              ? Color(0xff3E3E6766).withOpacity(0.4)
              : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isMe ? 20 : 0),
            topRight: Radius.circular(isMe ? 0 : 20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: isMe ? Colors.white :themeProvider.isDarkMode?Color(0xffFFFFFF): Color(0xff1B2B48)),
        ),
      ),
    );
  }

 Widget buildImageMessage(String imagePath) {
  return Consumer<ThemeProvider>(
    builder: (context, themeProvider, child) {
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: themeProvider.isDarkMode
              ? Color(0xff3E3E6766).withOpacity(0.4)
              : Colors.grey[300],
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
            Text('Look at how chocho sleeps in my arms!',
            style: TextStyle(color: themeProvider.isDarkMode?Colors.white:Color(0xff0F1828),fontFamily: 'Mulish',fontSize: 14,fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 5),
            Text(
              '16.46',
              style: TextStyle(color: Color(0xffADB5BD),fontFamily: 'Lato',fontSize: 10,fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );
    },
  );
}}