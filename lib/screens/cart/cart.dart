import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:automatik_customer_final_project/widgets/dimentions.dart';

class CartPage extends StatefulWidget {
  final List<String> selectedServices;

  const CartPage({Key? key, required this.selectedServices}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState(selectedServices);
}

class _CartPageState extends State<CartPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? loggedInUser;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('Customers');

  final List<String> selectedServices;

  _CartPageState(this.selectedServices);

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        setState(() {
          loggedInUser = user;
          print('this is:  ${loggedInUser!.email}');
          // Update Firestore with selected services
          updateFirestore();
        });
      }
    } catch (e) {
      print(e);
    }
  }

  // Update Firestore document with selected services
  void updateFirestore() {
    if (loggedInUser != null) {
      users.doc(loggedInUser!.uid).update({
        'Service': FieldValue.arrayUnion(selectedServices),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin:
            EdgeInsets.only(top: Dimensions.height20 + Dimensions.height30),
        width: double.maxFinite,
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Customers')
                    .where('Email', isEqualTo: loggedInUser!.email)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return const Text("Loading...");
                  return Container(
                    padding: EdgeInsets.only(
                      top: Dimensions.height10,
                      bottom: Dimensions.height10,
                      left: Dimensions.width30,
                      right: Dimensions.width20,
                    ),
                    child: ListView(
                      children: snapshot.data!.docs.map((DocumentSnapshot snap) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.person),
                                Container(width: 25),
                                Text(
                                  snap['Name'],
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Dimensions.height20),
                            //phone
                            Row(
                              children: [
                                const Icon(Icons.phone),
                                Container(width: 25),
                                Text(
                                  snap['Phone'],
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Dimensions.height20),
                            //email
                            Row(
                              children: [
                                const Icon(Icons.email),
                                Container(width: 25),
                                Text(
                                  snap['Email'],
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Dimensions.height20),
                            //address
                            Row(
                              children: [
                                const Icon(Icons.location_on),
                                Container(width: 25),
                                Text(
                                  snap['Address'],
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Dimensions.height20),
                            //service
                            Row(
                              children: [
                                const Icon(Icons.miscellaneous_services),
                                Container(width: 25),
                                Text(
                                  selectedServices.join(', '), // Join selected services into a single string
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
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