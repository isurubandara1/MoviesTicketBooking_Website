import 'package:flutter/material.dart';
import "../Common.dart";
import 'dart:async';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Navbar(context),
            const AutoScrollImages(),
            SizedBox(
              height: 40.0,
            ),
            CinemaBanner(),
            footerBar(context),
          ],
        ),
      ),
    );
  }
}

class AutoScrollImages extends StatefulWidget {
  const AutoScrollImages({super.key});

  @override
  _AutoScrollImagesState createState() => _AutoScrollImagesState();
}

class _AutoScrollImagesState extends State<AutoScrollImages> {
  final List<String> images = [
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
    "5.jpg",
    "6.jpg",
    "7.jpg",
  ];

  final List<String> imageTexts = [
    "Thaththa [SINHALA]",
    "Villain [SINHALA]",
    "Mission Chapter 1 [TAMIL]",
    "Ayalaan [TAMIL]",
    "Captain Miller [ENGLISH]",
    "Merry Christmas [TAMIL]",
    "Kandak Sema [SINHALA]",
  ];

  final PageController _controller = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_controller.page == images.length - 1) {
        _controller.animateToPage(0,
            duration: const Duration(seconds: 2), curve: Curves.ease);
      } else {
        _controller.nextPage(
            duration: const Duration(seconds: 1), curve: Curves.ease);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.width * 0.4,
            width: double.infinity,
            child: PageView.builder(
              controller: _controller,
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset("assets/${images[index]}", fit: BoxFit.cover),
                    Padding(
                      padding: const EdgeInsets.all(50),
                      child: Text(
                        imageTexts[index], // Use the corresponding text
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//CinemaBanner
class CinemaBanner extends StatelessWidget {
  const CinemaBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 720,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 170),
                  child: Text(
                    "Sinexpo 3D - Kurunegala",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Image.asset(
                  "assets/Sinexpologo.jpg",
                  width: 1050,
                  alignment: Alignment.topCenter,
                  height: 500,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 170),
                  child: Text(
                    "Sinexpo Cinema in Kurunegala is one of the top-end movie cinemas operated by EAP Films and Theaters outside Colombo. It is one of the most sought-after cinemas by patrons living outside Colombo.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 13.5,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    "Contact Details",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Address: No 18, South Circular Rd, Kurunegala.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Telephone: +94377214542",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Text(
                    "Email: sinexpo@eapmovies.com",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Facilities",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/park.jpg'),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Car Parking',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Car parking available for customers.',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/snack.jpg"),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Snack Shop",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Text(
                              "Enjoy snacks and special offers at our snack shop.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/restau.jpg"),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Restaurant",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Enjoy delicious meals and great hospitality at our restaurants.',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
