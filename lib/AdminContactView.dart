import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminContactView extends StatefulWidget {
  const AdminContactView({Key? key}) : super(key: key);

  @override
  _AdminContactViewState createState() => _AdminContactViewState();
}

class _AdminContactViewState extends State<AdminContactView> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late TextEditingController _searchController = TextEditingController();
  String? selectedDocument;
  late List<String> documentIds;
  late List<String> filteredDocumentIds;

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController messagesController;

  @override
  void initState() {
    super.initState();
    documentIds = [];
    filteredDocumentIds = [];
    _fetchDocumentIds();

    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    messagesController = TextEditingController();
  }

  Future<void> _fetchDocumentIds() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('contacts').get();
      setState(() {
        documentIds = snapshot.docs.map((document) => document.id).toList();
        filteredDocumentIds = List.from(documentIds);
      });
    } catch (error) {
      print('Error fetching document IDs: $error');
    }
  }

  void _onDeletePressed(String documentId) async {
    try {
      await _firestore.collection('contacts').doc(documentId).delete();
      _fetchDocumentIds();
      setState(() {
        selectedDocument = null;
      });
    } catch (error) {
      print('Error deleting document: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CONTACT DETAILS',
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
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
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(documentId),
                      ElevatedButton(
                        onPressed: () {
                          _onDeletePressed(documentId);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
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
          ? _firestore.collection('contacts').doc(selectedDocument).get()
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
                _buildDetailRow('Name', data['name'], resizeLabel: true),
                SizedBox(height: 10),
                _buildDetailRow('Email', data['email'], resizeLabel: true),
                SizedBox(height: 10),
                _buildDetailRow('Phone Number', data['phone'],
                    resizeLabel: true),
                SizedBox(height: 10),
                _buildDetailRow('Messages', data['message'], resizeLabel: true),
              ],
            ),
          );
        } catch (error) {
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
        padding: const EdgeInsets.only(left: 300, right: 300),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$label:',
              style: TextStyle(
                fontSize: resizeLabel ? 20 : 20,
                color: Colors.black,
              ),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
