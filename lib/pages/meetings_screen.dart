import 'package:calliverse/pages/schedule_meeting_details.dart';
import 'package:calliverse/pages/audio_call_screen.dart';
import 'package:calliverse/pages/call.dart';
// import 'package:calliverse/pages/message_page.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
// Make sure to import this for date formatting

class MeetingsScreen extends StatefulWidget {
  @override
  _MeetingsScreenState createState() => _MeetingsScreenState();
}

class _MeetingsScreenState extends State<MeetingsScreen> {
   DateTime _focusedDay = DateTime.now();
  List<DateTime> _selectedDays = []; // List to store selected days

  // Function to check if a day is selected
  bool _isDaySelected(DateTime day) {
    return _selectedDays.any((selectedDay) => isSameDay(selectedDay, day));
  }
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _focusedDay = focusedDay;

      if (_isDaySelected(selectedDay)) {
        _selectedDays.removeWhere((day) => isSameDay(day, selectedDay)); // Unselect day
      } else {
        _selectedDays.add(selectedDay); // Select day
      }
    });
  }

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
              child:TableCalendar(
          calendarFormat: CalendarFormat.month,
          focusedDay: _focusedDay,
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          selectedDayPredicate: (day) {
            return _isDaySelected(day); // Check if the day is selected
          },
          onDaySelected: _onDaySelected, // Toggle the selection of days
          calendarStyle: CalendarStyle(
            todayTextStyle: TextStyle(color: Colors.black),
            cellMargin: EdgeInsets.all(6.0),
            
            todayDecoration: BoxDecoration(
    color: Colors.transparent, // No fill color
    shape: BoxShape.circle,
    border: Border.all(
      color: Colors.blue, // Blue border color
      width: 1.0, // Border width
    ),),
            selectedDecoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            outsideDecoration: BoxDecoration(
              color: Color(0xFFFCFCFC), // Set outside day cells to the same background color
            ),
            defaultDecoration: BoxDecoration(
              color: Color(0xFFFCFCFC), // Set default cells to match the background
            ),
            disabledDecoration: BoxDecoration(
              color: Color(0xFFFCFCFC), // Disabled days should also match the background
            ),
          ),
          headerStyle: HeaderStyle(
            titleTextStyle: TextStyle(color: Colors.blue),
            formatButtonVisible: false,
            titleCentered: true,
            leftChevronIcon: Icon(Icons.chevron_left, color: Colors.blue),
            rightChevronIcon: Icon(Icons.chevron_right, color: Colors.blue),
            decoration: BoxDecoration(
              color: Color(0xFFFCFCFC), // Header background color
            ),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            decoration: BoxDecoration(
              color: Color(0xFFFCFCFC), // Days of the week background color
            ),
          ),
        ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}