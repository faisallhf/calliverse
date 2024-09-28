import 'package:calliverse/pages/schedule_meeting_details.dart';
import 'package:calliverse/pages/audio_call_screen.dart';
import 'package:calliverse/pages/call.dart';
// import 'package:calliverse/pages/message_page.dart';
import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
// Make sure to import this for date formatting

class MeetingsScreen extends StatefulWidget {
  @override
  _MeetingsScreenState createState() => _MeetingsScreenState();
}

class _MeetingsScreenState extends State<MeetingsScreen> {
  List<DateTime?> selectedDates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Call()),
            );
          },
        ),
        title: const Text(
          'Meetings',
          style: TextStyle(
            color: Color(0xff0f1828),
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter a code or link',
                        filled: true,
                        fillColor: const Color(
                            0xffF7F7FC), // Light gray background for the input
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                      width: 8), // Add some space between input and button
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AudioCallScreen()),
                      );
                    },
                    child: const Text(
                      'Join',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity, // Stretches the button to take full width
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AudioCallScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xff095DEC), // Blue button color
                  padding: const EdgeInsets.symmetric(
                      vertical: 14), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Start an Instant Meeting',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16), // Space between rows
            SizedBox(
              width: double.infinity, // Stretches the button to take full width
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScheduleMeetingPage()));
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xff095DEC).withOpacity(0.2),
                  padding: const EdgeInsets.symmetric(
                      vertical: 14), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Schedule for later',
                  style: TextStyle(
                    color: Color(0xff095DEC),
                    fontSize: 18,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffFCFCFC),
                border: Border.all(
                  color: const Color(0xffDEDEDE), // Border for the container
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: CalendarDatePicker2(
                displayedMonthDate: DateTime.now(),
                config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.multi,
                  selectedDayHighlightColor:
                      Colors.blue, // Highlight color for selected day
                  weekdayLabels: [
                    'Mon',
                    'Tue',
                    'Wed',
                    'Thu',
                    'Fri',
                    'Sat',
                    'Sun'
                  ],
                  weekdayLabelTextStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  controlsTextStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue, // Color for month/year controls
                  ),
                  dayTextStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  selectedDayTextStyle: const TextStyle(
                    color: Colors.white, // Text color for selected date
                    fontWeight: FontWeight.bold,
                  ),
                  centerAlignModePicker: false,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                  controlsHeight: 50, // Height for month/year controls
                ),
                value: selectedDates, // Set value as the selected dates
                onValueChanged: (dates) {
                  setState(() {
                    selectedDates = dates;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
