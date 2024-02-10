import 'package:flutter/material.dart';
import '../Common.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messagesController = TextEditingController();

  final CollectionReference contactCollection =
      FirebaseFirestore.instance.collection('contacts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Navbar(context),
            Image.asset("assets/movies/movies.jpg"),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact EAP Films & Theatres',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'EAP Films and Theatres offices are situated at the Savoy building, Wellawatta - Colombo 6. Should you wish to contact us for any matter, you can reach us at the following address or contact numbers listed below.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Email Support: help@eapmovies.com',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Email our support team for other queries regarding booking changes, refund details, bank issues.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'If you wish to contact us via email, please fill in the following form, and we will get in touch with you at the earliest.',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter Your Name',
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                  hintText: 'Enter Phone Number',
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter Your Email',
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                maxLines: 4,
                controller: messagesController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Messages',
                  hintText: 'Type Your messages',
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (_validateForm()) {
                      await _saveContactToFirestore();
                    }
                  },
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                    onPrimary: Colors.white,
                    fixedSize: Size(100, 50),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    _clearTextFields();
                  },
                  child: Text("Clear"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    onPrimary: Colors.white,
                    fixedSize: Size(100, 50),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            footerBar(context),
          ],
        ),
      ),
    );
  }

  bool _validateForm() {
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        messagesController.text.isEmpty) {
      _showSnackBar("Fill all the text fields before submit", false);
      return false;
    }
    return true;
  }

  void _showSnackBar(String message, bool isSuccess) {
    Color backgroundColor = isSuccess ? Colors.green : Colors.red;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: backgroundColor,
      ),
    );
  }

  Future<void> _saveContactToFirestore() async {
    String name = nameController.text.trim();
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    String message = messagesController.text.trim();

    Map<String, dynamic> contactData = {
      'name': name,
      'phone': phone,
      'email': email,
      'message': message,
    };

    try {
      await contactCollection.add(contactData);
      _clearTextFields();
      _showSnackBar('Contact details added to Firestore successfully!', true);
    } catch (error) {
      _showSnackBar('Error adding contact details to Firestore: $error', false);
    }
  }

  void _clearTextFields() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    messagesController.clear();
  }
}
