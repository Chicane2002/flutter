import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisplayImageFromFirestore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Display Image from Firestore')),
        body: Center(
          child: FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance.collection('images').get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                // Iterate through the documents in the QuerySnapshot

                if (data != null && data.containsKey('image_url')) {
                  // Retrieve image URL from the data map
                  String imageUrl = data['image_url'];

                  return Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageUrl),
                      ),
                    ),
                  );
                } else {
                  return Text('Image URL not found in documents.');
                }
              }),
        ),
      ),
    );
  }
}

void main() {
  runApp(DisplayImageFromFirestore());
}
