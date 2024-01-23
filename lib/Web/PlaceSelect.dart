import 'package:flutter/material.dart';
import 'Home.dart';

class PlaceSelect extends StatefulWidget {
  final String selectedTime;
  final String filmName;

  const PlaceSelect({required this.selectedTime, required this.filmName});

  @override
  _PlaceSelectState createState() => _PlaceSelectState();
}

class _PlaceSelectState extends State<PlaceSelect> {
  int? selectedFullTicket;
  int? selectedHalfTicket;
  int price = 0;
  Set<String> selectedButtonLabels = Set();

// Calculate the price based on the selected tickets
  void viewPrice() {
    setState(() {
      price = (selectedFullTicket ?? 0) * 300 + (selectedHalfTicket ?? 0) * 150;
    });
  }

//Next buttons logic
  bool _handleButtonPress() {
    int totalTickets = (selectedFullTicket ?? 0) + (selectedHalfTicket ?? 0);
    return selectedButtonLabels.length == totalTickets;
  }

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
                height: MediaQuery.of(context).size.height * 0.6,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.filmName,
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Full ticket selection
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
                                        viewPrice(); // Update the price when tickets are selected
                                      },
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        21,
                                        (int index) => DropdownMenuItem<int>(
                                          value: index,
                                          child: Text((index).toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 30),

                          // Half ticket selection
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
                                        viewPrice(); // Update the price when tickets are selected
                                      },
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        21,
                                        (int index) => DropdownMenuItem<int>(
                                          value: index,
                                          child: Text((index).toString()),
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

                      // Tickets count.........
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 250,
                            height: 40,
                            child: Center(
                                child: Text(
                              "Tickets count = ${(selectedFullTicket ?? 0) + (selectedHalfTicket ?? 0)}",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Time.............
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _handleButtonPress,
                            child: Text(
                              "${widget.selectedTime}",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      // Price............
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: Text(
                          "Rs.$price/=",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),

              // Sheet..............
              Column(
                children: [
                  Text(
                    "Sheet",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "( F. Rs.300.00 / H. Rs.150.00 )",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.grey,
                height: 5,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ODCGrid(
                  selectedFullTicket: selectedFullTicket,
                  selectedHalfTicket: selectedHalfTicket,
                  selectedButtonLabels: selectedButtonLabels,
                ),
              ),
              SizedBox(
                height: 10,
              ),

              //Next button.........
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        bool allButtonsSelected = _handleButtonPress();
                        int totalTickets = (selectedFullTicket ?? 0) +
                            (selectedHalfTicket ?? 0);

                        if (allButtonsSelected && totalTickets > 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Select Tickets"),
                                content: Text(
                                    "Please select at least one ticket or choose your preferred seats according to ticket count."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Change the button color
                        minimumSize:
                            Size(200, 50), // Set the minimum size of the button
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ODCGrid extends StatefulWidget {
  final int? selectedFullTicket;
  final int? selectedHalfTicket;
  final Set<String> selectedButtonLabels;

  ODCGrid(
      {this.selectedFullTicket,
      this.selectedHalfTicket,
      required this.selectedButtonLabels});

  @override
  _ODCGridState createState() => _ODCGridState();
}

class _ODCGridState extends State<ODCGrid> {
  @override
  Widget build(BuildContext context) {
    int totalTickets =
        (widget.selectedFullTicket ?? 0) + (widget.selectedHalfTicket ?? 0);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 30,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: 250,
      itemBuilder: (context, index) {
        String buttonLabel = 'A${index + 1}';
        bool isSelected = widget.selectedButtonLabels.contains(buttonLabel);

        return GestureDetector(
          onTap: () {
            _handleGridItemPress(buttonLabel, totalTickets);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.green : Colors.grey,
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            child: Text(
              buttonLabel,
              style: TextStyle(fontSize: 10, color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }

  void _handleGridItemPress(String buttonLabel, int totalTickets) {
    if (widget.selectedButtonLabels.length < totalTickets) {
      setState(() {
        if (widget.selectedButtonLabels.contains(buttonLabel)) {
          widget.selectedButtonLabels.remove(buttonLabel);
        } else {
          widget.selectedButtonLabels.add(buttonLabel);
        }
      });
      print('Button $buttonLabel pressed');
    } else if (widget.selectedButtonLabels.contains(buttonLabel)) {
      setState(() {
        widget.selectedButtonLabels.remove(buttonLabel);
      });
      print('Button $buttonLabel unselected');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Select Tickets"),
            content: Text(
                "You can't select more buttons than the total number of tickets."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}
