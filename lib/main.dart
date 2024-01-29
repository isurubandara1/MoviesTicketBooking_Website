import "package:firebase_core/firebase_core.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:movies_ticket_booking_website/Web/Contact.dart";
import "package:movies_ticket_booking_website/Web/Home.dart";
import "package:movies_ticket_booking_website/Web/Movies.dart";
import "Web/ConfirmBooking.dart";
import 'Web/PlaceSelect.dart';
import "Web/ShowTimes.dart";
import 'package:flutter_stripe/flutter_stripe.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBSiQwylDva_xpLCsiC9fZLc9R002U1ARQ",
            authDomain: "movietickets-3ddad.firebaseapp.com",
            projectId: "movietickets-3ddad",
            storageBucket: "movietickets-3ddad.appspot.com",
            messagingSenderId: "560762092474",
            appId: "1:560762092474:web:dce5f4891ff5433ee0bb83"));
  }
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
