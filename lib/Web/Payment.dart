// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/foundation.dart' show kIsWeb;

// class PaymentPage extends StatefulWidget {
//   @override
//   _PaymentPageState createState() => _PaymentPageState();
// }

// class _PaymentPageState extends State<PaymentPage> {
//   Map<String, dynamic>? paymentIntent;

//   @override
//   void initState() {
//     super.initState();
//     Stripe.publishableKey = kIsWeb
//         ? "pk_test_your_key_for_web" 
//         : "pk_test_your_key_for_mobile"; 
//   }

//   Future<void> _startPayment() async {
//     try {
//       // Check if the platform is web
//       if (kIsWeb) {
//         Fluttertoast.showToast(
//           msg: 'Web platform is not supported for payments',
//         );
//         return;
//       }

//       paymentIntent = await createPaymentIntent('100', 'INR');

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           billingDetails: BillingDetails(
//             name: 'YOUR NAME',
//             email: 'YOUREMAIL@gmail.com',
//           ),
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//         ),
//       );

//       // Display Payment sheet
//       await displayPaymentSheet();
//     } catch (e) {
//       print(e.toString());
//       Fluttertoast.showToast(msg: e.toString());
//     }
//   }

//   Future<void> displayPaymentSheet() async {
//     try {
//       // Display the payment sheet.
//       await Stripe.instance.presentPaymentSheet();

//       Fluttertoast.showToast(msg: 'Payment successfully completed');
//     } on Exception catch (e) {
//       if (e is StripeException) {
//         Fluttertoast.showToast(
//           msg: 'Error from Stripe: ${e.error.localizedMessage}',
//         );
//       } else {
//         Fluttertoast.showToast(msg: 'Unforeseen error: ${e}');
//       }
//     }
//   }

//   Future<Map<String, dynamic>> createPaymentIntent(
//       String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {
//         'amount': calculateAmount(amount),
//         'currency': currency,
//       };

//       var response = await http.post(
//         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         headers: {
//           'Content-Type': 'application/x-www-form-urlencoded',
//         },
//         body: body,
//       );
//       return json.decode(response.body);
//     } catch (err) {
//       throw Exception(err.toString());
//     }
//   }

//   String calculateAmount(String amount) {
//     final calculatedAmount = (int.parse(amount)) * 100;
//     return calculatedAmount.toString();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stripe Payment Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _startPayment,
//           child: Text('Make Payment'),
//         ),
//       ),
//     );
//   }
// }
