import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class Download extends StatefulWidget {
  final String filmName;
  final int fullTicket;
  final int halfTicket;
  final int ticketCount;
  final String time;
  final int price;
  final String date;
  final Set<String> selectedButtonLabels;

  const Download({
    required this.filmName,
    required this.fullTicket,
    required this.halfTicket,
    required this.ticketCount,
    required this.time,
    required this.price,
    required this.date,
    required this.selectedButtonLabels,
  });

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  late Uint8List _imageData;

  @override
  void initState() {
    super.initState();
    loadImageData();
  }

  Future<void> loadImageData() async {
    final ByteData data = await rootBundle.load('assets/logo.png');
    _imageData = data.buffer.asUint8List();
  }

  Future<void> generateAndDownloadPDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              alignment: pw.Alignment.center,
              child: pw.Image(pw.MemoryImage(_imageData)),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              "Movie Ticket Invoice",
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Text("Date: ${widget.date}"),
            pw.Text("Time: ${widget.time}"),
            pw.SizedBox(height: 20),
            pw.Text("Movie Name: ${widget.filmName}"),
            pw.Text(
                "Full Tickets: ${widget.fullTicket} & Half Tickets: ${widget.halfTicket}"),
            pw.Text("Total Tickets: ${widget.ticketCount}"),
            pw.SizedBox(height: 20),
            pw.Text(
                "Selected Seats: ${widget.selectedButtonLabels.join(', ')}"),
            pw.SizedBox(height: 20),
            pw.Text("Total Amount Paid: Rs.${widget.price}/="),
          ],
        ),
      ),
    );

    final Uint8List bytes = await pdf.save();
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..target = 'blank'
      ..download = 'movie_ticket_invoice.pdf'
      ..click();

    html.Url.revokeObjectUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Booking Details",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Movie Name: ${widget.filmName}"),
                      SizedBox(height: 10),
                      Text(
                          "Full Tickets: ${widget.fullTicket} & Half Tickets: ${widget.halfTicket}"),
                      SizedBox(height: 10),
                      Text("Total Tickets: ${widget.ticketCount}"),
                      SizedBox(height: 10),
                      Text("Date: ${widget.date}"),
                      SizedBox(height: 10),
                      Text("Time: ${widget.time}"),
                      SizedBox(height: 10),
                      Text(
                        "Selected Seats: ${widget.selectedButtonLabels.join(', ')}",
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Total Amount Paid: Rs.${widget.price}/=",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: generateAndDownloadPDF,
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Download Invoice"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
