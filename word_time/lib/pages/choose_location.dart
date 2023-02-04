import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:word_time/service/world_time.dart';

class ChooseArea extends StatefulWidget {
  const ChooseArea({super.key});

  @override
  State<ChooseArea> createState() => _ChooseAreaState();
}

class _ChooseAreaState extends State<ChooseArea> {

  
  List<WorldTime> locations= [
    WorldTime(url: 'America/Argentina/La_Rioja', location: 'La_Rioja', flag: 'ARG.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'USA.png'),
    WorldTime(url: 'America/Costa_Rica', location: 'Costa Rica', flag: 'Costa_Rica.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'USA.png'),
    WorldTime(url: 'Asia/Ho_Chi_Minh', location: 'Viet Nam', flag: 'VNA.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'IDN.png'),
    WorldTime(url: 'Europe/London', location: 'United Kingdom', flag: 'UK.png'),

  ];

  void updateTime (index) async {
    WorldTime instance = locations[index];
    await instance.getData();

    Navigator.pop(context, {
      'location':instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isday':instance.isday,
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    // print('Build Function ran');
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 117, 115, 115).withOpacity(0.2),
                      spreadRadius:10,
                      blurRadius: 7,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
    ],
                ),
                child: ListTile(
                  onTap: () {
                    updateTime(index);

                  },
                  title: Text(locations[index].location,
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontWeight: FontWeight.bold
                  ),),
                  
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                  
                  
                ),
              ),
            ),
          );
        }, 
        )
    );
  }
}