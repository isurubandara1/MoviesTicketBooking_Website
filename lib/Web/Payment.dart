import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  void initState() {
    super.initState();
    Stripe.publishableKey = 'YOUR_PUBLISHABLE_KEY';
    Stripe.merchantIdentifier = 'your_merchant_identifier';
    Stripe.androidPayMode = 'test';
  }

  Future<void> _startPayment() async {
    try {
      PaymentMethod paymentMethod = await Stripe.paymentMethodFromCardForm();
      PaymentIntentResult paymentIntentResult =
          await Stripe.confirmPaymentIntent(
        clientSecret: 'YOUR_CLIENT_SECRET',
        paymentMethodId: paymentMethod.id,
      );

      if (paymentIntentResult.status == 'succeeded') {
        print('Payment succeeded');
        // Navigate to the success page or perform further actions
      } else {
        print('Payment failed');
        // Show an error message or handle accordingly
      }
    } catch (error) {
      print('Error during payment: $error');
      // Handle errors and show an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _startPayment,
          child: Text('Make Payment'),
        ),
      ),
    );
  }
}
