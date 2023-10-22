import 'package:flutter/material.dart';

class WheelServices extends StatefulWidget {
  const WheelServices({super.key});

  @override
  State<WheelServices> createState() => _WheelServicesState();
}

class _WheelServicesState extends State<WheelServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("WHEEL SERVICES"),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 75.0),
              child: ListTile(
                leading: Icon(
                  Icons.two_wheeler,
                  color: Colors.teal,
                  size: 20.0,
                ),
                title: Text(
                  'Wheel Alignment',
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
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 75.0),
              child: ListTile(
                leading: Icon(
                  Icons.tire_repair_outlined,
                  color: Colors.teal,
                  size: 20.0,
                ),
                title: Text(
                  'Tire Installation and Replacement',
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
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 75.0),
              child: ListTile(
                leading: Icon(
                  Icons.toys_outlined,
                  color: Colors.teal,
                  size: 20.0,
                ),
                title: Text(
                  "Tire Repair",
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 75.0),
              child: ListTile(
                leading: Icon(
                  Icons.find_replace_outlined,
                  color: Colors.teal,
                  size: 20.0,
                ),
                title: Text(
                  "Valve Stem Replacement",
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 75.0),
              child: ListTile(
                leading: Icon(
                  Icons.cleaning_services_outlined,
                  color: Colors.teal,
                  size: 20.0,
                ),
                title: Text(
                  "Wheel Cleaning and Maintenance",
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
