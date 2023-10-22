import 'package:flutter/material.dart';

class EngineServices extends StatefulWidget {
  const EngineServices({super.key});

  @override
  State<EngineServices> createState() => _EngineServicesState();
}

class _EngineServicesState extends State<EngineServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("ENGINE SERVICES"),
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
                  'Oil Change',
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
                  'Belt Tension Adjustment',
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
                  "Ignition Coil Replacement",
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
                  "Coolant Flush",
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
                  "Transmission Fluid Change",
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
