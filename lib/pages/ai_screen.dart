import 'package:calliverse/pages/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatbotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Color(0xff020520) : Color(0xffF7F7FC),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 56,
        automaticallyImplyLeading: false,
        backgroundColor:themeProvider.isDarkMode ? Color(0xff020520) :  Colors.white,
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
        title: Text(
          'Juliabot',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: themeProvider.isDarkMode ? Colors.white : Color(0xff0f1828),
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.search_outlined, color: themeProvider.isDarkMode ? Colors.white : Colors.black,),
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
                      fontFamily: 'Mulish',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: themeProvider.isDarkMode?Colors.white:Colors.black
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                      'Ask me anything what\'s are on \nyour mind. Am here to assist you!',
                      style: TextStyle(
fontFamily: 'Mulish',
fontSize: 14,
color:themeProvider.isDarkMode?Colors.white:Colors.black 
                      ),),
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
                              color:themeProvider.isDarkMode?Color(0xff3E3E6766).withOpacity(0.4): Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color:themeProvider.isDarkMode?Colors.transparent: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            // Use MediaQuery to set dynamic width with margins
                            width: MediaQuery.of(context).size.width -
                                48, // 16 margin on each side
                            child:  Center(
                              child: Text(
                                'Explain Quantum Physics',
                                style: TextStyle(color:themeProvider.isDarkMode?Colors.white: Color(0xff3E3E3E)),
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
                              color: themeProvider.isDarkMode?Color(0xff3E3E6766).withOpacity(0.4): Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color:themeProvider.isDarkMode?Colors.transparent: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            // Use MediaQuery to set dynamic width with margins
                            width: MediaQuery.of(context).size.width -
                                48, // 16 margin on each side
                            child: Center(
                              child: Text(
                                'Write a tweet about global warming',
                                style: TextStyle(color:themeProvider.isDarkMode?Colors.white: Color(0xff3E3E3E)),
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
                              color:themeProvider.isDarkMode?Color(0xff3E3E6766).withOpacity(0.4): Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color:themeProvider.isDarkMode?Colors.transparent: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            // Use MediaQuery to set dynamic width with margins
                            width: MediaQuery.of(context).size.width -
                                48, // 16 margin on each side
                            child: Center(
                              child: Text(
                                'Write a poem about flower and love',
                                style: TextStyle(color:themeProvider.isDarkMode?Colors.white: Color(0xff3E3E3E)),
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
                              color:themeProvider.isDarkMode?Color(0xff3E3E6766).withOpacity(0.4): Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color:themeProvider.isDarkMode?Colors.transparent: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            // Use MediaQuery to set dynamic width with margins
                            width: MediaQuery.of(context).size.width -
                                48, // 16 margin on each side
                            child: Center(
                              child: Text(
                                'Write a rap song lyrics about',
                                style: TextStyle(color:themeProvider.isDarkMode?Colors.white: Color(0xff3E3E3E)),
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
            color:  themeProvider.isDarkMode ? Color(0xff020520) : Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 16, right: 3, bottom: 8), // Horizontal margin
                    decoration: BoxDecoration(
                      color:themeProvider.isDarkMode?Color(0xff3E3E6766).withOpacity(0.4): Color(0xffF7F7FC3).withOpacity(0.2),
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
                                  icon: const Icon(
                                      Icons.send,
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
