import "package:flutter/material.dart";
import "package:movies_ticket_booking_website/Web/Home.dart";
import "package:movies_ticket_booking_website/Web/Movies.dart";

import 'Web/PlaceSelect.dart';
import "Web/ShowTimes.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowTimes(),
    );
  }
}
