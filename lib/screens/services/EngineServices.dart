import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EngineServices extends StatefulWidget {
  const EngineServices({super.key});

  @override
  State<EngineServices> createState() => _EngineServicesState();
}

class _EngineServicesState extends State<EngineServices> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? loggedInUser;
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
        title: const Text("ENGINE SERVICES"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
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
                  return Container(
                    child: ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot snap) {
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
                                  'Service': ['Oil Change'],
                                });
                              },
                              child: const Card(
                                color: Colors.white,
                                margin: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 75.0),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.add,
                                    color: Colors.teal,
                                    size: 20.0,
                                  ),
                                  title: Text(
                                    'Oil Change',
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
                                  'Service': ['Belt Tension Adjustment'],
                                });
                              },
                              child: const Card(
                                color: Colors.white,
                                margin: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 75.0),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.add,
                                    color: Colors.teal,
                                    size: 20.0,
                                  ),
                                  title: Text(
                                    'Belt Tension Adjustment',
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
                                  'Service': ['Ignition Coil Replacement'],
                                });
                              },
                              child: const Card(
                                color: Colors.white,
                                margin: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 75.0),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.add,
                                    color: Colors.teal,
                                    size: 20.0,
                                  ),
                                  title: Text(
                                    'Ignition Coil Replacement',
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
                                  'Service': ['Coolant Flush'],
                                });
                              },
                              child: const Card(
                                color: Colors.white,
                                margin: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 75.0),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.add,
                                    color: Colors.teal,
                                    size: 20.0,
                                  ),
                                  title: Text(
                                    'Coolant Flush',
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
                                  'Service': ['Transmission Fluid Change'],
                                });
                              },
                              child: const Card(
                                color: Colors.white,
                                margin: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 75.0),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.add,
                                    color: Colors.teal,
                                    size: 20.0,
                                  ),
                                  title: Text(
                                    'Transmission Fluid Change',
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
