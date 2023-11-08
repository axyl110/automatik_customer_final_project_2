import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BrakeServices extends StatefulWidget {
  const BrakeServices({super.key});

  @override
  State<BrakeServices> createState() => _BrakeServicesState();
}

class _BrakeServicesState extends State<BrakeServices> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? loggedInUser;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('Customers');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("BRAKE SERVICES"),
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
                                  'Service': ['Brake Inspection'],
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
                                    'Brake Inspection',
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
                                users.doc(snap.id).add({
                                  'Name': snap['Name'],
                                  'Phone': snap['Phone'],
                                  'Email': snap['Email'],
                                  'Address': snap['Address'],
                                  'Service': ['Brake Pad Replacement'],
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
                                    'Brake Pad Replacement',
                                    style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // const Card(
                            //   color: Colors.white,
                            //   margin: EdgeInsets.symmetric(
                            //       vertical: 15.0, horizontal: 75.0),
                            //   child: ListTile(
                            //     leading: Icon(
                            //       Icons.adjust_outlined,
                            //       color: Colors.teal,
                            //       size: 20.0,
                            //     ),
                            //     title: Text(
                            //       'Brake Pad Replacement',
                            //       style: TextStyle(
                            //         color: Colors.teal,
                            //         fontWeight: FontWeight.bold,
                            //         fontSize: 20.0,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            const Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 75.0),
                              child: ListTile(
                                leading: Icon(
                                  Icons.find_replace_outlined,
                                  color: Colors.teal,
                                  size: 20.0,
                                ),
                                title: Text(
                                  "Brake Fluid Replacement",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ),
                            ),
                            const Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 75.0),
                              child: ListTile(
                                leading: Icon(
                                  Icons.water_sharp,
                                  color: Colors.teal,
                                  size: 20.0,
                                ),
                                title: Text(
                                  "Brake Caliper Service",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ),
                            ),
                            const Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 75.0),
                              child: ListTile(
                                leading: Icon(
                                  Icons.wash_outlined,
                                  color: Colors.teal,
                                  size: 20.0,
                                ),
                                title: Text(
                                  "Emergency Brake Replacement",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}
