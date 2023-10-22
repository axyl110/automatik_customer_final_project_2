import 'package:flutter/material.dart';

class ElectricalServices extends StatefulWidget {
  const ElectricalServices({super.key});

  @override
  State<ElectricalServices> createState() => _ElectricalServicesState();
}

class _ElectricalServicesState extends State<ElectricalServices> {
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
                  'Battery Replacement',
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
                  'Alternator Testing and Replacement',
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
                  "Starter Motor Repair",
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
                  "Fuse Replacement",
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
                  "Accessory Installation and Replacement",
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
