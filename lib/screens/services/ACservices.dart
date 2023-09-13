import 'package:flutter/material.dart';

class ACServices extends StatefulWidget {
  const ACServices({super.key});

  @override
  State<ACServices> createState() => _ACServicesState();
}

class _ACServicesState extends State<ACServices> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Card(
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
              child: ListTile(
                leading: Icon(
                  Icons.ac_unit_outlined,
                  color: Colors.teal,
                  size: 20.0,
                ),
                title: Text(
                  'AC Installation',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 125.0),
              child: ListTile(
                leading: Icon(
                  Icons.tire_repair_outlined,
                  color: Colors.teal,
                  size: 20.0,
                ),
                title: Text(
                  'AC Repairing',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 125.0),
              child: ListTile(
                leading: Icon(
                  Icons.toys_outlined,
                  color: Colors.teal,
                  size: 20.0,
                ),
                title: Text(
                  "AC Dismounting",
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 125.0),
              child: ListTile(
                leading: Icon(
                  Icons.wash_outlined,
                  color: Colors.teal,
                  size: 20.0,
                ),
                title: Text(
                  "Other AC Services",
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
