import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_ticket_booking_website/Web/Home.dart';
import 'package:movies_ticket_booking_website/Web/Payment.dart';

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

  Future<void> _submitDetails() async {
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty) {
      _showSnackbar("Fill all the text fields");
    } else {
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

      try {
        await _firestore.collection('bookings').add(bookingData);
        _showSnackbar("Details submitted successfully");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );

        nameController.clear();
        phoneController.clear();
        emailController.clear();
      } catch (error) {
        _showSnackbar("Error submitting details");
      }
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    width: 300,
                    height: 400,
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
                          SizedBox(height: 60),
                          Container(
                            color: Color.fromARGB(255, 3, 124, 43),
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
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
