import 'package:flutter/material.dart';
import '../Common.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NavBar
            Navbar(context),

            // Main image
            Image.asset(
              "assets/movies/movies.jpg",
            ),

            SizedBox(
              height: 20,
            ),

            // Contact Information
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact EAP Films & Theatres',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
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
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Form
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  FormFieldLabel(label: 'Name'),
                  RoundedInputField(fontSize: 14),
                  SizedBox(height: 10),
                  FormFieldLabel(label: 'Phone Number'),
                  RoundedInputField(fontSize: 14),
                  SizedBox(height: 10),
                  FormFieldLabel(label: 'Email Address'),
                  RoundedInputField(fontSize: 14),
                  SizedBox(height: 10),
                  FormFieldLabel(label: 'Message'),
                  RoundedInputField(fontSize: 14, maxLines: null),
                  SizedBox(height: 20),
                ],
              ),
            ),

            // Buttons
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Row(
                children: [
                  HoverButton(
                    label: 'Reset',
                    backgroundColor: Colors.grey,
                    hoverColor: Colors.grey.shade800, // Dark grey on hover
                  ),
                  SizedBox(width: 10),
                  HoverButton(
                    label: 'Send',
                    backgroundColor: Colors.red,
                    hoverColor: Colors.red.shade800, // Dark red on hover
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // Footer
            footerBar(context),
          ],
        ),
      ),
    );
  }
}

class RoundedInputField extends StatefulWidget {
  final int? maxLines;
  final double? fontSize;

  const RoundedInputField({
    Key? key,
    this.maxLines = 1,
    this.fontSize,
  }) : super(key: key);

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  bool hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      width: 650,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: hasFocus ? Colors.blue : Colors.grey,
        ),
      ),
      child: TextFormField(
        style: TextStyle(fontSize: widget.fontSize),
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        maxLines: widget.maxLines,
        onTap: () {
          setState(() {
            hasFocus = true;
          });
        },
        onFieldSubmitted: (value) {
          setState(() {
            hasFocus = false;
          });
        },
        onEditingComplete: () {
          setState(() {
            hasFocus = false;
          });
        },
      ),
    );
  }
}

class FormFieldLabel extends StatelessWidget {
  final String label;

  const FormFieldLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
    );
  }
}

class HoverButton extends StatefulWidget {
  final String label;
  final Color backgroundColor;
  final Color hoverColor;

  const HoverButton({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.hoverColor,
  }) : super(key: key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Container(
        width: 80,
        height: 60,
        decoration: BoxDecoration(
          color: isHovered ? widget.hoverColor : widget.backgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextButton(
          onPressed: () {},
          child: Text(
            widget.label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
