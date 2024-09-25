import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff020520),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 18,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context); // Back navigation
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(
                Icons.mic_off_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                // Mute functionality
                print('Mute pressed');
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Dark overlay
            Positioned.fill(
              child: Container(
                color: const Color(0xff020520).withOpacity(0.6),
              ),
            ),

            // Center content with scrolling to prevent overflow
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 80)),

                // Profile Picture
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/images/image1.png',
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Profile Name
                Center(
                  child: Text(
                    'John Doe', // Replace with actual contact name
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Call Timer
                Center(
                  child: Text(
                    '00:15', // Call duration
                    style: GoogleFonts.lato(
                      color: Colors.white70,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 350),

            // Bottom action buttons (Flip, Stop Video, Record, End Call)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Flip Button with Label
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Implement flip functionality
                            print('Flip pressed');
                          },
                          icon: ImageIcon(
                            AssetImage('assets/images/camera.png'),
                            size: 45,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Flip',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),

                    // Stop Video Button with Label
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Implement stop video functionality
                            print('Stop Video pressed');
                          },
                          icon: ImageIcon(
                            AssetImage('assets/images/video_camera.png'),
                            size: 45,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Stop Video',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),

                    // Record Button with Label
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Implement record functionality
                            print('Record pressed');
                          },
                          icon: const ImageIcon(
                            AssetImage('assets/images/record.png'),
                            size: 45,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Record',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),

                    // End Call Button with Label (same size as others)
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // Implement end call functionality
                            // print('End Call pressed');
                          },
                          icon: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.red,
                            child: const ImageIcon(
                              AssetImage('assets/images/end.png'),
                              size: 45,
                              color: Colors.white,
                            ),
                          ),
                          // Set color for the End Call button
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'End Call',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
