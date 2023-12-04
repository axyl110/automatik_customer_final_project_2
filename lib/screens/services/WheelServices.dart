import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WheelServices extends StatefulWidget {
  const WheelServices({super.key});

  @override
  State<WheelServices> createState() => _WheelServicesState();
}

class _WheelServicesState extends State<WheelServices> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? loggedInUser;
  var collection = FirebaseFirestore.instance.collection('ORDER');

  final CollectionReference users =
      FirebaseFirestore.instance.collection('Customers');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("WHEEL SERVICES"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Customers')
                    .where('Email', isEqualTo: loggedInUser?.email)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return const Text("Loading...");
                  return ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot snap) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              users.doc(snap.id).set({
                                'Name': snap['Name'],
                                'Phone': snap['Phone'],
                                'Email': snap['Email'],
                                'Address': snap['Address'],
                                'ProfileImage': snap['ProfileImage'],
                                'Service': ['Wheel Alignment'],
                              });
                            },
                            child: const Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 75.0),
                              child: ListTile(
                                title: Text(
                                  'Wheel Alignment',
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              users.doc(snap.id).set({
                                'Name': snap['Name'],
                                'Phone': snap['Phone'],
                                'Email': snap['Email'],
                                'Address': snap['Address'],
                                'ProfileImage': snap['ProfileImage'],
                                'Service': [
                                  'Tire Installation and Replacement'
                                ],
                              });
                            },
                            child: const Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 75.0),
                              child: ListTile(
                                title: Text(
                                  'Tire Installation and Replacement',
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              users.doc(snap.id).set({
                                'Name': snap['Name'],
                                'Phone': snap['Phone'],
                                'Email': snap['Email'],
                                'Address': snap['Address'],
                                'ProfileImage': snap['ProfileImage'],
                                'Service': ['Tire Repair'],
                              });
                            },
                            child: const Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 75.0),
                              child: ListTile(
                                title: Text(
                                  'Tire Repair',
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              users.doc(snap.id).set({
                                'Name': snap['Name'],
                                'Phone': snap['Phone'],
                                'Email': snap['Email'],
                                'Address': snap['Address'],
                                'ProfileImage': snap['ProfileImage'],
                                'Service': ['Valve Stem Replacement'],
                              });
                            },
                            child: const Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 75.0),
                              child: ListTile(
                                title: Text(
                                  'Valve Stem Replacement',
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              users.doc(snap.id).set({
                                'Name': snap['Name'],
                                'Phone': snap['Phone'],
                                'Email': snap['Email'],
                                'Address': snap['Address'],
                                'ProfileImage': snap['ProfileImage'],
                                'Service': ['Wheel Cleaning and Maintenance'],
                              });
                            },
                            child: const Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 75.0),
                              child: ListTile(
                                title: Text(
                                  'Wheel Cleaning and Maintenance',
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
