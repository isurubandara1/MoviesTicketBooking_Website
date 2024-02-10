import 'package:flutter/material.dart';
import 'package:movies_ticket_booking_website/UserWeb/PlaceSelect.dart';
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
  DateTime selectedDate = DateTime.now();

  List<DateTime> availableDates = [];
  Map<DateTime, List<String>> availableTimes = {};

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 400; i++) {
      availableDates.add(currentDate.add(Duration(days: i)));
    }

    for (DateTime date in availableDates) {
      if (widget.movieName == "Captain Miller (TAMIL)") {
        availableTimes[date] = ["7:00 AM", "13:00 PM"];
      } else if (widget.movieName == "Merry Christmas (TAMIL)") {
        availableTimes[date] = ["10:00 AM", "15:30 PM"];
      } else if (widget.movieName == "Mission Chapter 1 (TAMIL)") {
        availableTimes[date] = ["7:00 AM", "13:00 PM"];
      } else if (widget.movieName == "Merry Christmas (HINDI)") {
        availableTimes[date] = ["10:00 AM", "18:00 PM"];
      } else if (widget.movieName == "Raider (SINHALA)") {
        availableTimes[date] = ["7:00 AM", "13:00 PM"];
      } else if (widget.movieName == "Vilan (SINHALA)") {
        availableTimes[date] = ["10:00 AM", "15:30 PM"];
      } else if (widget.movieName == "Thaththa (SINHALA)") {
        availableTimes[date] = ["7:00 AM", "13:00 PM"];
      } else if (widget.movieName == "Ape Principal (SINHALA)") {
        availableTimes[date] = ["1:00 PM", "18:30 PM"];
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
      showSnackBar('This time is expired, Select another time');
      print('Invalid Time Selection');
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //navBar
            Navbar(context),

            //Image
            Image.asset(
              "assets/ShowTimes.jpg",
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.1,
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
                const Text(
                  'Select Date: (Select here your Date)',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
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
                left: MediaQuery.of(context).size.width * 0.4,
              ),
              child: Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: availableTimes[currentDate]?.length ?? 0,
                  itemBuilder: (context, index) {
                    String time = availableTimes[currentDate]?[index] ?? "";
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
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
                          child: Center(
                            child: Text(
                              time,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
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

            // Next button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedTime.isNotEmpty) {
                        // Time is selected, navigate to the next page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlaceSelect(
                                selectedTime: selectedTime,
                                selectedDate: selectedDate,
                                filmName: widget.movieName),
                          ),
                        );
                      } else {
                        // No time selected, show a message
                        showSnackBar('Select time before proceeding');
                      }
                    },
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
