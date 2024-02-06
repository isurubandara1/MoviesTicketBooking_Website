import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_ticket_booking_website/Common.dart';
import 'package:movies_ticket_booking_website/Web/Downlod.dart';
import 'package:movies_ticket_booking_website/Web/Home.dart';

class ConfirmBooking extends StatefulWidget {
  final String filmName;
  final int fullTicket;
  final int halfTicket;
  final int ticketCount;
  final String time;
  final int price;
  final String date;
  final Set<String> selectedButtonLabels;

  const ConfirmBooking({
    required this.filmName,
    required this.fullTicket,
    required this.halfTicket,
    required this.ticketCount,
    required this.time,
    required this.price,
    required this.date,
    required this.selectedButtonLabels,
  });

  @override
  State<ConfirmBooking> createState() => _ConfirmBookingState();
}

class _ConfirmBookingState extends State<ConfirmBooking> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool paymentMade = false;

  Future<void> _submitDetails() async {
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty) {
      _showSnackbar("Fill all the text fields");
    } else {
      try {
        List<String> unavailableSheets = [];
        for (String sheetLabel in widget.selectedButtonLabels) {
          bool isAlreadyBooked = await isSheetBooked(sheetLabel);
          if (isAlreadyBooked) {
            unavailableSheets.add(sheetLabel);
          }
        }

        // Check if the entered data already exists
        bool isAlreadyBooked = await isBookingAlreadyExist();
        if (isAlreadyBooked) {
          _showSnackbar(
              "This ${unavailableSheets.join(', ')} is already booked. Please choose another one.");
          return;
        }

        if (unavailableSheets.isNotEmpty) {
          String unavailableSheetsMessage =
              "Selected sheets for date ${widget.date} and time ${widget.time} are no longer available: ${unavailableSheets.join(', ')}";
          _showSnackbar(unavailableSheetsMessage);
          return;
        }

        Map<String, dynamic> bookingData = {
          'Name': nameController.text,
          'Phone number': phoneController.text,
          'Email': emailController.text,
          'Movie name': widget.filmName,
          'Full Ticket': widget.fullTicket,
          'Half Ticket': widget.halfTicket,
          'Total TicketCount': widget.ticketCount,
          'Time': widget.time,
          'Price': widget.price,
          'Date': widget.date,
          'Sheets': widget.selectedButtonLabels.toList(),
        };

        // Set the document ID using the phone number
        await _firestore
            .collection('bookings')
            .doc(phoneController.text)
            .set(bookingData);

        DocumentReference bookingRef =
            await _firestore.collection('bookings').add(bookingData);

        for (String sheetLabel in widget.selectedButtonLabels) {
          await _firestore.collection('booked_sheets').doc(bookingRef.id).set({
            'isBooked': true,
            'bookingId': bookingRef.id,
            'filmName': widget.filmName,
            'date': widget.date,
            'time': widget.time,
            'Sheets': widget.selectedButtonLabels.toList(),
          });
        }

        _showSnackbar("Details submitted successfully", isSuccess: true);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Download(
              filmName: widget.filmName,
              fullTicket: widget.fullTicket ?? 0,
              halfTicket: widget.halfTicket ?? 0,
              ticketCount: widget.ticketCount,
              time: widget.time,
              price: widget.price,
              date: widget.date,
              selectedButtonLabels: widget.selectedButtonLabels.toSet(),
            ),
          ),
        );

        nameController.clear();
        phoneController.clear();
        emailController.clear();
      } catch (error) {
        _showSnackbar("Error submitting details");
      }
    }
  }

  Future<bool> isSheetBooked(String sheetLabel) async {
    DocumentSnapshot sheetDoc =
        await _firestore.collection('booked_sheets').doc(sheetLabel).get();

    if (sheetDoc.exists) {
      // Check if the sheet is booked for the same film, date, and time
      Map<String, dynamic> sheetData = sheetDoc.data() as Map<String, dynamic>;
      String bookedFilmName = sheetData['filmName'];
      String bookedDate = sheetData['date'];
      String bookedTime = sheetData['time'];

      return bookedFilmName == widget.filmName &&
          bookedDate == widget.date &&
          bookedTime == widget.time;
    }

    return false;
  }

  Future<bool> isBookingAlreadyExist() async {
    QuerySnapshot bookingDocs = await _firestore
        .collection('bookings')
        .where('Movie name', isEqualTo: widget.filmName)
        .where('Date', isEqualTo: widget.date)
        .where('Time', isEqualTo: widget.time)
        .get();

    return bookingDocs.docs.isNotEmpty;
  }

  void _showSnackbar(String message, {bool isSuccess = false}) {
    Color snackBarColor = isSuccess ? Colors.green : Colors.red;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.center),
        duration: Duration(seconds: 2),
        backgroundColor: snackBarColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 220, 220),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Navbar(context),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Full Name',
                              hintText: 'Enter Your Name',
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: TextField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Phone Number',
                              hintText: '07* *******',
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'example@gmail.com',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black54,
                          width: 2.0,
                        ),
                      ),
                      width: 300,
                      height: 350,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Booking Details",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.brown,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text("Movie Name : ${widget.filmName}"),
                            SizedBox(height: 10),
                            Text(
                                "Full Tickets : ${widget.fullTicket} & Half Tickets : ${widget.halfTicket}"),
                            SizedBox(height: 10),
                            Text("Total Tickets : ${widget.ticketCount}"),
                            SizedBox(height: 10),
                            Text("Date : ${widget.date}"),
                            SizedBox(height: 10),
                            Text("Time : ${widget.time}"),
                            SizedBox(height: 10),
                            Text(
                              "Your Selected Sheets : ${widget.selectedButtonLabels}",
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 50),
                            Container(
                              color: Colors.black54,
                              width: double.infinity,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "Amount Payable = Rs.${widget.price}/=",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _submitDetails,
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text("Pay"),
            ),
            SizedBox(
              height: 20,
            ),
            footerBar(context),
          ],
        ),
      ),
    );
  }
}
