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
        title: Text('Admin View'),
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
                Text('Details for Document ID: $selectedDocument'),
                SizedBox(height: 10),
                _buildDetailRow('Name', data['Name']),
                _buildDetailRow('Email', data['Email']),
                _buildDetailRow('Phone Number', data['Phone number']),
                _buildDetailRow('Movie Name', data['Movie name']),
                _buildDetailRow('Sheets', data['Sheets'].join(', ')),
                _buildDetailRow('Date', data['Date']),
                _buildDetailRow('Time', data['Time']),
                _buildDetailRow('Full Ticket', data['Full Ticket'].toString()),
                _buildDetailRow('Half Ticket', data['Half Ticket'].toString()),
                _buildDetailRow(
                    'Total Tickets', data['Total TicketCount'].toString()),
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

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Text('$label: $value'),
    );
  }
}
