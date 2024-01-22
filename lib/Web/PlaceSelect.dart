import 'package:flutter/material.dart';

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
                height: MediaQuery.of(context).size.height * 0.5,
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
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: Text(
                          "Price = 0",
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
              Column(
                children: [
                  Text(
                    "ODC",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "( F. Rs.650.00 / H. Rs.410.00 )",
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
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Text(
                    "BALCONY",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "( F. Rs.760.00 / H. Rs.530.00 )",
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
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: BalGrid(
                  selectedFullTicket: selectedFullTicket,
                  selectedHalfTicket: selectedHalfTicket,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Text(
                    "BOX",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "( F. Rs.1760.00 )",
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
                child: BoxGrid(
                  selectedFullTicket: selectedFullTicket,
                  selectedHalfTicket: selectedHalfTicket,
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleButtonPress() {
    int totalTickets = (selectedFullTicket ?? 0) + (selectedHalfTicket ?? 0);

    if (totalTickets > 0) {
      // Navigate to the next screen or perform your action here
      print("Button pressed with ticket count: $totalTickets");
    } else {
      // Show a message indicating that at least one ticket should be selected
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Select Tickets"),
            content: Text("Please select at least one ticket."),
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

class ODCGrid extends StatefulWidget {
  final int? selectedFullTicket;
  final int? selectedHalfTicket;

  ODCGrid({this.selectedFullTicket, this.selectedHalfTicket});

  @override
  _ODCGridState createState() => _ODCGridState();
}

class _ODCGridState extends State<ODCGrid> {
  Set<String> selectedButtonLabels = Set();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 30,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: 80,
      itemBuilder: (context, index) {
        String buttonLabel = 'A${index + 1}';
        bool isSelected = selectedButtonLabels.contains(buttonLabel);

        return GestureDetector(
          onTap: () {
            _handleGridItemPress(buttonLabel);
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

  void _handleGridItemPress(String buttonLabel) {
    int totalTickets =
        (widget.selectedFullTicket ?? 0) + (widget.selectedHalfTicket ?? 0);

    if (totalTickets > selectedButtonLabels.length) {
      setState(() {
        if (selectedButtonLabels.contains(buttonLabel)) {
          selectedButtonLabels.remove(buttonLabel);
        } else {
          selectedButtonLabels.add(buttonLabel);
        }
      });
      print('Button $buttonLabel pressed');
    } else if (selectedButtonLabels.contains(buttonLabel)) {
      // Toggle the selection if the button is already selected
      setState(() {
        selectedButtonLabels.remove(buttonLabel);
      });
      print('Button $buttonLabel unselected');
    } else {
      // Show a message indicating that the user can't select more buttons
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

class BalGrid extends StatefulWidget {
  final int? selectedFullTicket;
  final int? selectedHalfTicket;

  BalGrid({this.selectedFullTicket, this.selectedHalfTicket});

  @override
  _BalGridState createState() => _BalGridState();
}

class _BalGridState extends State<BalGrid> {
  Set<String> selectedButtonLabels = Set();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 30,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: 50,
      itemBuilder: (context, index) {
        String buttonLabel = 'B${index + 1}';
        bool isSelected = selectedButtonLabels.contains(buttonLabel);

        return GestureDetector(
          onTap: () {
            _handleGridItemPress(buttonLabel);
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

  void _handleGridItemPress(String buttonLabel) {
    int totalTickets =
        (widget.selectedFullTicket ?? 0) + (widget.selectedHalfTicket ?? 0);

    if (totalTickets > selectedButtonLabels.length) {
      setState(() {
        if (selectedButtonLabels.contains(buttonLabel)) {
          selectedButtonLabels.remove(buttonLabel);
        } else {
          selectedButtonLabels.add(buttonLabel);
        }
      });
      print('Button $buttonLabel pressed');
    } else if (selectedButtonLabels.contains(buttonLabel)) {
      // Toggle the selection if the button is already selected
      setState(() {
        selectedButtonLabels.remove(buttonLabel);
      });
      print('Button $buttonLabel unselected');
    } else {
      // Show a message indicating that the user can't select more buttons
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

class BoxGrid extends StatefulWidget {
  final int? selectedFullTicket;
  final int? selectedHalfTicket;

  BoxGrid({this.selectedFullTicket, this.selectedHalfTicket});

  @override
  _BoxGridState createState() => _BoxGridState();
}

class _BoxGridState extends State<BoxGrid> {
  Set<String> selectedButtonLabels = Set();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 30,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        String buttonLabel = 'C${index + 1}';
        bool isSelected = selectedButtonLabels.contains(buttonLabel);

        return GestureDetector(
          onTap: () {
            _handleGridItemPress(buttonLabel);
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

// Common method for all sections
  void _handleGridItemPress(String buttonLabel) {
    int totalTickets =
        (widget.selectedFullTicket ?? 0) + (widget.selectedHalfTicket ?? 0);

    if (totalTickets > selectedButtonLabels.length) {
      setState(() {
        if (selectedButtonLabels.contains(buttonLabel)) {
          selectedButtonLabels.remove(buttonLabel);
        } else {
          selectedButtonLabels.add(buttonLabel);
        }
      });
      print('Button $buttonLabel pressed');
    } else if (selectedButtonLabels.contains(buttonLabel)) {
      // Toggle the selection if the button is already selected
      setState(() {
        selectedButtonLabels.remove(buttonLabel);
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
