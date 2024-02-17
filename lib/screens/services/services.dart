import 'package:automatik_customer_final_project/screens/services/BrakeServices.dart';
import 'package:automatik_customer_final_project/screens/services/ElectricalServices.dart';
import 'package:automatik_customer_final_project/screens/services/WheelServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'EngineServices.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => ServicesState();
}

class ServicesState extends State<Services> {
  List<String> selectedServices = [];
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
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 75.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const EngineServices());
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.engineering,
                    color: Colors.teal,
                    size: 20.0,
                  ),
                  title: Text(
                    'ENGINE SERVICES',
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 75.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const WheelServices());
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.tire_repair,
                    color: Colors.teal,
                    size: 20.0,
                  ),
                  title: Text(
                    'WHEEL SERVICES',
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 75.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const BrakeServices());
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.stop,
                    color: Colors.teal,
                    size: 20.0,
                  ),
                  title: Text(
                    "BRAKE SERVICES",
                    style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 75.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const ElectricalServices());
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.electric_car,
                    color: Colors.teal,
                    size: 20.0,
                  ),
                  title: Text(
                    "ELECTRICAL SERVICES",
                    style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
              ),
            ),
            const Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 75.0),
              child: ListTile(
                leading: Icon(
                  Icons.devices_other,
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
