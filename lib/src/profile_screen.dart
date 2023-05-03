import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Algunos datos de ejemplo
  String _name = "";
  String _email = "";
  final String _bio = "Desarrolladores de software apasionados por Flutter! :)";

  @override
  void initState() {
    super.initState();
    setInformacion();
  }

  Future setInformacion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this._name = prefs.getString("name").toString();
    this._email = prefs.getString("email").toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        shadowColor: Color.fromRGBO(0, 0, 128, 4),
        backgroundColor: Color.fromRGBO(0, 0, 128, 4),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 104, 96, 139),
            ),
            child: Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Color.fromRGBO(0, 0, 128, 4),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              _name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              _email,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _bio,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
