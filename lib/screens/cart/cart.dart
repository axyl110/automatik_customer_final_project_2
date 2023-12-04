import 'package:automatik_customer_final_project/widgets/dimentions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? loggedInUser;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('Customers');

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
        });
      }
    } catch (e) {
      print(e);
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
                            right: Dimensions.width20),
                        child: ListView(
                          children:
                              snapshot.data!.docs.map((DocumentSnapshot snap) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // CircleAvatar(
                                //     radius: 85,
                                //     backgroundColor: Colors.blue,
                                //     child: ClipRRect(
                                //       borderRadius: BorderRadius.circular(50),
                                //       child: Image.network(
                                //         snap['ProfileImage'],
                                //         fit: BoxFit.cover,
                                //       ),
                                //     )),
                                // SizedBox(height: Dimensions.height20),
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
                                      snap['Service'],
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
                    }),
              ),
            ],
          )),
    );
  }
}
