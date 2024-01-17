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
            AutoScrollImages(),
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
            duration: Duration(seconds: 1), curve: Curves.ease);
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
                        style: TextStyle(
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
