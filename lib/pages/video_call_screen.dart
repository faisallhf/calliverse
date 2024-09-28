import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  double top = 430; // initial vertical position of the image
  double left = 30; // initial horizontal position of the image

  void updatePosition(Offset delta) {
    setState(() {
      // Update position based on the user's drag
      top += delta.dy;
      left += delta.dx;
    });
  }

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
                    image: AssetImage('assets/images/imagevideo.png'), // Background image
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

            // Movable Bottom left corner image
            Positioned(
              top: top,
              left: left,
              child: GestureDetector(
                onPanUpdate: (details) {
                  // Update position as the user drags
                  updatePosition(details.delta);
                },
                child: Container(
                  child: Image.asset(
                    'assets/images/imagevideo.png', // Video or profile image
                    width: 160, // Set the desired width
                    height: 180, // Set the desired height
                  ),
                ),
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
