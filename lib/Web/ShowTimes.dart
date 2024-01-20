import 'package:flutter/material.dart';
import "../Common.dart";

class ShowTimes extends StatefulWidget {
  @override
  _ShowTimesState createState() => _ShowTimesState();
}

class _ShowTimesState extends State<ShowTimes> {
  DateTime currentDate = DateTime.now();
  String selectedTime = "";
  late DateTime selectedDate = DateTime.now();

  List<DateTime> availableDates = [];
  Map<DateTime, List<String>> availableTimes = {};

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 300; i++) {
      availableDates.add(currentDate.add(Duration(days: i)));
    }

    for (DateTime date in availableDates) {
      availableTimes[date] = ["10:00 AM", "13:00 PM", "5:00 PM"];
    }
  }

  void onDateSelected(DateTime selectedDate) {
    setState(() {
      currentDate = selectedDate;
      this.selectedDate = selectedDate;
      selectedTime = "";
    });

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
      print('Selected Time: $time');
      print(DateTime.now());
    } else {
      print('Invalid Time Selection');
    }
  }

  void onLeftArrowPressed() {
    setState(() {
      currentDate = currentDate.subtract(Duration(days: 1));
    });
  }

  void onRightArrowPressed() {
    setState(() {
      currentDate = currentDate.add(Duration(days: 1));
    });
  }

  void scrollLeft() {
    setState(() {
      currentDate = currentDate.subtract(Duration(days: 1));
    });
  }

  void scrollRight() {
    setState(() {
      currentDate = currentDate.add(Duration(days: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //navBar
            Navbar(context),

            //Image
            Image.asset(
              "assets/ShowTimes.jpg",
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.2,
              fit: BoxFit.cover,
            ),

            SizedBox(
              height: 30,
            ),

            // Date selection with scroll buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_left),
                  onPressed: scrollLeft,
                ),
                const SizedBox(width: 20),
                const Text(
                  'Select Date: (Select here your Date)',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.arrow_right),
                  onPressed: scrollRight,
                ),
              ],
            ),

            SizedBox(height: 30),

            // Display available dates
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
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (date == selectedDate) {
                              // Color when the button is selected
                              return Colors.pinkAccent;
                            } else if (date == currentDate) {
                              // Color when the button is today's date
                              return Colors.pinkAccent;
                            }
                            return Colors.grey; // Default color for other dates
                          },
                        ),
                      ),
                      child: Text(
                        "${date.day}/${date.month}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              height: 30,
            ),

            // Display available times
            Text(
              'Select Time: (Select here your available time)',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.35),
              child: Container(
                height: 50,
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
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (time == selectedTime) {
                                // Color when the button is selected
                                return Colors.pinkAccent;
                              }
                              return Colors.grey;
                            },
                          ),
                        ),
                        child: Text(
                          time,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            //footer
            footerBar(context),
          ],
        ),
      ),
    );
  }
}
