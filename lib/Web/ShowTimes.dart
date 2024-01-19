import 'package:flutter/material.dart';

class MyTimeButtons extends StatefulWidget {
  @override
  _MyTimeButtonsState createState() => _MyTimeButtonsState();
}

class _MyTimeButtonsState extends State<MyTimeButtons> {
  DateTime currentDate = DateTime.now();
  String selectedTime = "";
  late DateTime selectedDate = DateTime.now(); // Initialize with default value

  List<DateTime> availableDates = [];
  Map<DateTime, List<String>> availableTimes = {};

  @override
  void initState() {
    super.initState();

    // Generate available dates (next 7 days)
    for (int i = 0; i < 7; i++) {
      availableDates.add(currentDate.add(Duration(days: i)));
    }

    // Example available times for each date
    for (DateTime date in availableDates) {
      availableTimes[date] = ["10:00 AM", "15:02 PM", "7:00 PM"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Ticket Booking'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Display available dates
          Text(
            'Select Date:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: availableDates.length,
              itemBuilder: (context, index) {
                DateTime date = availableDates[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle date selection
                      onDateSelected(date);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (date == selectedDate) {
                            // Color when the button is selected
                            return Colors.blueAccent;
                          } else if (date == currentDate) {
                            // Color when the button is today's date
                            return Colors.blue;
                          }
                          return Colors.grey; // Default color for other dates
                        },
                      ),
                    ),
                    child: Text("${date.day}/${date.month}"),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),

          // Display available times
          Text(
            'Select Time:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: availableTimes[currentDate]?.length ?? 0,
              itemBuilder: (context, index) {
                String time = availableTimes[currentDate]?[index] ?? "";
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle time selection
                      onTimeSelected(time);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (time == selectedTime) {
                            // Color when the button is selected
                            return Colors.greenAccent;
                          }
                          return Colors.green;
                        },
                      ),
                    ),
                    child: Text(time),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void onDateSelected(DateTime selectedDate) {
    setState(() {
      currentDate = selectedDate;
      this.selectedDate = selectedDate;
      selectedTime = ""; // Reset selected time when date changes
    });

    // Print selected date to the terminal
    print('Selected Date: ${selectedDate.day}/${selectedDate.month}');
  }

  void onTimeSelected(String time) {
    DateTime currentTime = DateTime.now();
    DateTime selectedDateTime = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
      int.parse(time.split(':')[0]),
      int.parse(time.split(':')[1].split(' ')[0]),
    );

    if (selectedDateTime.isAfter(currentTime) ||
        (selectedDateTime.isAtSameMomentAs(currentTime) &&
            currentDate.isAfter(DateTime.now()))) {
      setState(() {
        selectedTime = time;
      });
      // Handle time selection
      print('Selected Time: $time');
      print(DateTime.now());
    } else {
      // Display an error or do nothing for invalid selection
      print('Invalid Time Selection');
    }
  }
}
