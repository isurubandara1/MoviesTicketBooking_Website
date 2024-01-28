import 'package:flutter/material.dart';
import 'package:movies_ticket_booking_website/Common.dart';

class ViewDetails extends StatelessWidget {
  const ViewDetails({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Navbar(context),
            Image.asset(
              "assets/movies/movies.jpg",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 180, top: 80, bottom: 40),
              child: Table(
                children: [
                  const TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(left: 170, bottom: 20),
                          child: Text(
                            "Movie",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(left: 140, bottom: 20),
                          child: Text(
                            "Date",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, bottom: 20),
                          child: Text(
                            "Time",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Row 1
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  "assets/movies/m1.jpg",
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Captain Miller (TAMIL)",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(left: 80, top: 80),
                          child: Text(
                            "From 2024/02/05\nTo\t\t\t\t\t 2024/02/15",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: Text(
                            "7.30 a.m.\n1.30 p.m.",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // 2 nd row
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  "assets/movies/m2.jpg",
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Merry Christmas (TAMIL)",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(left: 80, top: 80),
                          child: Text(
                            "From 2024/02/05\nTo\t\t\t\t\t 2024/02/15",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: Text(
                            "9.30 a.m.\n4.30 p.m.",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //3 rd row

                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  "assets/movies/m3.jpg",
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Mission Chapter1 (TAMIL)",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(left: 80, top: 80),
                          child: Text(
                            "From 2024/02/20\nTo\t\t\t\t\t 2024/02/28",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: Text(
                            "7.30 a.m.\n1.30 p.m.",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //row 4

                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  "assets/movies/m4.jpg",
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Merry Christmas (HINDI)",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(left: 80, top: 80),
                          child: Text(
                            "From 2024/02/20\nTo\t\t\t\t\t 2024/02/28",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: Text(
                            "10.30 a.m.\n4.30 p.m.",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //row5

                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  "assets/movies/m5.jpg",
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Raider (SINHALA)",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(left: 80, top: 80),
                          child: Text(
                            "From 2024/03/01\nTo\t\t\t\t\t 2024/03/12",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: Text(
                            "7.30 a.m.\n3.30 p.m.",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //row6

                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  "assets/movies/m6.jpg",
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Vilan (SINHALA)",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(left: 80, top: 80),
                          child: Text(
                            "From 2024/03/01\nTo\t\t\t\t\t 2024/03/12",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: Text(
                            "10.00 a.m.\n7.00 p.m.",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //row7

                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  "assets/movies/m7.jpg",
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Thaththa (SINHALA)",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(left: 80, top: 80),
                          child: Text(
                            "From 2024/03/14\nTo\t\t\t\t\t 2024/03/30",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: Text(
                            "7.30 a.m.\n3.30 p.m.",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //row8

                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  "assets/movies/m8.jpg",
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Ape Principal (SINHALA)",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(left: 80, top: 80),
                          child: Text(
                            "From 2024/03/14\nTo\t\t\t\t\t 2024/03/30",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: Text(
                            "10.00 a.m.\n7.00 p.m.",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            footerBar(context),
          ],
        ),
      ),
    );
  }
}
