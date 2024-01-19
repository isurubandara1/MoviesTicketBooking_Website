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
                height: MediaQuery.of(context).size.height * 0.5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      //Film name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Film name",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white)),
                        ],
                      ),

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
                              borderRadius: BorderRadius.circular(20),
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
                            onPressed: () {},
                            child: Text(
                              "7:30 AM",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),

//ODC
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
                child: ODCGrid(),
              ),
              SizedBox(
                height: 50,
              ),

//BALCONY
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
                child: BalGrid(),
              ),
              SizedBox(
                height: 50,
              ),

//BOX
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
                child: BoxGrid(),
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
}

//For ODC
class ODCGrid extends StatelessWidget {
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
        return InkWell(
          onTap: () => print('Button $buttonLabel pressed'),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue, // Specify border color
                width: 1, // Specify border width
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
}

//For BALCONY
class BalGrid extends StatelessWidget {
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
        return InkWell(
          onTap: () => print('Button $buttonLabel pressed'),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
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
}

//For BOX
class BoxGrid extends StatelessWidget {
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
        return InkWell(
          onTap: () => print('Button $buttonLabel pressed'),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
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
}
