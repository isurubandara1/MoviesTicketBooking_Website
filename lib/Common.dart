import "package:flutter/material.dart";
import "package:movies_ticket_booking_website/Web/Contact.dart";
import "package:movies_ticket_booking_website/Web/Home.dart";
import "package:movies_ticket_booking_website/Web/Movies.dart";
import "package:movies_ticket_booking_website/Web/ShowTimes.dart";

import "Web/ViewDetails.dart";

Widget Navbar(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.width * 0.05,
    color: Colors.black87,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: const AssetImage("assets/logo.png"),
          height: MediaQuery.of(context).size.width * 0.05,
        ),
        const SizedBox(width: 10), // Adjust the size as needed
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
          child: const Text(
            "Home",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Movies(
                        movieName: '',
                      )),
            );
          },
          child: const Text(
            "Movies",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewDetails()),
            );
          },
          child: const Text(
            "View Details",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Movies(
                        movieName: '',
                      )),
            );
          },
          child: const Text(
            "Buy Tickets",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Contact()),
            );
          },
          child: const Text(
            "Contact Us",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
          ),
        ),
        const SizedBox(
          width: 60,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Movies(
                        movieName: '',
                      )),
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
  );
}

Widget footerBar(BuildContext context) {
  return Container(
      height: MediaQuery.of(context).size.width * 0.15,
      color: Colors.black87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: const AssetImage("assets/logo.png"),
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    const Text(
                      "EPR FILMS & THEATERS",
                      style: TextStyle(
                          fontSize: 27,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              const Text(
                "© 2024 EPR Movies. All Rights Reserved.",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        child: const Text(
                          "Home",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Movies(
                                      movieName: '',
                                    )),
                          );
                        },
                        child: const Text(
                          "Movies",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Movies(
                                      movieName: '',
                                    )),
                          );
                        },
                        child: const Text(
                          "View Details",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Movies(
                                      movieName: '',
                                    )),
                          );
                        },
                        child: const Text(
                          "Buy Tickets",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Contact()),
                          );
                        },
                        child: const Text(
                          "Contact Us",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ));
}
