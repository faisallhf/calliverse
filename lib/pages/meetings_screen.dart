import 'package:calliverse/pages/ThemeProvider.dart';
import 'package:calliverse/pages/schedule_meeting_details.dart';
import 'package:calliverse/pages/audio_call_screen.dart';
import 'package:calliverse/pages/call.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

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
    final themeProvider = Provider.of<ThemeProvider>(context);
    final bgColor = themeProvider.isDarkMode
                            ? Color(0xff3E3E6766)
                            : Color(0xffF7F7FC);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Color(0xff020520) : Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 56,
        automaticallyImplyLeading: false,
        backgroundColor: themeProvider.isDarkMode ? Color(0xff020520) : Colors.white,
        leadingWidth: 40,
        titleSpacing: 0,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 18,
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Call()),
            );
          },
        ),
        title: Text(
          'Meetings',
          style: TextStyle(
            color: themeProvider.isDarkMode ? Colors.white : Color(0xff0f1828),
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
                        fillColor: themeProvider.isDarkMode
                            ? Color(0xff3E3E6766)
                            : Color(0xffF7F7FC), // Light gray background for the input
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8), // Add some space between input and button
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AudioCallScreen()),
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
                  padding: const EdgeInsets.symmetric(vertical: 14), // Button padding
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
                    MaterialPageRoute(builder: (context) => ScheduleMeetingPage()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xff095DEC).withOpacity(0.2),
                  padding: const EdgeInsets.symmetric(vertical: 14), // Button padding
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
                color: bgColor, // Same background for the container and calendar
                border: Border.all(
                  color: themeProvider.isDarkMode 
          ? Color(0xff3E3E67).withOpacity(0.4) 
          : Color(0xffDEDEDE), // Border for the container
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TableCalendar(
                calendarFormat: CalendarFormat.month,
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                selectedDayPredicate: (day) {
                  return _isDaySelected(day); // Check if the day is selected
                },
                onDaySelected: _onDaySelected,
                calendarStyle: CalendarStyle(
                  todayTextStyle: TextStyle(
                    color: themeProvider.isDarkMode ? Colors.white : const Color(0xFF6A6A6A),
                  ),
                  cellMargin: const EdgeInsets.all(6.0),
                  todayDecoration: BoxDecoration(
                    color: themeProvider.isDarkMode
                        ? Color(0xff3E3E67).withOpacity(0.4)
                        : Colors.transparent, // Same background as container
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue, // Blue border for today
                      width: 1.0,
                    ),
                  ),
                  selectedDecoration: const BoxDecoration(
                    color: Colors.blue, // Blue color for selected day
                    shape: BoxShape.circle,
                  ),
                  outsideDecoration: BoxDecoration(
                    color: Colors.transparent, // Same background as container
                  ),
                  defaultDecoration: BoxDecoration(
                    color: Colors.transparent, // Same background as container
                  ),
                  disabledDecoration: BoxDecoration(
                    color: Colors.transparent, // Same background as container
                  ),
                ),
                headerStyle: HeaderStyle(
                  headerMargin: EdgeInsets.only(bottom: 5),
                  titleTextStyle: const TextStyle(color: Colors.blue),
                  formatButtonVisible: false,
                  titleCentered: true,
                  leftChevronIcon: const Icon(Icons.chevron_left, color: Colors.blue),
                  rightChevronIcon: const Icon(Icons.chevron_right, color: Colors.blue),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  weekdayStyle: TextStyle(
                    color: themeProvider.isDarkMode ? Colors.white : const Color(0xFF6A6A6A),
                  ),
                  weekendStyle: TextStyle(
                    color: themeProvider.isDarkMode ? Colors.white : const Color(0xFF6A6A6A),
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
