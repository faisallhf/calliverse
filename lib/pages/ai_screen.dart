import 'package:flutter/material.dart';

class ChatbotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Juliabot',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xff0f1828),
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.search_outlined, color: Colors.black),
              onPressed: () {
                print('Mute pressed');
              },
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Center image
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/ai_image.png', // Replace with your image
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Welcome to Juliabot',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                      'Ask me anything what\'s are on \nyour mind. Am here to assist you!'),
                  const SizedBox(height: 10),
                  // Suggested questions
                  Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 16), // Horizontal margin
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            // Use MediaQuery to set dynamic width with margins
                            width: MediaQuery.of(context).size.width -
                                48, // 16 margin on each side
                            child: const Center(
                              child: Text(
                                'Explain Quantum Physics',
                                style: TextStyle(color: Color(0xff3E3E3E)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 16), // Horizontal margin
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            // Use MediaQuery to set dynamic width with margins
                            width: MediaQuery.of(context).size.width -
                                48, // 16 margin on each side
                            child: const Center(
                              child: Text(
                                'Write a tweet about global warming',
                                style: TextStyle(color: Color(0xff3E3E3E)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 16), // Horizontal margin
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            // Use MediaQuery to set dynamic width with margins
                            width: MediaQuery.of(context).size.width -
                                48, // 16 margin on each side
                            child: const Center(
                              child: Text(
                                'Write a poem about flower and love',
                                style: TextStyle(color: Color(0xff3E3E3E)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 16), // Horizontal margin
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            // Use MediaQuery to set dynamic width with margins
                            width: MediaQuery.of(context).size.width -
                                48, // 16 margin on each side
                            child: const Center(
                              child: Text(
                                'Write a rap song lyrics about',
                                style: TextStyle(color: Color(0xff3E3E3E)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          // Text field for user input
          BottomAppBar(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 16, right: 3, bottom: 8), // Horizontal margin
                    decoration: BoxDecoration(
                      color: Color(0xffC4C4C433).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: 'Type your message...',
                            border:
                                InputBorder.none, // Remove the default border
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.emoji_emotions_outlined,
                                      color: Colors.white), // Icon color
                                  // splashColor: Colors.transparent, // Remove splash color
                                ),
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.send,
                          color: Colors.white), // Icon color
                      // splashColor: Colors.transparent, // Remove splash color
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
