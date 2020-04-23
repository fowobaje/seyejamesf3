import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
  home: Task3(),
  ));
}

class Task3 extends StatefulWidget {
  @override
  _Task3State createState() => _Task3State();
}

class _Task3State extends State<Task3> {

  Map data;
  List userData;

  Future getData() async {
    http.Response response = await http.get('http://www.json-generator.com/api/json/get/cqJWtomVGq?indent=2');
    data = json.decode(response.body);
    setState(() {
      userData = data["data"];
    });
    debugPrint(userData.toString());

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User information"),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext context, int index) {
            return Card(

              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(userData[index]["avatar"]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("${userData[index]["first_name"]} ${userData[index]["last_name"]} ${userData[index]["email"]}")

                      
                    )
                  ],
                ),
              ),
            );
        },
      ),
    );
  }
}
