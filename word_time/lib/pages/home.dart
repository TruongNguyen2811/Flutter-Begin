import 'package:flutter/material.dart';
import 'package:http/http.dart' ;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  
  @override
  Widget build(BuildContext context) {

    data= data.isNotEmpty ?  data:ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    String bgImage = (data as dynamic)['isday'] ? 'day.jpg': 'night.jpg'; 
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/$bgImage')),
          ),
            child:Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
            children: <Widget>[
              TextButton.icon(
                onPressed: () async{
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time' : result['time'],
                      'location': result['location'],
                      'isday':result['isday'],
                      'flag':result['flag'],
                    };
                  });
                }, 
                icon: Icon(Icons.edit_location), 
                label: Text('Edit Location'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      (data as dynamic)['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,

                       ),
                      )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  (data as dynamic)['time'],
                  style: TextStyle(
                    fontSize: 69,
                  ),
                )
            ],
          ),
            ),
          ),
        ),
    );
  }
}