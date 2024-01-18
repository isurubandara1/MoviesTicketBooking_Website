import "package:flutter/material.dart";
import '../Common.dart';

class Movies extends StatelessWidget {
  const Movies({super.key});

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

            SizedBox(
              height: 20,
            ),

//Now Showing
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text("Now Showing", style: TextStyle(fontSize: 35)),
            ),

            SizedBox(
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
                    SizedBox(
                      height: 10,
                    ),
                    Text("Captain Miller (TAMIL)"),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: Text("Buy Tickets"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/movies/m2.jpg",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Merry Christmas (TAMIL)"),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: Text("Buy Tickets"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/movies/m3.jpg",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Mission Chapter 1 (TAMIL)"),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: Text("Buy Tickets"),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
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
                    SizedBox(
                      height: 10,
                    ),
                    Text("Merry Christmas (HINDI)"),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: Text("Buy Tickets"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/movies/m5.jpg",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Captain Miller (TAMIL)"),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: Text("Buy Tickets"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/movies/m6.jpg",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Villain (විලන්)"),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: Text("Buy Tickets"),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
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
                    SizedBox(
                      height: 10,
                    ),
                    Text("Thaththa"),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: Text("Buy Tickets"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/movies/m8.jpg",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Ape Principal"),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: Text("Buy Tickets"),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text("Upcoming Movies", style: TextStyle(fontSize: 35)),
            ),

            SizedBox(
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
                    SizedBox(
                      height: 10,
                    ),
                    Text("Lal Salaam"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 120,
                      height: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 233, 129, 164),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
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
                    SizedBox(
                      height: 10,
                    ),
                    Text("Thangalaan"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 120,
                      height: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 233, 129, 164),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
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
                    SizedBox(
                      height: 10,
                    ),
                    Text("Kung Fu Panda 4"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 120,
                      height: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 233, 129, 164),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          "Ticket Not Available",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
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
