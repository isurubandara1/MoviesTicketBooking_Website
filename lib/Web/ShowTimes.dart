import 'package:flutter/material.dart';
import '../Common.dart';

class ShowTimes extends StatefulWidget {
  final String movieName;
  const ShowTimes({required this.movieName});

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

    for (int i = 0; i < 400; i++) {
      availableDates.add(currentDate.add(Duration(days: i)));
    }

    for (DateTime date in availableDates) {
      if (widget.movieName == "Captain Miller (TAMIL)" &&
          (date.month >= 1 && date.month <= 3)) {
        availableTimes[date] = ["7:00 AM", "13:00 PM"];
      } else if (widget.movieName == "Merry Christmas (TAMIL)" &&
          (date.month >= 1 && date.month <= 3)) {
        availableTimes[date] = ["9.30 AM", "17:00 PM"];
      } else if (widget.movieName == "Mission Chapter 1 (TAMIL)" &&
          (date.month >= 4 && date.month <= 5)) {
        availableTimes[date] = ["11:00 AM", "1:00 PM", "1:20 PM"];
      } else if (widget.movieName == "Merry Christmas (HINDI)" &&
          (date.month >= 5 && date.month <= 6)) {
        availableTimes[date] = ["11:00 AM", "1:00 PM", "1:20 PM"];
      } else if (widget.movieName == "Raider (Sinhala)" &&
          (date.month >= 7 && date.month <= 8)) {
        availableTimes[date] = ["11:00 AM", "1:00 PM", "1:20 PM"];
      } else if (widget.movieName == "Vilan (Sinhala)" &&
          (date.month >= 9 && date.month <= 10)) {
        availableTimes[date] = ["11:00 AM", "1:00 PM", "1:20 PM"];
      } else if (widget.movieName == "Thaththa (SINHALA)" &&
          (date.month >= 11 && date.month <= 12)) {
        availableTimes[date] = ["11:00 AM", "1:00 PM", "1:20 PM"];
      } else if (widget.movieName == "Ape Principal (SINHALA)" &&
          date.year >= 2025) {
        availableTimes[date] = ["11:00 AM", "1:00 PM", "1:20 PM"];
      }
    }
  }

  void onDateSelected(DateTime selectedDate) {
    setState(() {
      currentDate = selectedDate;
      this.selectedDate = selectedDate;
      selectedTime = "";
    });

    print('Selected Date: ${selectedDate.month}/${selectedDate.day}');
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

            //Movie name
            Text(
              "........... ${widget.movieName} ...........",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.brown,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
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
                        "${date.year} / ${date.month} / ${date.day}",
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
              height: 40,
            ),

            // Display availability message
            Text(
              'Your film is available from ${selectedDate.day}/${selectedDate.month}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(
              height: 20,
            ),

            // Next button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 21, 39, 139),
                      side: BorderSide(
                        color: Color.fromARGB(255, 103, 112, 190),
                        width: 6.0, // Set the border width
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: 100.0,
                      child: Text(
                        'Next',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),

            // Footer
            footerBar(context),
          ],
        ),
      ),
    );
  }
}
