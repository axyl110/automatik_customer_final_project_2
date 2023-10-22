import 'package:flutter/material.dart';

class BrakeServices extends StatefulWidget {
  const BrakeServices({super.key});

  @override
  State<BrakeServices> createState() => _BrakeServicesState();
}

class _BrakeServicesState extends State<BrakeServices> {
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
      body: const SafeArea(
        child: Column(
          children: [
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 75.0),
              child: ListTile(
                leading: Icon(
                  Icons.change_circle_outlined,
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
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 75.0),
              child: ListTile(
                leading: Icon(
                  Icons.adjust_outlined,
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
                  "Brake Fluid Replacement",
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
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 75.0),
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
        ),
      ),
    );
  }
}
