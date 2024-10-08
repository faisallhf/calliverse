import 'package:calliverse/pages/ThemeProvider.dart';
import 'package:calliverse/pages/meeting_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleMeetingPage extends StatefulWidget {
  @override
  _ScheduleMeetingPageState createState() => _ScheduleMeetingPageState();
}

class _ScheduleMeetingPageState extends State<ScheduleMeetingPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool _isAm = true;
  bool _isReminderSet = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  // final TextEditingController _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     final themeProvider = Provider.of<ThemeProvider>(context);
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
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
        title: Text(
          'Schedule Meetings',
          style: TextStyle(
            color:themeProvider.isDarkMode ? Colors.white : Color(0xff0f1828),
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container for Calendar and Time Picker
              Container(
                decoration: BoxDecoration(
                  color:themeProvider.isDarkMode  ? Color(0xff3E3E6766) 
        : Color(0xffFCFCFC), 
                  border: Border.all(
                     color: themeProvider.isDarkMode 
          ? Color(0xff3E3E67).withOpacity(0.4) 
          : Color(0xffDEDEDE),  width: 2), // Add border color
                  borderRadius:
                      BorderRadius.circular(8), // Optional: rounded corners
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _buildCalendar(themeProvider),
                    SizedBox(
                        height: 16), // Space between calendar and time picker
                    _buildTimePicker(themeProvider), // Time Picker widget
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Title TextField
              _buildTextField("Title", _titleController, 50,themeProvider,),
              SizedBox(height: 8),

              // Description TextField
              _buildTextField("Description", _descriptionController, 117,themeProvider),
              SizedBox(height: 8),

              // Add Reminder Checkbox
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    activeColor: Colors.grey,
                    checkColor: Colors.white,
                    value: _isReminderSet,
                    onChanged: (value) {
                      setState(() {
                        _isReminderSet = value!;
                      });
                    },
                  ),
                  Text("Add Reminder"),
                ],
              ),
              SizedBox(height: 16),

              // Personal Notes TextField

              SizedBox(height: 8),
              _buildTextField("Personal Notes", _descriptionController, 110,themeProvider),
              SizedBox(height: 8),

              SizedBox(height: 16),

              // Schedule button
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 46.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the scheduling logic here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MeetingDetails()),
                      );
                    },
                    child: Text(
                      "Schedule",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Mulish',
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff095DEC),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Calendar builder with enforced background color
  Widget _buildCalendar(dynamic themeProvider) {
    return Container(
      color: themeProvider.isDarkMode 
        ? Colors.transparent 
        : Color(0xffFCFCFC), // Set the background color here
      child: TableCalendar(
        calendarFormat: CalendarFormat.month,
        focusedDay: _focusedDay,
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        calendarStyle: CalendarStyle(
          cellMargin: EdgeInsets.all(6.0),
          todayDecoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          outsideDecoration: BoxDecoration(
           color: themeProvider.isDarkMode 
            ? Colors.transparent
            : Color(0xFFFCFCFC), // Set outside day cells to the same background color
          ),
          defaultDecoration: BoxDecoration(
            color: themeProvider.isDarkMode 
            ? Colors.transparent
            : Color(0xFFFCFCFC), // Set default cells to match the background
          ),
          disabledDecoration: BoxDecoration(
           color: themeProvider.isDarkMode 
            ? Color(0xff3E3E67)
            : Color(0xFFFCFCFC), // Disabled days should also match the background
          ),
        ),
        headerStyle: HeaderStyle(
          titleTextStyle: TextStyle(color: Colors.blue),
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronIcon: Icon(Icons.chevron_left, color: Colors.blue),
          rightChevronIcon: Icon(Icons.chevron_right, color: Colors.blue),
          decoration: BoxDecoration(
            color: themeProvider.isDarkMode 
            ? Colors.transparent
            : Color(0xFFFCFCFC), // Header background color
          ),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
                    color: themeProvider.isDarkMode ? Colors.white : const Color(0xFF6A6A6A),
                  ),
                   weekendStyle: TextStyle(
                    color: themeProvider.isDarkMode ? Colors.white : const Color(0xFF6A6A6A),
                  ),
          decoration: BoxDecoration(
            color: themeProvider.isDarkMode 
            ? Colors.transparent 
            :  Colors.transparent, // Days of the week background color
          ),
        ),
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
      ),
    );
  }

  // Time picker builder with AM/PM
  Widget _buildTimePicker(dynamic themeProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Time",
          style: TextStyle(
              fontSize: 16, color:themeProvider.isDarkMode?Colors.white: Colors.black, fontWeight: FontWeight.w500),
        ),
        // SizedBox(width: 60,),
        // Expanded(
        //   child: _buildDropdownTimePicker(),
        // ),
        Row(
          children: [
            _buildDropdownTimePicker(themeProvider),
            SizedBox(width: 8),
            _buildAmPmSelector("AM", _isAm),
            // SizedBox(width: 8),
            _buildAmPmSelector("PM", !_isAm),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdownTimePicker(dynamic themeProvider) {
    String formattedTime = _formatTime();
    List<String> timeOptions = _generateTimeOptions();
    if (!timeOptions.contains(formattedTime)) {
      formattedTime = timeOptions.first;
    }

    return DropdownButton<String>(
      iconEnabledColor:  themeProvider.isDarkMode 
            ? Color(0xFFFCFCFC):Color(0xff3E3E67),
      focusColor:  themeProvider.isDarkMode 
            ? Color(0xFFFCFCFC):Color(0xff3E3E67),
      dropdownColor:  themeProvider.isDarkMode 
            ?Color(0xff3E3E67): Color(0xFFFCFCFC),
      iconDisabledColor:  themeProvider.isDarkMode 
             ? Color(0xFFFCFCFC):Color(0xff3E3E67),
      value: formattedTime,
      items: timeOptions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,style: TextStyle(color: themeProvider.isDarkMode 
            ? Color(0xFFFCFCFC):Color(0xff3E3E67),),),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          List<String> timeParts = newValue.split(":");
          int hour = int.parse(timeParts[0]);
          int minute = int.parse(timeParts[1]);

          setState(() {
            _selectedTime = TimeOfDay(hour: hour, minute: minute);
          });
        }
      },
    );
  }

  Widget _buildAmPmSelector(String period, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isAm = (period == "AM");
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Color(0xffF0F3F7),
          borderRadius: BorderRadius.circular(1),
        ),
        child: Text(
          period,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: isSelected ? Colors.black : Colors.black,
          ),
        ),
      ),
    );
  }

  String _formatTime() {
    final hour = _selectedTime.hourOfPeriod.toString().padLeft(2, '0');
    final minute = _selectedTime.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }

  List<String> _generateTimeOptions() {
    List<String> times = [];
    for (int hour = 1; hour <= 12; hour++) {
      for (int minute = 0; minute < 60; minute += 15) {
        times.add(
            "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}");
      }
    }
    return times;
  }

  // Helper method to build text fields
  Widget _buildTextField(
      String label, TextEditingController controller, double height, dynamic themeProvider) {
    return Container(
      width: double.infinity, // Align with the width as per your image
      height: height, // Adjust height as necessary
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: themeProvider.isDarkMode?Color(0xff3E3E6766) : Color(0xffF7F7FC),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(
              color: Color(0xff6C7278),
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: 'Mulish'),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
