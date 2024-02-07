import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminView extends StatefulWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  _AdminViewState createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late TextEditingController _searchController = TextEditingController();
  String? selectedDocument;
  late List<String> documentIds;
  late List<String> filteredDocumentIds;

  @override
  void initState() {
    super.initState();
    documentIds = [];
    filteredDocumentIds = [];
    _fetchDocumentIds();
  }

  Future<void> _fetchDocumentIds() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('bookings').get();
      setState(() {
        documentIds = snapshot.docs.map((document) => document.id).toList();
        filteredDocumentIds = List.from(documentIds);
      });
    } catch (error) {
      // Handle errors while fetching document IDs
      print('Error fetching document IDs: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BOOKING DETAILS',
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.bold, color: Colors.brown),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                labelText: 'Search by Document ID',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          if (selectedDocument != null) ...[
            _buildDocumentDetails(),
            Divider(),
          ],
          Expanded(
            child: ListView.builder(
              itemCount: filteredDocumentIds.length,
              itemBuilder: (context, index) {
                String documentId = filteredDocumentIds[index];
                return ListTile(
                  title: Text(documentId),
                  onTap: () {
                    _searchController.text = documentId;
                    _onSearchChanged(documentId);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onSearchChanged(String query) {
    setState(() {
      selectedDocument = query;
      if (query.isNotEmpty) {
        filteredDocumentIds = documentIds
            .where((documentId) =>
                documentId.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredDocumentIds = List.from(documentIds);
      }
    });
  }

  Widget _buildDocumentDetails() {
    return FutureBuilder<DocumentSnapshot>(
      future: selectedDocument!.isNotEmpty
          ? _firestore.collection('bookings').doc(selectedDocument).get()
          : null,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        try {
          if (snapshot.hasError) {
            throw Exception('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            throw Exception('Document not found');
          }

          // Extract data from the document
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Details for Document ID: $selectedDocument',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                _buildDetailRow('Name', data['Name'], resizeLabel: true),
                _buildDetailRow('Email', data['Email'], resizeLabel: true),
                _buildDetailRow('Phone Number', data['Phone number'],
                    resizeLabel: true),
                _buildDetailRow('Movie Name', data['Movie name'],
                    resizeLabel: true),
                _buildDetailRow('Sheets', data['Sheets'].join(', '),
                    resizeLabel: true),
                _buildDetailRow('Date', data['Date'], resizeLabel: true),
                _buildDetailRow('Time', data['Time'], resizeLabel: true),
                _buildDetailRow('Full Ticket', data['Full Ticket'].toString(),
                    resizeLabel: true),
                _buildDetailRow('Half Ticket', data['Half Ticket'].toString(),
                    resizeLabel: true),
                _buildDetailRow(
                    'Total Tickets', data['Total TicketCount'].toString(),
                    resizeLabel: true),
              ],
            ),
          );
        } catch (error) {
          // Handle errors in fetching document details
          print('Error building document details: $error');
          return Center(
            child: Text('Error fetching document details'),
          );
        }
      },
    );
  }

  Widget _buildDetailRow(String label, String value,
      {bool resizeLabel = false}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 200, right: 200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$label:',
              style: TextStyle(
                fontSize: resizeLabel ? 20 : 20,
                //fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
