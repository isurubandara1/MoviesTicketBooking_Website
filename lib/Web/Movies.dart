import "package:flutter/material.dart";
import 'package:movies_ticket_booking_website/Web/ShowTimes.dart';
import '../Common.dart';

class Movies extends StatelessWidget {
  final name;
  const Movies({this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
//NavBar
            Navbar(context),

//Main image
            Image.asset(
              "assets/movies/movies.jpg",
            ),

            const SizedBox(
              height: 20,
            ),

//Now Showing
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text("Now Showing", style: TextStyle(fontSize: 35)),
            ),

            const SizedBox(
              height: 20,
            ),

//First row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/movies/m1.jpg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Captain Miller (TAMIL)"),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowTimes(
                                  movieName: "Captain Miller (TAMIL)")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: const Text("Buy Tickets"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/movies/m2.jpg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Merry Christmas (TAMIL)"),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowTimes(
                                  movieName: "Merry Christmas (TAMIL)")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: const Text("Buy Tickets"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/movies/m3.jpg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Mission Chapter 1 (TAMIL)"),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowTimes(
                                  movieName: "Mission Chapter 1 (TAMIL)")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: const Text("Buy Tickets"),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: 30,
            ),

//Second row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/movies/m4.jpg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Merry Christmas (HINDI)"),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowTimes(
                                  movieName: "Merry Christmas (HINDI)")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: const Text("Buy Tickets"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/movies/m5.jpg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Raider (SINHALA)"),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ShowTimes(movieName: "Raider (SINHALA)")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: const Text("Buy Tickets"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/movies/m6.jpg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Vilan (SINHALA)"),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ShowTimes(movieName: "Vilan (SINHALA)")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: const Text("Buy Tickets"),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: 30,
            ),

//Thired row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/movies/m7.jpg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Thaththa (SINHALA)"),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ShowTimes(movieName: "Thaththa (SINHALA)")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: const Text("Buy Tickets"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/movies/m8.jpg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Ape Principal (SINHALA)"),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowTimes(
                                  movieName: "Ape Principal (SINHALA)")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: const Text("Buy Tickets"),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text("Upcoming Movies", style: TextStyle(fontSize: 35)),
            ),

            const SizedBox(
              height: 20,
            ),

//First row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/movies/mu1.jpg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Lal Salaam"),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 120,
                      height: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 233, 129, 164),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Text(
                          "Ticket Not Available",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/movies/mu2.jpg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Thangalaan"),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 120,
                      height: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 233, 129, 164),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Text(
                          "Ticket Not Available",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/movies/mu3.jpg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Kung Fu Panda 4"),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 120,
                      height: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 233, 129, 164),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Text(
                          "Ticket Not Available",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

//Footer
            footerBar(context),
          ],
        ),
      ),
    );
  }
}
