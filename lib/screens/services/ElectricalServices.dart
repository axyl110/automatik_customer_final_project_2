import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ElectricalServices extends StatefulWidget {
  const ElectricalServices({super.key});

  @override
  State<ElectricalServices> createState() => _ElectricalServicesState();
}

class _ElectricalServicesState extends State<ElectricalServices> {
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
        title: const Text("ELECTRICAL SERVICES"),
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
                                'Service': ['Battery Replacement'],
                              });
                            },
                            child: const Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 75.0),
                              child: ListTile(
                                title: Text(
                                  'Battery Replacement',
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
                                  'Alternator Testing and Replacement'
                                ],
                              });
                            },
                            child: const Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 75.0),
                              child: ListTile(
                                title: Text(
                                  'Alternator Testing and Replacement',
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
                                'Service': ['Starter Motor Repair'],
                              });
                            },
                            child: const Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 75.0),
                              child: ListTile(
                                title: Text(
                                  'Starter Motor Repair',
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
                                'Service': ['Fuse Replacement'],
                              });
                            },
                            child: const Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 75.0),
                              child: ListTile(
                                title: Text(
                                  'Fuse Replacement',
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
                                  'Accessory Installation and Replacement'
                                ],
                              });
                            },
                            child: const Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 75.0),
                              child: ListTile(
                                title: Text(
                                  'Accessory Installation and Replacement',
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
