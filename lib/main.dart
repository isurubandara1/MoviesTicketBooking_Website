import "package:firebase_core/firebase_core.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:movies_ticket_booking_website/AdminLogin.dart";
import 'package:movies_ticket_booking_website/UserWeb/Contact.dart';
import 'package:movies_ticket_booking_website/UserWeb/Home.dart';
import 'package:movies_ticket_booking_website/UserWeb/Movies.dart';
import 'AdminView.dart';
import 'Secret.dart';
import 'UserWeb/ConfirmBooking.dart';
import 'UserWeb/Payment.dart';
import 'UserWeb/PlaceSelect.dart';
import 'UserWeb/ShowTimes.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: APIKEY,
            authDomain: AUTHDOMAIN,
            projectId: PROJECTID,
            storageBucket: STORAGEBUCKET,
            messagingSenderId: MESSAGINGSENDERID,
            appId: APPID));
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
