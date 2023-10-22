import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ACservices.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => ServicesState();
}

class ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.search_outlined,
                  color: Colors.black,
                  size: 20.0,
                ),
                title: Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 125.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const ACServices());
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.ac_unit_outlined,
                    color: Colors.teal,
                    size: 20.0,
                  ),
                  title: Text(
                    'AC Repair and Services',
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            const Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 125.0),
              child: ListTile(
                leading: Icon(
                  Icons.tire_repair_outlined,
                  color: Colors.teal,
                  size: 20.0,
                ),
                title: Text(
                  'Tire Services',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            const Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 125.0),
              child: ListTile(
                leading: Icon(
                  Icons.toys_outlined,
                  color: Colors.teal,
                  size: 20.0,
                ),
                title: Text(
                  "Car Repair",
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ),
            const Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 125.0),
              child: ListTile(
                leading: Icon(
                  Icons.wash_outlined,
                  color: Colors.teal,
                  size: 20.0,
                ),
                title: Text(
                  "Car Wash Services",
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ),
            const Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 125.0),
              child: ListTile(
                leading: Icon(
                  Icons.wash_outlined,
                  color: Colors.teal,
                  size: 20.0,
                ),
                title: Text(
                  "OTHERS",
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
