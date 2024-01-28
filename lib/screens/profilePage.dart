import 'package:automatik_customer_final_project/widgets/auth_service.dart';
import 'package:automatik_customer_final_project/widgets/dimentions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'authentication/loginPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? loggedInUser;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
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
                                CircleAvatar(
                                    radius: 85,
                                    backgroundColor: Colors.blue,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        snap['ProfileImage'],
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                                SizedBox(height: Dimensions.height20),
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
                                SizedBox(height: Dimensions.height20 * 4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _update(snap);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius15),
                                            boxShadow: [
                                              BoxShadow(
                                                  spreadRadius: 12,
                                                  color: Colors.grey
                                                      .withOpacity(0.4))
                                            ]),
                                        child: const Text(
                                          "Update",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        AuthController().signOut();
                                        Get.to(() => const LoginScreen());
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius15),
                                            boxShadow: [
                                              BoxShadow(
                                                  spreadRadius: 12,
                                                  color: Colors.grey
                                                      .withOpacity(0.4))
                                            ]),
                                        child: const Text(
                                          "Logout",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
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

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['Name'];
      _phoneController.text = documentSnapshot['Phone'];
      _emailController.text = documentSnapshot['Email'];
      _addressController.text = documentSnapshot['Address'];
    }

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                ),
              ),
              TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text('Update'),
                onPressed: () async {
                  final String name = _nameController.text;
                  final String phone = _phoneController.text;
                  final String email = _emailController.text;
                  final String address = _addressController.text;
                  await users.doc(documentSnapshot!.id).update({
                    "Name": name,
                    "Phone": phone,
                    "Email": email,
                    "Address": address
                  });
                  _nameController.text = '';
                  _phoneController.text = '';
                  _emailController.text = '';
                  _addressController.text = '';
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
