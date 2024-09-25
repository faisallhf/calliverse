import 'package:flutter/material.dart';
import 'package:calliverse/pages/ai_screen.dart';
import 'package:calliverse/pages/audio_call_screen.dart';
import 'package:calliverse/pages/profile_screen.dart';
import 'package:calliverse/pages/video_call_screen.dart';

class CalllistItemWidget extends StatelessWidget {
  final String name;
  final String imagePath;
  final String callTime;
  final bool isMissedCall;

  const CalllistItemWidget({
    super.key,
    required this.name,
    required this.imagePath,
    required this.callTime,
    this.isMissedCall = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 24,
            foregroundImage: AssetImage(imagePath),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0f1828),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        isMissedCall ? Icons.phone_missed_rounded : Icons.phone,
                        color: isMissedCall ? Colors.red : Colors.green,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        callTime,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.videocam, color: Colors.blue),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideoCallScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.call, color: Colors.blue),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AudioCallScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Call extends StatefulWidget {
  const Call({super.key});

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  int _selectedIndex = 1; // Default to Calls screen

  final List<Map<String, dynamic>> _callData = [
    {
      "name": "Pranav Ray",
      "imagePath": "assets/images/image1.png",
      "callTime": "15 mins ago",
      "isMissedCall": true,
    },
    {
      "name": "Lindsey Smith",
      "imagePath": "assets/images/image2.png",
      "callTime": "30 mins ago",
      "isMissedCall": false,
    },
    {
      "name": "Jocelyn Carder",
      "imagePath": "assets/images/image3.png",
      "callTime": "1 hour ago",
      "isMissedCall": true,
    },
    {
      "name": "Mira Schleifer",
      "imagePath": "assets/images/image4.png",
      "callTime": "2 hours ago",
      "isMissedCall": false,
    },
    {
      "name": "Zaire Vaccaro",
      "imagePath": "assets/images/image5.png",
      "callTime": "15 mins ago",
      "isMissedCall": true,
    },
    {
      "name": "Phillip Dorwart",
      "imagePath": "assets/images/image6.png",
      "callTime": "30 mins ago",
      "isMissedCall": false,
    },
    {
      "name": "Wilson Botosh",
      "imagePath": "assets/images/image7.png",
      "callTime": "1 hour ago",
      "isMissedCall": true,
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation for the AI tab
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatbotScreen()),
      ).then((value) {
        // Reset back to Calls after returning from ChatbotScreen
        setState(() {
          _selectedIndex = 1; // Go back to Calls
        });
      });
    }
    if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      ).then((value) {
        // Reset back to Calls after returning from ChatbotScreen
        setState(() {
          _selectedIndex = 1; // Go back to Calls
        });
      });
    }
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return const Center(child: Text('Messages Screen'));
      case 1:
        return _buildCallsScreen(); // Calls screen
      case 3:
        return const Center(child: Text('Meetings Screen'));
      case 4:
        return const Center(child: Text('Profile Screen'));
      default:
        return const Center(child: Text('Unknown Screen'));
    }
  }

  Widget _buildCallsScreen() {
    return Container(
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: Color(0xffffffff)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: AppBar(
                    elevation: 0,
                    toolbarHeight: 56,
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
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
                        // Handle back button action
                      },
                    ),
                    title: const Text(
                      'Calls',
                      style: TextStyle(
                        color: Color(0xff0f1828),
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 18),
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final call = _callData[index];
                        return CalllistItemWidget(
                          name: call['name'],
                          imagePath: call['imagePath'],
                          callTime: call['callTime'],
                          isMissedCall: call['isMissedCall'],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 18);
                      },
                      itemCount: _callData.length,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(_selectedIndex),
      bottomNavigationBar:
          _selectedIndex != 2 // Show bottom nav only if not on ChatbotScreen
              ? BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.grey,
                  items: const [
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('assets/images/messages.png')),
                      label: 'Messages',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.phone_in_talk_outlined),
                      label: 'Calls',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.smart_toy, color: Color(0xff095DEC)),
                      label: 'AI',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.people_outline),
                      label: 'Meetings',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline_sharp),
                      label: 'Profile',
                    ),
                  ],
                )
              : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Call button pressed');
        },
        child: const Icon(Icons.add_call, color: Colors.white),
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
