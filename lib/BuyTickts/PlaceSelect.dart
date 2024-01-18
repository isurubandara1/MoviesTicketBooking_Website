import 'package:flutter/material.dart';

class PlaceSelect extends StatefulWidget {
  @override
  _PlaceSelectState createState() => _PlaceSelectState();
}

class _PlaceSelectState extends State<PlaceSelect> {
  int? selectedFullTicket; // Variable for selected full ticket count
  int? selectedHalfTicket; // Variable for selected half ticket count

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.black87,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      // First row for full tickets
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text("No. of Full Tickets",
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 100),
                                    child: DropdownButtonFormField<int>(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                      value: selectedFullTicket,
                                      onChanged: (int? newValue) {
                                        setState(() {
                                          selectedFullTicket = newValue;
                                        });
                                      },
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        10,
                                        (int index) => DropdownMenuItem<int>(
                                          value: index + 1,
                                          child: Text((index + 1).toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 30),
                          // Second column for half tickets
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text("No. of Half Tickets",
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 100),
                                    child: DropdownButtonFormField<int>(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                      value: selectedHalfTicket,
                                      onChanged: (int? newValue) {
                                        setState(() {
                                          selectedHalfTicket = newValue;
                                        });
                                      },
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        10,
                                        (int index) => DropdownMenuItem<int>(
                                          value: index + 1,
                                          child: Text((index + 1).toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Second row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(
                                  20), // Adjust the radius here for the curve
                            ),
                            width: 250,
                            height: 40,
                            child: Center(
                                child: Text(
                              "Tickets count = 5",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      // Third row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: Text("7:30 AM")),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: Text("1:30 PM")),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: Text("5:30 PM")),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
