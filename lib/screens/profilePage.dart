// import 'package:automatik_customer_final_project/widgets/dimentions.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   User? loggedInUser;
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final CollectionReference users =
//       FirebaseFirestore.instance.collection('customers');

//   @override
//   void initState() {
//     super.initState();

//     getCurrentUser();
//   }

//   void getCurrentUser() async {
//     try {
//       User? user = _auth.currentUser;
//       if (user != null) {
//         setState(() {
//           loggedInUser = user;
//           // print('this is:  ${loggedInUser!.email}');
//         });
//       }
//     } catch (e) {
//       // print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           margin:
//               EdgeInsets.only(top: Dimensions.height20 + Dimensions.height30),
//           width: double.maxFinite,
//           child: Column(
//             children: [
//               Expanded(
//                 child: StreamBuilder<QuerySnapshot>(
//                     stream: FirebaseFirestore.instance
//                         .collection('customers')
//                         .where('Email', isEqualTo: loggedInUser!.email)
//                         .snapshots(),
//                     builder: (BuildContext context,
//                         AsyncSnapshot<QuerySnapshot> snapshot) {
//                       if (!snapshot.hasData) return const Text("Loading...");
//                       return ListView(
//                         children:
//                             snapshot.data!.docs.map((DocumentSnapshot snap) {
//                           return Column(
//                             children: [
//                               SizedBox(height: Dimensions.height20),
//                               Text(snap['Name']),
//                               SizedBox(height: Dimensions.height20),
//                               //phone
//                               Text(snap['Phone']),
//                               SizedBox(height: Dimensions.height20),
//                               //email
//                               Text(snap['Email']),
//                               SizedBox(height: Dimensions.height20),
//                               //address
//                               Text(snap['Address']),
//                               SizedBox(height: Dimensions.height20),
//                             ],
//                           );
//                         }).toList(),
//                       );
//                     }),
//               ),
//             ],
//           )),
//     );
//   }

//   Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
//     if (documentSnapshot != null) {
//       _nameController.text = documentSnapshot['Name'];
//       _phoneController.text = documentSnapshot['Phone'];
//       _emailController.text = documentSnapshot['Email'];
//       _addressController.text = documentSnapshot['Address'];
//     }

//     await showModalBottomSheet(
//         isScrollControlled: true,
//         context: context,
//         builder: (BuildContext ctx) {
//           return Padding(
//             padding: EdgeInsets.only(
//                 top: 20,
//                 left: 20,
//                 right: 20,
//                 bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextField(
//                   controller: _nameController,
//                   decoration: const InputDecoration(labelText: 'Name'),
//                 ),
//                 TextField(
//                   keyboardType:
//                       const TextInputType.numberWithOptions(decimal: true),
//                   controller: _phoneController,
//                   decoration: const InputDecoration(
//                     labelText: 'Phone',
//                   ),
//                 ),
//                 TextField(
//                   keyboardType:
//                       const TextInputType.numberWithOptions(decimal: true),
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                   ),
//                 ),
//                 TextField(
//                   keyboardType:
//                       const TextInputType.numberWithOptions(decimal: true),
//                   controller: _addressController,
//                   decoration: const InputDecoration(
//                     labelText: 'Address',
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ElevatedButton(
//                   child: const Text('Update'),
//                   onPressed: () async {
//                     final String name = _nameController.text;
//                     final String phone = _phoneController.text;
//                     final String email = _emailController.text;
//                     final String address = _addressController.text;
//                     if (name != null &&
//                         phone != null &&
//                         email != null &&
//                         address != null) {
//                       await users.doc(documentSnapshot!.id).update({
//                         "Name": name,
//                         "Phone": phone,
//                         "Email": email,
//                         "Address": address
//                       });
//                       _nameController.text = '';
//                       _phoneController.text = '';
//                       _emailController.text = '';
//                       _addressController.text = '';
//                     }
//                   },
//                 )
//               ],
//             ),
//           );
//         });
//   }
// }
