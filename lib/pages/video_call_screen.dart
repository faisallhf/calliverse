import 'package:flutter/material.dart';

class VideoCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            // Full-screen video feed background
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/imagevideo.png'), // Background image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // AppBar with transparent background
            AppBar(
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

            // Bottom left corner image
            Positioned(
              top: 430,
              right: 30,
              child: Container(
                child: Image.asset(
                    'assets/images/imagevideo.png'), // Video or profile image
              ),
            ),

            // Bottom action buttons (Flip, Stop Video, Record, End Call)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
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
                                print('Flip pressed');
                              },
                              icon: const ImageIcon(
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
                                print('Stop Video pressed');
                              },
                              icon: const ImageIcon(
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

                        // End Call Button with Label
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.red,
                                child: ImageIcon(
                                  AssetImage('assets/images/end.png'),
                                  size: 45,
                                  color: Colors.white,
                                ),
                              ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
